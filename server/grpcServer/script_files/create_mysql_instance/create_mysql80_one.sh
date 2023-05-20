#!/bin/bash
#===========================================================================================
#     FileName: create_mysql57_one.sh
#         Desc: [saasdb] Initialize a single MySQL database instance service .
#       Author: milky star
#        Email: ch1yanzhi@163.com
#      History: 1. 完成首发与调试
#    Functions: 1.用于实现8.0版本,MySQL数据库,单个实例的创建
#               2.数据库初始用户创建，具体建default_user80.sql
#               3.开启cron任务，mysql数据库日志的按天分割
#               4.开启MySQL数据库监控，基于pmm
#    exit code: 0   正常退出脚本
#               100 数据库端口已占用
#               101 数据库启动失败
#               102 目标端口被占用且无可用端口
#               200 未知错误
#===========================================================================================

function log() {
	echo "[$(date +"%Y-%m-%d %H:%M:%S")] $*"
}

function parseopt() {
	if [ $# -lt 10 ]; then
		echo "wrong options"
		print_usage
		exit 1
	fi
	TEMP=$(getopt -o v:h:p:m:M:i:P:d:s:S:H:A:a:B:b:C:c: --long version:,host_ip:,port:,max_memory:,max_connections:,hub_ip:,hub_port:,hub_dir:,hub_ssh_user:,hub_ssh_user_passwd:,host_id:,pmm_server_host:,pmm_server_port:,pmm_server_user:,pmm_server_pass:,cluster_name_alias:,model_db_password: -- "$@")
	if [ $? -ne 0 ]; then
		echo "Terminating..." >&2
		print_usage
		on_failure 1
	fi
	eval set -- "$TEMP"
	while true; do
		case "$1" in
		-v | --version)
			version="$2"
			shift 2
			;;
		-h | --host_ip)
			host_ip="$2"
			shift 2
			;;
		-p | --port)
			port="$2"
			shift 2
			;;
		-m | --max_memory)
			max_memory="$2"
			shift 2
			;;
		-M | --max_connections)
			max_connections="$2"
			shift 2
			;;
		-i | --hub_ip)
			hub_ip="$2"
			shift 2
			;;
		-P | --hub_port)
			hub_port="$2"
			shift 2
			;;
		-d | --hub_dir)
			hub_dir="$2"
			shift 2
			;;
		-s | --hub_ssh_user)
			hub_ssh_user="$2"
			shift 2
			;;
		-S | --hub_ssh_user_passwd)
			hub_ssh_user_passwd="$2"
			shift 2
			;;
		-H | --host_id)
			host_id="$2"
			shift 2
			;;
		-A | --pmm_server_host)
			pmm_server_host="$2"
			shift 2
			;;
		-a | --pmm_server_port)
			pmm_server_port="$2"
			shift 2
			;;
		-B | --pmm_server_user)
			pmm_server_user="$2"
			shift 2
			;;
		-b | --pmm_server_pass)
			pmm_server_pass="$2"
			shift 2
			;;
		-C | --cluster_name_alias)
			cluster_name_alias="$2"
			shift 2
			;;
		-c | --model_db_password)
			model_db_password="$2"
			shift 2
			;;
		--)
			shift
			break
			;;
		*)
			echo "Invalid option: $1" >&2
			print_usage
			on_failure 1
			;;
		esac
	done
}

