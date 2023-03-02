#!/bin/bash
#===========================================================================================
#     FileName: create_mysql57_one.sh
#         Desc: [saasdb] add monitor for mysql intance
#       Author: milky star
#        Email: ch1yanzhi@163.com
#      History: 1. 完成首发与调试
#    Functions: 1. 用于MySQL数据库监控，基于pmm
#    exit code: 0   正常退出脚本
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
	TEMP=$(getopt -o h:p:i:P:d:s:S:H:A:a:B:b: --long host_ip:,port:,hub_ip:,hub_port:,hub_dir:,hub_ssh_user:,hub_ssh_user_passwd:,pmm_server_host:,pmm_server_port:,pmm_server_user:,pmm_server_pass: -- "$@")
	if [ $? -ne 0 ]; then
		echo "Terminating..." >&2
		print_usage
		on_failure 1
	fi
	eval set -- "$TEMP"
	while true; do
		case "$1" in

		-h | --host_ip)
			host_ip="$2"
			shift 2
			;;
		-p | --port)
			port="$2"
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

function install_depend_commands() {
	yum install -y expect lsof
}
#Add database monitoring
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
	instance_name="${host_ip}_${port}"
	local local_mysql_pmm_user="pmm"
	local local_mysql_pmm_user_passwd="7yZ3WjZThF5eKqh5"

	pmm-admin add mysql \
		--username="${local_mysql_pmm_user}" --password="${local_mysql_pmm_user_passwd}" \
		--server-insecure-tls \
		--server-url=https://${pmm_server_user}:${pmm_server_pass}@${pmm_server_host}:${pmm_server_port} \
		--query-source=perfschema ${instance_name} --socket=${local_data_dir}/data/sock/mysql.sock && on_success || on_failure
}

function on_success() {
	exit 0
}

function on_failure() {
	exit $1
}

function main() {
	set -e
	parseopt "$@"
	local_data_dir=/data/mysql/${port}
	install_depend_commands
	add_monitor
}

main "$@"
