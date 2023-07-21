#!/bin/bash
#===========================================================================================
#     FileName: create_mongod.sh
#         Desc: [saasdb] Initialize a single Mongo database instance service .
#       Author: milky star
#        Email: ch1yanzhi@163.com
#      History: 1. 完成首发与调试
#    Functions: 1.用于实现mongodb数据库,单个实例的创建
#               2.开启mongodb数据库监控，基于pmm
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
	TEMP=$(getopt -o v:h:p:m:M:i:P:d:s:S:A:a:B:b:C:c:O:R: --long version:,port:,max_memory:,max_connections:,hub_ip:,hub_port:,hub_dir:,hub_ssh_user:,hub_ssh_user_passwd:,pmm_server_host:,pmm_server_port:,pmm_server_user:,pmm_server_pass:,cluster_name_alias:,keyfile_secret:,oplog_size:,cluster_role: -- "$@")
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
		-c | --keyfile_secret)
			keyfile_secret="$2"
			shift 2
			;;
		-O | --oplog_size)
			oplog_size="$2"
			shift 2
			;;
		-R | --cluster_role)
			cluster_role="$2"
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

	check_variables ${cluster_name_alias} ${oplog_size}

}
check_same_state() {
	variables=("$@")
	first_state=""

	for var in "${variables[@]}"; do
		if [[ -z "$var" ]]; then
			state="empty"
		else
			state="non-empty"
		fi

		if [[ -z "$first_state" ]]; then
			first_state="$state"
		elif [[ "$state" != "$first_state" ]]; then
			echo "Variables ${variables} 必须同时指定."
			return
		fi
	done

	echo "Variables are in the same state: $first_state"
}

check_variables() {
	var1="$1"
	var2="$2"

	if [[ -n "$var2" && -z "$var1" ]]; then
		echo "Variable ${var1} 必须要设置 when Variable ${var2} is set."
		exit 1
	fi
}

function install_depend_commands() {
	yum install -y expect lsof bc supervisor
	systemctl enable supervisord
	systemctl start supervisord
}
function make_sure_port_in_use_or_not() {
	# shellcheck disable=SC2124
	local check_port="$@"
	#检查是否存在端口占用
	if lsof -Pi :"${check_port}" -sTCP:LISTEN -t >/dev/null; then
		log "Port is in use, please choose a new port to run mongodb server ..."
		on_failure 100
	else
		log "Port is free, can use ${check_port} to run mongodb server ..."
	fi
}

# download_mongodb_package 安装mongodb相关二进制文件
function download_mongodb_package() {
	# shellcheck disable=SC2124
	ver="$@"
	local big_ver="${ver%.*}"
	remote_basedir_File=${hub_dir}/mongodb/${big_ver}/${version}/basedir
	# 包含datadir和特定的用户授权信息
	remote_datadir_File=${hub_dir}/mongodb/${big_ver}/${version}/datadir

	# 修改配置文件
	# 不要放在/root 下 ，会报错没权限
	local_base_dir=/usr/local/mongodb_base_dir
	local_data_dir=/data/mongodb/${port}
	mkdir -p ${local_base_dir}
	mkdir -p /data/mongodb

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
}
function init_conf() {
	# 配置文件
	# port
	local_mongod_conf=${local_data_dir}/conf/mongod.cnf
	mongod_port_placeholder="MONGOD_PORT_PLACEHOLDER"
	sed -i "s/${mongod_port_placeholder}/${port}/g" ${local_mongod_conf}
	# memory size

	# cacheSizeGB
	num=${max_memory}                                       # 要计算的整数
	percent=0.8                                             # 要计算的百分比
	cacheSizeGB=$(echo "scale=0; $num * $percent / 1" | bc) # 乘以80%并取整
	cacheSizeGB_placeholder="CACHE_SIZE_GB_PLACEHOLDER"
	sed -i "s/${cacheSizeGB_placeholder}/${cacheSizeGB}/g" ${local_mongod_conf}

	# max connections
	max_connections_placeholder="MAX_CONN_PLACEHOLDER"
	sed -i "s/${max_connections_placeholder}/${max_connections}/g" ${local_mongod_conf}

	# rs config
	## rs name
	rs_name_placeholder="RS_NAME_PLACEHOLDER"
	sed -i "s/${rs_name_placeholder}/${cluster_name_alias}/g" ${local_mongod_conf}
	## oplog size
	oplog_size_placeholder="OPLOG_PLACEHOLDER"
	if [ -z "${oplog_size}" ]; then
		## 单位为mb
		oplog_size=5120
	fi
	sed -i "s/${oplog_size_placeholder}/${oplog_size}/g" ${local_mongod_conf}
	# key file
	## 根据 rs name base64生成secret,作为keyfile的内容,并修改权限为400
	## 这里 加一个判断，如果字符串的长度太小，比如 s0 ，可能生成的keyfile长度很短，mongodb要求的最小长度为6 ==> 直接扩大两倍
	## 以上都错了，mongodb keyfile要保证集群是一致的，所以这里要加一个keyfile的密钥的选项
	key_file_path="${local_data_dir}/keyfile/mongodb-keyfile"
	echo "${keyfile_secret}" | base64 >${key_file_path}
	## todo keyfile记得优化从一个节点拿 统一的
	cp /root/package/create_mongo/keyfile ${key_file_path}
	chmod 400 ${key_file_path}
}