# shellcheck disable=SC2120
function print_usage() {
	on_debug
	echo "USAGE:"
	echo "
-v | --version)
-h | --host_ip)
-p | --port)
-m | --max_memory)
-M | --max_connections)
-i | --hub_ip)
-P | --hub_port)
-d | --hub_dir)
-s | --hub_ssh_user)
-S | --hub_ssh_user_passwd)
-H | --host_id)
-A | --pmm_server_host)
-a | --pmm_server_port)
-B | --pmm_server_user)
-b | --pmm_server_pass)
    "
}
# shellcheck disable=SC2120
function download_mysql_package() {
	remote_basedir_File=${hub_dir}/mysql/80/${version}/basedir
	# 包含datadir和特定的用户授权信息
	remote_datadir_File=${hub_dir}/mysql/80/${version}/datadir

	#修改配置文件，如果是需要binlog，serverid取saasdb数据库中saas_instance表的primary key
	# 不要放在/root 下 ，会报错没权限
	local_base_dir=/usr/local/mysql_base_dir
	local_data_dir=/data/mysql/${port}
	mkdir -p ${local_base_dir}
	mkdir -p /data/mysql

	# 配置文件
	local_mysqld_conf=${local_data_dir}/conf/my.cnf
	#判断本地是否含有basedir
	# 不存在basedir就

	if [ -d "${local_base_dir}/${version}" ]; then
		echo "目录存在"
	else
		echo "目录不存在"
		expect <<EOF
       set timeout 1200;
       spawn scp -P${hub_port} -r -p ${hub_ssh_user}@${hub_ip}:"${remote_basedir_File}" "${local_base_dir}"
       expect {
         "*yes/no*" {send "yes\n";exp_continue}
         "*Permission denied*" {exit 1}
         "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
         "*Killed by signal 1" {exit 1}
       }
EOF
		cd ${local_base_dir} && mv basedir $version
	fi

	#判断本地是否含有datadir
	if [ -d "${local_data_dir}" ]; then
		log "${local_data_dir} 存在，备份该目录"
		day=$(date +"%Y-%m-%d")
		mv "${local_data_dir}" "${local_data_dir}"_"${day}"
	fi
	#copy_datadir和配置文件

	expect <<EOF
       set timeout 1200;
       spawn scp -P${hub_port} -r -p ${hub_ssh_user}@${hub_ip}:"${remote_datadir_File}" "${local_data_dir}"
       expect {
         "*yes/no*" {send "yes\n";exp_continue}
         "*Permission denied*" {exit 1}
         "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
         "*Killed by signal 1" {exit 1}
         }
EOF

	# 授权
	if id "mysql" &>/dev/null; then
		log "User exists"
	else
		log "User does not exist"
		useradd mysql
	fi

	chown -R mysql:mysql ${local_base_dir}
	chown -R mysql:mysql ${local_data_dir}

}

function start_mysql() {
	# 不需要确认文件属主
	# TODO 调整为使用 tcmalloc
	${local_base_dir}/${version}/bin/mysqld_safe --defaults-file=${local_mysqld_conf} --user=mysql &
	sleep 30
	ps -ef | grep -w mysqld_safe | grep ${port} | grep -v grep
	if [ $? -eq 1 ]; then
		log "${port} 数据库启动失败"
		on_failure 101
	fi
}

### kill mysqld
function kill_mysql() {
	mysqld_safe_pid=$(ps -ef | grep -w mysqld_safe | grep ${port} | grep -v grep | awk '{print $2}')
	mysqld_pid=$(ps -ef | grep -w mysqld | grep ${port} | grep -v grep | awk '{print $2}')
	kill -9 ${mysqld_safe_pid} ${mysqld_pid}
}

### stop mysqld

function stop_mysql() {
	${local_base_dir}/${version}/bin/mysqladmin --user="root" -p${default_root_passwd} -S ${local_data_dir}/data/sock/mysql.sock shutdown
}

