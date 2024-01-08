#!/bin/bash
#use xtrabackup

function log() {
        echo "[$(date +"%Y-%m-%d %H:%M:%S")] $*"
}

## local mysql
mysql_host=$(hostname -i)
mysql_port=3306
a=`ls /usr/local/mysql_base_dir/|head -n 1`
user=root
password=$(cat /data/mysql/${mysql_port}/script_files/root.cnf)

mysqld_process=$(ps -ef|grep -w mysqld |grep port=${mysql_port})
# 使用 awk 提取 defaults-file 和 socket 的值
defaults_file=$(echo "${mysqld_process}" | awk -F'--defaults-file=' '{split($2, a, " "); print a[1]}' | tr -d ' ')
socket=$(echo "${mysqld_process}" | awk -F'--socket=' '{split($2, a, " "); print a[1]}' | tr -d ' ')

echo "defaults-file: $defaults_file"
echo "socket: $socket"
myconf=${defaults_file}

#socket="/data/mysql/3306/data/sock/mysql.sock"
#myconf="/data/mysql/3306/conf/my.cnf"

mysql_path=/usr/local/mysql_base_dir/${a}/bin/mysql
conn_mysql="${mysql_path} -uroot -p${password} -S ${socket}"

local_data_dir=/data/mysql/${mysql_port}
scripts_dir=${local_data_dir}/script_files
create_default_user_sql=${scripts_dir}/sql/default_users.sql

## saasdb
saasdb_host="saasdb.dbp.haiercash.com"
saasdb_port=3306
saasdb_admin_passwd=$(cat ${create_default_user_sql} | grep saasdb_admin | grep "CREATE USER" |grep -oP "IDENTIFIED WITH 'mysql_native_password' BY '\K[^']+")
conn_saasdb="${mysql_path} -h ${saasdb_host} -P ${saasdb_port} -usaasdb_admin -p${saasdb_admin_passwd} saasdb"

function get_domain_name() {
    local sql
    sql="SELECT domain_name FROM saas_domain WHERE id IN (SELECT domain_id FROM saas_instance WHERE ip='${mysql_host}' AND port=${mysql_port})"
    output=$(${conn_saasdb} -Nse "${sql}")
    echo ${output}
}

function get_proj_name() {
    local sql
    sql="SELECT B.proj_name FROM saas_domain A ,saas_project B WHERE A.id IN (SELECT domain_id FROM saas_instance WHERE ip='${mysql_host}' AND port=${mysql_port}) AND A.proj_id=B.id"
    output=$(${conn_saasdb} -Nse "${sql}")
    echo ${output}
}

function get_domain_id() {
    local sql
    sql="SELECT domain_id FROM saas_instance WHERE ip='${mysql_host}' AND port=${mysql_port}"
    output=$(${conn_saasdb} -Nse "${sql}")
    echo ${output}
}

function get_ins_id() {
    local sql
    sql="SELECT id FROM saas_instance WHERE ip='${mysql_host}' AND port=${mysql_port}"
    output=$(${conn_saasdb} -Nse "${sql}")
    echo ${output}
}

function get_hub_info() {
    local sql
    sql="SELECT CONCAT(center_addr, '--', center_port, '--', backup_root_dir, '--', login_user, '--', login_password) FROM saas_backup_center WHERE id IN (SELECT idc_id FROM saas_instance WHERE ip = '${mysql_host}')"
    output=$(${conn_saasdb} -Nse "${sql}")
    echo ${output}
}

function get_xtrabackup_path(){
    mysql_version=$(${conn_mysql} -Nse "SELECT VERSION()")
    major_version=$(echo "${mysql_version}" | cut -d'.' -f1-2)
    xtrabackup_ver=""
    if [ "${major_version}" == "5.7" ];then
        xtrabackup_ver=2.4.28
    else 
        xtrabackup_ver=${mysql_version}
    fi


    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    xtrabackup_path_relative="../tools/xtrabackup${xtrabackup_ver}"
    xtrabackup_absolute_path="${script_dir}/${xtrabackup_path_relative}"
    xtrabackup_path=${xtrabackup_absolute_path}/bin/xtrabackup
    echo ${xtrabackup_path}
}

proj_name=$(get_proj_name)
domain_name=$(get_domain_name)