function init_conf_of_supervisor() {
	mongodb_processlist_conf="/etc/supervisord.d/mongod_${port}.ini"
	#	cat ${local_data_dir}/supervisor/monogodb_sample.ini >${mongodb_processlist_conf}
	#
	#	mongod_port_placeholder="MONGOD_PORT_PLACEHOLDER"
	#	sed -i "s/${mongod_port_placeholder}/${port}/g" ${mongodb_processlist_conf}
	cat <<EOF >${mongodb_processlist_conf}

[program:mongod-${port}]
command= ${local_base_dir}/${version}/bin/mongod -f ${local_mongod_conf}
autostart=true
autorestart=true
user=root
stdout_logfile=/tmp/mongo-${port}.stdout.log
stderr_logfile=/tmp/mongo-${port}.stderr.log
EOF

}
function restart_mongodb_process() {
	# 使用supervisor托管
	init_conf_of_supervisor
	supervisorctl update
	supervisorctl restart mongod-${port}
	supervisorctl status mongod-${port}
}

function add_monitor() {
	remote_monitor_File=${hub_dir}/monitor/mysql_monitor/percona
	local_monitor_base=/usr/local
	local_monitor_dir=${local_monitor_base}/percona
	mkdir -p ${local_monitor_dir}
	download_monitor_package
}

function check_process_exists() {
	if pidof -x "$@" >/dev/null; then
		echo 0
	else
		echo 1
	fi
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
	# shellcheck disable=SC2046
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
	instance_name="$(hostname -i)_${port}"
	local local_mongodb_pmm_user="pmm"
	local local_mongodb_pmm_user_passwd="7yZ3WjZThF5eKqh5"

	pmm-admin add mongodb \
		--username="${local_mongodb_pmm_user}" --password="${local_mongodb_pmm_user_passwd}" \
		--server-insecure-tls \
		--server-url=https://${pmm_server_user}:${pmm_server_pass}@${pmm_server_host}:${pmm_server_port} \
		--service-name=${instance_name} --socket=${local_data_dir}/sock/mongodb-${port}.sock &

}
# 定义信号处理函数
function handle_exit_1() {
	trap 'handle_exit_2' EXIT
	echo "程序退出，执行自定义操作"
	# 在这里执行您希望的操作，如清理资源、记录日志等
	# ...
	drop_local_database
	add_monitor
	uncommant
	modify_roles
	restart_mongodb_process
	exit 0 # 可选：在信号处理函数中执行退出操作
}

function handle_exit_2() {
	echo "程序退出，执行自定义操作"
	# 在这里执行您希望的操作，如清理资源、记录日志等
	# ...
	add_monitor
	uncommant
	modify_roles
	restart_mongodb_process
	exit 0 # 可选：在信号处理函数中执行退出操作
}

function conn_local_mongod() {
	## 程序可能会直接退出
	${local_base_dir}/${version}/bin/mongosh -u mongoadmin -p letsg0 --port ${port} --authenticationDatabase admin "$@"
}
function drop_local_database() {
	## 程序可能会直接退出
	echo -e "db.getSiblingDB('local').dropDatabase() \n exit" | ${local_base_dir}/${version}/bin/mongosh -u mongoadmin -p letsg0 --port ${port} --authenticationDatabase admin

}
function on_success() {
	exit 0
}

function on_failure() {
	exit $1
}
# 注释以特定字符串开始的行
# 注释以特定字符串开始的行
function comment_lines_starting_with() {
	local file="$1"
	local string="$2"
	sed -i "/^[[:space:]]*${string}/ s/^/#/" "${file}"
}

# 取消注释以特定字符串开始的行
function uncomment_lines_starting_with() {
	local file="$1"
	local string="$2"
	sed -i "/^#[[:space:]]*${string}/ s/^#//" "${file}"
}

function comment() {
	comment_lines_starting_with ${local_mongod_conf} "replication"
	comment_lines_starting_with ${local_mongod_conf} "  replSetName"
	comment_lines_starting_with ${local_mongod_conf} "  oplogSizeMB"
	comment_lines_starting_with ${local_mongod_conf} "  enableMajorityReadConcern"

	comment_lines_starting_with ${local_mongod_conf} "security"
	comment_lines_starting_with ${local_mongod_conf} "  keyFile"
	comment_lines_starting_with ${local_mongod_conf} "  authorization"

}

function uncommant() {
	uncomment_lines_starting_with ${local_mongod_conf} "replication"
	uncomment_lines_starting_with ${local_mongod_conf} "  replSetName"
	uncomment_lines_starting_with ${local_mongod_conf} "  oplogSizeMB"
	uncomment_lines_starting_with ${local_mongod_conf} "  enableMajorityReadConcern"

	uncomment_lines_starting_with ${local_mongod_conf} "security"
	uncomment_lines_starting_with ${local_mongod_conf} "  keyFile"
	uncomment_lines_starting_with ${local_mongod_conf} "  authorization"
}

function modify_roles() {
	## 修饰角色
	## 接收三类 replica sharding(shard,config_server)
	if [ "${cluster_role}" == "shard_server" ]; then
		cat <<EOF >>"${local_mongod_conf}"
sharding:
  clusterRole: shardsvr
EOF
	fi

	if [ "${cluster_role}" == "config_server" ]; then
		cat <<EOF >>"${local_mongod_conf}"
sharding:
  clusterRole: configsvr
EOF
	fi
}

  ## 默认 none

function main() {
	set -e
	parseopt "$@"
	install_depend_commands
	make_sure_port_in_use_or_not "${port}"
	download_mongodb_package ${version}
	init_conf
	comment
	restart_mongodb_process
	trap 'handle_exit_1' EXIT
	conn_local_mongod ${local_data_dir}/scripts/extra.js
	## 后续过程定义在handle_exit的方法中
}

main "$@"