# func init_conf
# 完成配置文件中
# port
# server_id
# auto.cnf
# 会话级别的参数
# max_connections 参数
# buffer pool 参数
# 和涉及到datadir前缀相关的
# 的替换
# 其中auto.cnf在源文件中就清理掉即可 就不需要手动清理了
function init_conf() {

	port_placeholder="MYSQLD_PORT_PLACEHOLDER"
	sed -i "s/${port_placeholder}/${port}/g" ${local_mysqld_conf}

	admin_port=${port}1
	admin_port_placeholder="ADMIN_PORT_PLACEHOLDER"
	sed -i "s/${admin_port_placeholder}/${admin_port}/g" ${local_mysqld_conf}

	mysqlx_port=${port}2
	mysqlx_port_placeholder="MYSQLX_PORT_PLACEHOLDER"
	sed -i "s/${mysqlx_port_placeholder}/${mysqlx_port}/g" ${local_mysqld_conf}

	# server_id
	server_id_placeholder="SERVER_ID_PLACEHOLDER"
	sed -i "s/${server_id_placeholder}/${host_id}/g" ${local_mysqld_conf}

	# max_connection
	max_connections_placeholder="MAX_CONN_PLACEHOLDER"
	sed -i "s/${max_connections_placeholder}/${max_connections}/g" ${local_mysqld_conf}

	# innodb_buffer_pool
	num=${max_memory}                                                   # 要计算的整数
	percent=0.8                                                         # 要计算的百分比
	innodb_buffer_pool_size=$(echo "scale=0; $num * $percent / 1" | bc) # 乘以80%并取整
	innodb_buffer_pool_placeholder="INNODB_BUFFER_POOL_SIEZ_PLACEHOLDER"
	sed -i "s/${innodb_buffer_pool_placeholder}/${innodb_buffer_pool_size}G/g" ${local_mysqld_conf}

	#prefix替换
	config_file_prefix="PREFIX"
	sed -i "s#${config_file_prefix}#${local_data_dir}#g" ${local_mysqld_conf}

	#basedir替换
	basedir_placeholder="BASEDIR_PLACEHOLDER"
	basedir_cnf="${local_base_dir}/${version}"
	sed -i "s#${basedir_placeholder}#${basedir_cnf}#g" ${local_mysqld_conf}

	#report_host替换
	report_host_prefix="REPORT_HOST_PLACEHOLDER"
	sed -i "s#${report_host_prefix}#${host_ip}#g" ${local_mysqld_conf}

	if [ ${max_memory} -lt 16 ]; then
		sort_buffer_size=128K
		join_buffer_size=128K
		read_buffer_size=128K
		read_rnd_buffer_size=256K
		tmp_table_size=1M
		bulk_insert_buffer_size=1M
		thread_stack=128K
	else
		sort_buffer_size=2M
		join_buffer_size=1M
		read_buffer_size=1M
		read_rnd_buffer_size=1M
		tmp_table_size=4M
		bulk_insert_buffer_size=2M
		thread_stack=128K
	fi
	sort_buffer_size_placeholder="SORT_BUFFER_SIZE_PLACEHOLDER"
	join_buffer_size_placeholder="JOIN_BUFFER_SIZE_PLACEHOLDER"
	read_buffer_size_placeholder="READ_BUFFER_SIZE_PLACEHOLDER"
	read_rnd_buffer_size_placeholder="READ_RND_BUFFER_SIZE_PLACEHOLDER"
	tmp_table_size_placeholder="TMP_TABLE_SIZE_PLACEHOLDER"
	bulk_insert_buffer_size_placeholder="BULK_INSERT_BUFFER_SIZE_PLACEHOLDER"
	thread_stack_placeholder="THREAD_STACK_PLACEHOLDER"

	sed -i "s/${sort_buffer_size_placeholder}/${sort_buffer_size}/g" ${local_mysqld_conf}
	sed -i "s/${join_buffer_size_placeholder}/${join_buffer_size}/g" ${local_mysqld_conf}
	sed -i "s/${read_buffer_size_placeholder}/${read_buffer_size}/g" ${local_mysqld_conf}
	sed -i "s/${read_rnd_buffer_size_placeholder}/${read_rnd_buffer_size}/g" ${local_mysqld_conf}
	sed -i "s/${tmp_table_size_placeholder}/${tmp_table_size}/g" ${local_mysqld_conf}
	sed -i "s/${bulk_insert_buffer_size_placeholder}/${bulk_insert_buffer_size}/g" ${local_mysqld_conf}
	sed -i "s/${thread_stack_placeholder}/${thread_stack}/g" ${local_mysqld_conf}

}
function init_mysql() {
	scripts_dir=${local_data_dir}/script_files
	default_root_passwd=$(tr </dev/urandom -dc _A-Z-a-z-0-9 | head -c16)
	echo ${default_root_passwd} >${scripts_dir}/root.cnf
	create_default_user_sql=${scripts_dir}/sql/default_users.sql

  if [ -z "${model_db_password}" ] ;then
    model_db_password='letsg0'
  fi
	## 修改root默认密码 （修改数据库密码 由模版数据库密码改为生成的16位密码）
	modify_root_password_sql="ALTER USER root@'%' IDENTIFIED BY '${default_root_passwd}';ALTER USER root@'localhost' IDENTIFIED BY '${default_root_passwd}'"
	${local_base_dir}/$version/bin/mysql --defaults-file=${local_mysqld_conf} -uroot -p${model_db_password} -S ${local_data_dir}/data/sock/mysql.sock -e "${modify_root_password_sql}"

	conn_local_mysql="${local_base_dir}/$version/bin/mysql --defaults-file=${local_mysqld_conf} -uroot -p${default_root_passwd} -S ${local_data_dir}/data/sock/mysql.sock"

	${conn_local_mysql} <${create_default_user_sql}
	init_meta_cluster_sql="INSERT INTO cluster (anchor, cluster_name, cluster_domain)
                         VALUES (1, '${cluster_name_alias}', '@@hostname')
                         ON DUPLICATE KEY UPDATE cluster_name=VALUES(cluster_name),
                         cluster_domain=VALUES(cluster_domain);"
	${conn_local_mysql} meta -e "${init_meta_cluster_sql}"
	# 清理binlog保证数据库无事务信息
	${conn_local_mysql} -e "RESET MASTER"
}