## hub info
hub_addr=$(get_hub_info | awk -F '--' '{print $1}')
hub_sshport=$(get_hub_info | awk -F '--' '{print $2}')
hub_root_dir=$(get_hub_info | awk -F '--' '{print $3}')
hub_user=$(get_hub_info | awk -F '--' '{print $4}')
hub_ssh_user_passwd=$(get_hub_info | awk -F '--' '{print $5}')

## xtrabackup
let routines=$(lscpu | grep -w CPU\(s\) | awk '{print $2}' | head -n 1)/2      # 获取当前机器的CPU核心数，并将其除以2，将结果赋值给变量routines
current_time=$(date +"%Y-%m-%d_%H-%M-%S")   # 当前时间
remote_backup_dir="/data/backup_file_storage/mysql/${proj_name}/${domain_name}/${current_time}_full"  # 定义一个远程备份目录的路径，用于存储指定项目的全量备份文件

yum install -y sshpass
sshpass -p "${hub_ssh_user_passwd}" ssh root@${hub_addr} "mkdir -p ${remote_backup_dir}"  # 在远程主机上创建一个指定的备份目录

xtrabackup=$(get_xtrabackup_path)
backup_cmd="${xtrabackup} --defaults-file=${myconf} \
    --slave-info \
    --parallel=${routines} --compress \
    --safe-slave-backup --safe-slave-backup-timeout=360 \
    --ftwrl-wait-threshold=10 --ftwrl-wait-query-type=all --ftwrl-wait-timeout=10 \
    --kill-long-queries-timeout=40 --kill-long-query-type=SELECT \
    --user=${user} --password=xxxxxx --socket=${socket} \
    --backup  \
    --stream=xbstream \
    --target-dir=./"

backup_log_uuid=$(uuidgen)
target_file="${remote_backup_dir}/$(date +%Y-%m-%d_%H:%M:%S)_fullback.xbstream"

# 备份函数，用于使用Percona XtraBackup工具创建MySQL数据库的全备份，并将其压缩并流式传输到远程主机。
function backup() {
        expect <<EOF
    set timeout 12800;
    spawn bash -c "${xtrabackup} --defaults-file=${myconf} \
    --slave-info \
    --parallel=${routines} --compress \
    --ftwrl-wait-threshold=10 --ftwrl-wait-query-type=all --ftwrl-wait-timeout=10 \
    --kill-long-queries-timeout=40 --kill-long-query-type=SELECT \
    --user=${user} --password=${password} --socket=${socket} \
    --backup  \
    --stream=xbstream \
    --target-dir=./ | ssh root@${hub_addr} \"cat - >${target_file}\""

    expect {
        "*yes/no*" {send "yes\n";exp_continue}
        "*Permission denied*" {exit 1}
        "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
        "*Killed by signal 1" {exit 1}
        }
EOF
#    --safe-slave-backup --safe-slave-backup-timeout=360 \
    fz=$(sshpass -p "${hub_ssh_user_passwd}" ssh root@${hub_addr} "du -sh ${target_file}")
    echo ${fz}
}

function create_backuplog1(){
    local sql
    local sql1
    ## 判断下是否有对应的uuid了
    sql="SELECT COUNT(*) FROM saas_back_log WHERE back_up_uuid = '$backup_log_uuid'" 
    output=$(${conn_saasdb} -Nse "${sql}")
    if [ ${output} -lt 0 ];then
        backup_log_uuid=$(uuidgen)
    fi

    domain_id=$(get_domain_id)
    ins_id=$(get_ins_id)

    sql1="INSERT INTO saas_back_log VALUES (NULL,NOW(),NOW(),NULL,NULL,${domain_id},'xtrafull',0,'backup',
    # CONVERT('{\"instance\":\"${mysql_host}_${mysql_port}\",\"backup_command\":\"${backup_cmd}\",\"target_file\":\"${target_file}\"}' USING utf8mb4),
    CONVERT('{"instance":"${mysql_host}_${mysql_port}","backup_command":"${backup_cmd}","target_file":"${target_file}"}' USING utf8mb4)



    '${backup_log_uuid}',${ins_id})"
    
    ${conn_saasdb} -Nse "${sql1}"
    exit 
}

