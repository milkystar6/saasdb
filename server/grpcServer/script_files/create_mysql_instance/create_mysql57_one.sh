#!/bin/bash
#===========================================================================================
#     FileName: create_mysql57_one.sh
#         Desc: [saasdb] Initialize a single MySQL database instance service .
#       Author: milky star
#        Email: chenhao20@corp.netease.com
#      History: 1. 完成首发与调试
#    Functions: 1.用于实现5.7版本,MySQL数据库,单个实例的创建
#               2.数据库初始用户创建 项目dba: proj_dba,复制用户:repl_user,备份用户:backup_user
#               3.开启cron任务，mysql数据库日志的按天分割
#===========================================================================================

function log() {
	echo "[$(date +"%Y-%m-%d %H:%M:%S")] $*"
}

function parseopt() {

	TEMP=$(getopt -o v:p:r:R:b:B:m:M:i:P:d:s:S \
		--long version:,passwd:,repl_user:,repl_user_passwd:,backup_user:,backup_user_passwd:,max_memory:,max_connections:, hub_ip:,hub_port:,hub_dir:,hub_ssh_user:,hub_ssh_user_passwd: \
		-n 'create_mysql57_one.sh' -- "$@")
	if [ $? -ne 0 ]; then
		echo "Terminating..." >&2
		exit 1
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
		--)
			shift
			break
			;;
		*)
			echo "Invalid option: $1" >&2
			print_usage
			exit 1
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
    "
}
# shellcheck disable=SC2120
function download_mysql_package() {
     remote_basedir_File=/home/saasdb_db_package/mysql/57/${version}/basedir
     remote_datadir_File=/home/saasdb_db_package/mysql/57/${version}/datadir
     remote_mysql_conf=/home/saasdb_db_package/mysql/57/${version}/my.cnf
     #判断本地是否含有basedir
     #copy_datadir
     localDir=/root/mysql_base_dir
     expect << EOF
       set timeout 1200;
       spawn scp -P${hub_port} -r -p ${hub_ssh_user}@${hub_ip}:"${remote_basedir_File}" "$localDir"
       expect{
         "*yes/no*" {send "yes\n";exp_continue}
         "*Permission denied*" {exit 1}
         "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
         "*Killed by signal 1" {exit 1}
       }
EOF
}



# shellcheck disable=SC2120
function main() {
	parseopt "$@"
	download_mysql_package
}

main "$@"