function add_comment_to_semi() {
	semi_flag="loose-rpl_semi_sync_"
	sed -i "/${semi_flag}/ s/^/#/" ${local_mysqld_conf}

}

function clear_comment_to_semi() {
	semi_flag="loose-rpl_semi_sync_"
	sed -i "/${semi_flag}/ s/^#//" ${local_mysqld_conf}
}

# shellcheck disable=SC2120
function main() {
	set -e
	parseopt "$@"
	on_debug
	install_depend_commands

	admin_port=${port}1
	mysqlx_port=${port}2

	#检查是否存在端口占用
	for i in ${port} ${admin_port} ${mysqlx_port}; do
		if lsof -Pi :"${i}" -sTCP:LISTEN -t >/dev/null; then
			log "Port is in use"
			on_failure 100
		else
			log "Port is free"
		fi
	done

	# 下载依赖文件
	download_mysql_package
	# 初始化配置文件
	init_conf
	add_comment_to_semi
	# 启动数据库资源
	start_mysql
	# 完成init
	init_mysql
	kill_mysql
	clear_comment_to_semi
	start_mysql
	add_monitor
	# 完成
	on_success

}

function on_debug() {
	log "/bin/bash $0
--port ${port}
--max_memory ${max_memory}
--max_connections ${max_connections}
--hub_ip ${hub_ip}
--hub_port ${hub_port}
--hub_dir ${hub_dir}
--hub_ssh_user ${hub_ssh_user}
--hub_ssh_user_passwd ${hub_ssh_user_passwd}
--host_id ${host_id}"
}

function download_monitor_package() {
	local tmp_dir=/tmp
	PMM_DIR=${local_monitor_dir}/pmm2
	pmm_server_addr="${pmm_server_host}:${pmm_server_port}"
	#	Change the path.
	export PATH=${PATH}:${PMM_DIR}/bin
	#判断本地是否含有monitor文件

	if [ -d "${PMM_DIR}" ]; then
		echo "目录存在"
	else
		echo "目录不存在"
		expect <<EOF
           set timeout 1200;
           spawn scp -P${hub_port} -r -p ${hub_ssh_user}@${hub_ip}:"${remote_monitor_File}/pmm2" "${tmp_dir}"
           expect {
             "*yes/no*" {send "yes\n";exp_continue}
             "*Permission denied*" {exit 1}
             "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
             "*Killed by signal 1" {exit 1}
           }
EOF

		#	Run the installer.
		cd ${tmp_dir}/pmm2 && ./install_tarball
	fi

	# 检查pmm-agent是否运行
	if [ $(check_process_exists "pmm-agent") -eq 1 ]; then
		#	Set up the agent (pick the command for you depending on permissions)
		pmm-agent setup \
			--config-file=/usr/local/percona/pmm2/config/pmm-agent.yaml \
			--server-address=${pmm_server_addr} --server-insecure-tls \
			--server-username=${pmm_server_user} \
			--server-password=${pmm_server_pass}
		#Run the agent. 默认使用7777端口
		pmm-agent --config-file=${PMM_DIR}/config/pmm-agent.yaml \
			--server-address=${pmm_server_addr} --server-insecure-tls \
			--server-username=${pmm_server_user} \
			--server-password=${pmm_server_pass} &
	fi

	# 确认本数据库的实例名称，采用ip_port的方式
	instance_name="${host_ip}_${port}"
	local local_mysql_pmm_user="pmm"
	local local_mysql_pmm_user_passwd=$(cat ${create_default_user_sql} | grep pmm | grep "CREATE USER" |
		awk -F "CREATE USER 'pmm'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY" '{print $2}' |
		awk -F "'" '{print $2}')
  sleep 2
	pmm-admin add mysql \
		--username="${local_mysql_pmm_user}" --password="${local_mysql_pmm_user_passwd}" \
		--server-insecure-tls \
		--server-url=https://${pmm_server_user}:${pmm_server_pass}@${pmm_server_host}:${pmm_server_port} \
		--query-source=perfschema ${instance_name} --socket=${local_data_dir}/data/sock/mysql.sock && on_success || on_failure

}