function create_backuplog() {
    local sql
    local sql1

    ## 判断下是否有对应的 uuid 了
    sql="SELECT COUNT(*) FROM saas_back_log WHERE back_up_uuid = '$backup_log_uuid'"
    output=$(${conn_saasdb} -Nse "${sql}")
    if [ ${output} -lt 0 ]; then
        backup_log_uuid=$(uuidgen)
    fi

    domain_id=$(get_domain_id)
    ins_id=$(get_ins_id)

    json_instance="{\"instance\":\"${mysql_host}_${mysql_port}\",\"backup_command\":\"${backup_cmd}\",\"target_file\":\"${target_file}\"}"
    sql1="INSERT INTO saas_back_log VALUES (NULL, NOW(), NOW(), NULL, NULL, ${domain_id}, 'xtrafull', 0, 'backup', '${json_instance}', '${backup_log_uuid}', ${ins_id})"

    ${conn_saasdb} -Nse "${sql1}"
}

function update_backupstatus(){
  local sql
  sql="UPDATE saas_back_log set updated_at=NOW(),data_size='${fz}',status='${backup_status}' WHERE back_up_uuid='${backup_log_uuid}'"
  ${conn_saasdb} -Nse "${sql}"
}

function start_slave() {
  ${conn_mysql} -Nse "start slave"
}

function main() {
  start_time=$(date +%Y-%m-%d_%H:%M:%S)
  create_backuplog
  backup_log=$(date +%Y-%m-%d_%H:%M:%S)_backup_log
  backup > ${backup_log}
  start_slave

  end_time=$(date +%Y-%m-%d_%H:%M:%S)

  last_line=$(tail -n 1 "${backup_log}")
  fz=$(echo ${last_line}|awk '{print $1}' )
  fp=$(echo ${last_line}|awk '{print $2}')

  success_flag="completed OK!"
  backup_status="failed"
  grep '${success_flag}' ${backup_log}
  if [ $? -eq 0 ];then
    backup_status="success"
  else
    backup_status="failed"
  fi
  update_backupstatus
   
  msg="{\"cluster_name\":\"${domain_name}_${mysql_host}\",\"backup_status\":\"${backup_status}\",\"storage_node\":\"${hub_addr}\",\"file_path\":\"${fp}\",\"file_size\":\"${fz}\",\"start_time\":\"${start_time}\",\"end_time\":\"${end_time}\"}"
  echo ${msg} 
  curl -X POST -H "Content-Type: application/json" -d "${msg}" http://10.166.206.81:21000/api/v1/backup_status
}
main


# --defaults-file=${myconf}：指定配置文件路径
# --no-timestamp：不在备份文件名中使用时间戳
# --slave-info：在备份期间收集从服务器信息
# --parallel=${routines}：指定备份的线程数
# --compress：启用压缩
# --compress-thread=${routines}：指定压缩线程数
# --safe-slave-backup：在备份期间锁定从服务器以确保一致性
# --safe-slave-backup-timeout=360：等待从服务器锁定的时间
# --ftwrl-wait-threshold=10：指定FTWRL（File System Transactional Reads and Writes）等待时间的阈值
# --ftwrl-wait-query-type=all：指定FTWRL等待的查询类型
# --ftwrl-wait-timeout=10：指定FTWRL等待超时时间
# --kill-long-queries-timeout=40：指定长时间运行的查询的超时时间
# --kill-long-query-type=SELECT：指定长时间运行的查询的类型
# --user=${user}：指定MySQL用户
# --password=${password}：指定MySQL用户密码
# --socket=${socket}：指定MySQL socket文件路径
# --backup：执行备份操作
# --stream=xbstream：指定备份输出格式
# --target-dir=./：指定备份目录
# | ssh root@${host_addr} "cat - >${remote_backup_dir}/$(date +%Y-%m-%d_%H:%m:%S)_fullback.xbstream"：将备份数据流传输到远程主机并存储在指定目录下的文件中。

# expect是一个自动化交互式工具，通常用于在Shell脚本中自动完成交互式任务。
# 在上述代码中，expect命令会读取<<EOF与下一个出现的EOF之间的所有内容作为输入，并将其发送给正在运行的命令。
# 在这个例子中，expect命令可能会读取一些需要用户输入交互的命令，例如用户名和密码。
# 通过在脚本中使用expect命令，可以自动化这些交互式任务，使得脚本可以完全自动运行。