#!/bin/bash
#===========================================================================================
#     FileName: create_mysql57_one.sh
#         Desc: [saasdb] Initialize a single MySQL database instance service .
#       Author: milky star
#        Email: chenhao@corp.netease.com
#      History: 1. 完成首发与调试
#    Functions: 1.用于实现5.7版本,MySQL数据库,单个实例的创建
#               2.数据库初始用户创建 项目dba: proj_dba,复制用户:repl_user,备份用户:backup_user
#               3.开启cron任务，mysql数据库日志的按天分割
#    exit code: 0 正常退出脚本
#               100 数据库端口已占用
#               101 数据库启动失败
#               200 未知错误
#===========================================================================================

function log() {
	echo "[$(date +"%Y-%m-%d %H:%M:%S")] $*"
}

function parseopt() {

	TEMP=$(getopt -o v:p:r:R:b:B:m:M:i:P:d:s:S:H: \
		--long version:,passwd:,repl_user:,repl_user_passwd:,backup_user:,backup_user_passwd:,max_memory:,max_connections:, hub_ip:,hub_port:,hub_dir:,hub_ssh_user:,hub_ssh_user_passwd:,host_id: \
		-n 'create_mysql57_one.sh' -- "$@")
	if [ $? -ne 0 ]; then
		echo "Terminating..." >&2
		on_failure 1
	fi
	eval set -- "$TEMP"
	while true; do
		case "$1" in
		-v | --version)
			# shellcheck disable=SC2034
			version="$2"
			shift 2
			;;
		-p | --port)
			port="$2"
			shift 2
			;;
		-r | --repl_user)
			repl_user="$2"
			;;
		-R | --repl_user_passwd)
			repl_user_passwd="$2"
			;;
		-b | --backup_user)
			backup_user="$2"
			;;
		-B | --backup_user_passwd)
			backup_user_passwd="$2"
			;;
		-m | --max_memory)
			max_memory="$2"
			;;
		-M | --max_connections)
			max_connections="$2"
			;;
		-i | --hub_ip)
			hub_ip="$2"
			;;
		-P | --hub_port)
			hub_port="$2"
			;;
		-d | --hub_dir)
			hub_dir="$2"
			;;
		-s | --hub_ssh_user)
			hub_ssh_user="$2"
			;;
		-S | --hub_ssh_user_passwd)
			hub_ssh_user_passwd="$2"
			;;
		-H | --host_id)
			host_id="$2"
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
	echo "USAGE:"
	echo "
    -v | --version)
		-p | --port)
		-r | --repl_user)
	  -R | --repl_user_passwd)
	  -b | --backup_user)
	  -B | --backup_user_passwd)
	  -m | --max_memory)
	  -M | --max_connections)
	  -i | --hub_ip)
	  -P | --hub_port)
	  -d | --hub_dir)
	  -s | --hub_ssh_user)
	  -S | --hub_ssh_user_passwd)
	  -H | --host_id)
    "
}
# shellcheck disable=SC2120
function download_mysql_package() {
	remote_basedir_File=/home/saasdb_db_package/mysql/57/${version}/basedir
	# 包含datadir和特定的用户授权信息
	remote_datadir_File=/home/saasdb_db_package/mysql/57/${version}/datadir

	#修改配置文件，如果是需要binlog，serverid取saasdb数据库中saas_instance表的primary key
	local_base_dir=/root/mysql_base_dir/${version}
	local_data_dir=/data/mysql/${port}
	# 配置文件
	local_mysqld_conf=${local_data_dir}/conf/my.cnf
	#判断本地是否含有basedir
	# 不存在basedir就
	if [ ! -d "$remote_basedir_File" ]; then
		echo "目录不存在"
		expect <<EOF
       set timeout 1200;
       spawn scp -P${hub_port} -r -p ${hub_ssh_user}@${hub_ip}:"${remote_basedir_File}" "${local_base_dir}"
       expect{
         "*yes/no*" {send "yes\n";exp_continue}
         "*Permission denied*" {exit 1}
         "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
         "*Killed by signal 1" {exit 1}
       }
EOF
	else
		echo "未知错误"
		on_failure 200
	fi

	#判断本地是否含有datadir
	if [ -d "$remote_basedir_File" ]; then
		log "${local_data_dir} 存在，备份该目录"
		day=$(date +"%Y-%m-%d")
		mv "${local_data_dir}" "${local_data_dir}"_"${day}"
	fi
	#copy_datadir和配置文件

	expect <<EOF
       set timeout 1200;
       spawn scp -P${hub_port} -r -p ${hub_ssh_user}@${hub_ip}:"${remote_datadir_File}" "${local_data_dir}"
       expect{
         "*yes/no*" {send "yes\n";exp_continue}
         "*Permission denied*" {exit 1}
         "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
         "*Killed by signal 1" {exit 1}
         }
EOF

}