# 下载exporter
function download_exporter_package() {

	#判断本地是否含有monitor文件

	if [ -d "${local_monitor_dir}/node_exporter" ]; then
		echo "目录存在"
	else
		echo "目录不存在"
		expect <<EOF
       set timeout 1200;
       spawn scp -P${hub_port} -r -p ${hub_ssh_user}@${hub_ip}:"${remote_monitor_File}" "${local_monitor_base}"
       expect {
         "*yes/no*" {send "yes\n";exp_continue}
         "*Permission denied*" {exit 1}
         "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
         "*Killed by signal 1" {exit 1}
       }
EOF
	fi
}

function run_exporter() {

	if [ $(check_process_exists "node_exporter") -eq 1 ]; then
		# 判断9100端口是否被占用
		local port=9100
		if lsof -Pi :$port -sTCP:LISTEN -t >/dev/null; then
			# 端口被占用
			pid=$(netstat -tlnp | grep ":$port" | awk '{print $NF}' | awk -F'/' '{print $1}')
			log "Port $port is occupied by PID $pid."
			# 获取比目标端口大但最接近目标端口的空闲端口
			available_port=$(ss -tnl | awk '{print $4}' | awk -F':' '{print $NF}' | sort -rn | awk -v port=$port '$1 > port {print $1; exit}' | awk 'END{print ($0 == "") ? port + 1 : $0 + 1}')
			echo "Try to start service on port $new_port instead."
		else
			# 9100端口未被占用
			available_port=$port
		fi
		#		echo "Starting node_exporter on port $available_port"
		#		NODE_EXPORT_BIN="${local_monitor_dir}/node_exporter/node_exporter"
		#		exec ${NODE_EXPORT_BIN} \
		#			--web.listen-address=:$available_port \
		#			--collector.tcpstat \
		#			--collector.systemd \
		#			--collector.mountstats \
		#			--collector.meminfo_numa \
		#			--collector.interrupts \
		#			--collector.buddyinfo \
		#			--collector.vmstat.fields="^.*" \
		#			--log.level="info" &
	fi

	#  如何持久化这部分内容
	#  如何保证如果有节点故障，新来的exporter不会占用这个断端口
	#  通过pmm-agent统一管理
}

function check_process_exists() {
	if pidof -x "$@" >/dev/null; then
		echo 0
	else
		echo 1
	fi
}

#Add database monitoring
function add_monitor() {
	remote_monitor_File=${hub_dir}/monitor/mysql_monitor/percona
	local_monitor_base=/usr/local
	local_monitor_dir=${local_monitor_base}/percona
	mkdir -p ${local_monitor_dir}
	#	download_exporter_package
	#	run_exporter
	download_monitor_package
}
function install_depend_commands() {
	yum install -y expect lsof bc
}
function conn_saasdb() {
	#get passwd of saasdb_admin user
	local sql="$@"
	saasdb_admin_passwd=$(cat ${create_default_user_sql} | grep saasdb_admin | grep "CREATE USER" |
		awk -F "IDENTIFIED WITH 'mysql_native_password' BY" '{print $2}' |
		awk '{print $1}')
	# shellcheck disable=SC2037
	conn2saasdb="${local_base_dir}/$version/bin/mysql -usaasdb_admin -p${saasdb_admin_passwd} saasdb" -e ${sql}
}

function on_success() {
	exit 0
}

function on_failure() {
	exit $1
}
main "$@"