function start_mysql() {
	# 不需要确认文件属主
	# TODO 调整为使用 tcmalloc

	${local_base_dir}/bin/mysqld_safe --defaults-file=${local_mysqld_conf} --user=mysql &
	sleep 10
	ps -ef | grep -w mysqld_safe | grep ${port} | grep -v grep
	if [ $? -eq 1]; then
		log "${port} 数据库启动失败"
		on_failure 101
	fi
}

function stop_mysql() {
	mysqld_safe_pid=$(ps -ef | grep -w mysqld_safe | grep ${port} | grep -v grep | awk -F '{print $2}')
	mysqld_pid=$(ps -ef | grep -w mysqld | grep ${port} | grep -v grep | awk -F '{print $2}')
	kill -9 ${mysqld_safe_pid} ${mysqld_pid}
}

# func init_conf
# 完成配置文件中
# port
# server_id
# auto.cnf
# 会话级别的参数
# max_connection 参数
# buffer pool 参数
# 和涉及到datadir前缀相关的
# 的替换
# 其中auto.cnf在源文件中就清理掉即可 就不需要手动清理了
function init_conf() {

	port_placeholder="PORT_PLACEHOLDER"
	sed -i "s/${port}/${port_placeholder}/g" ${local_mysqld_conf}

	# server_id
	server_id_placeholder="SERVER_ID_PLACEHOLDER"
	sed -i "s/${host_id}/${server_id_placeholder}/g" ${local_mysqld_conf}

	# max_connection
	max_connection_placeholder="MAX_CONN_PLACEHOLDER"
	sed -i "s/${max_connection}/${max_connection_placeholder}/g" ${local_mysqld_conf}

	# innodb_buffer_pool
	innodb_buffer_pool_size=$((${max_memory} / 8 * 10))
	innodb_buffer_pool_placeholder="INNODB_BUFFER_POOL_SIEZ_PLACEHOLDER"
	sed -i "s/${innodb_buffer_pool_size}/${innodb_buffer_pool_placeholder}/g" ${local_mysqld_conf}

	#prefix替换
	config_file_prefix="PREFIX"
	sed -i "s/${local_data_dir}/${config_file_prefix}/g" ${local_mysqld_conf}

	if [ ${max_memory} -lt 16 ]; then
		sort_buffer_size=256K
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
		tmp_table_size=32M
		bulk_insert_buffer_size=2M
		thread_stack=128K
	fi
	sort_buffer_size_placeholder="SORT_BUFFER_SIZE_PLACEHOLDER"
	join_buffer_size_placeholder="JOIN_BUFFER_SIZE_PLACEHOLDER"
	read_buffer_size_placeholder="READ_BUFFER_SIZE_PLACEHOLDER"
	tmp_table_size_placeholder="TMP_TABLE_SIZE_PLACEHOLDER"
	bulk_insert_buffer_size_placeholder="BULK_INSERT_BUFFER_SIZE_PLACEHOLDER"
	thread_stack_placeholder="THREAD_STACK"

	sed -i "s/${sort_buffer_size}/${sort_buffer_size_placeholder} g" ${local_mysqld_conf}
	sed -i "s/${join_buffer_size}/${join_buffer_size_placeholder} g" ${local_mysqld_conf}
	sed -i "s/${read_buffer_size}/${read_buffer_size_placeholder} g" ${local_mysqld_conf}
	sed -i "s/${tmp_table_size}/${tmp_table_size_placeholder} g" ${local_mysqld_conf}
	sed -i "s/${bulk_insert_buffer_size}/${bulk_insert_buffer_size_placeholder} g" ${local_mysqld_conf}
	sed -i "s/${thread_stack}/${thread_stack_placeholder} g" ${local_mysqld_conf}

}
function init_mysql() {
  scripts_dir=${local_data_dir}/scripts
  default_root_passwd=$(cat ${scripts_dir}/root.cnf)
	conn_local_mysql="${local_base_dir}/bin/mysql -uroot -p${default_root_passwd} "

	${conn_local_mysql} < default_users.sql
	# 清理binlog保证数据库无事务信息
	${conn_local_mysql} -e "RESET MASTER"
}
# shellcheck disable=SC2120
function main() {
	parseopt "$@"
	#检查是否存在端口占用
	if lsof -Pi :"${port}" -sTCP:LISTEN -t >/dev/null; then
		log "Port is in use"
		on_failure 100
	else
		log "Port is free"
	fi
	# 下载依赖文件
	download_mysql_package
	# 初始化配置文件
	init_conf
	# 启动数据库资源
	start_mysql
	# 完成init
	init_mysql
	# 完成
}

function on_success() {
	exit 0
}

function on_failure() {
	exit $1
}
main "$@"
