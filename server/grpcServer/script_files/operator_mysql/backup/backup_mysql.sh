#!/bin/bash
#use xtrabackup

function log() {
	echo "[$(date +"%Y-%m-%d %H:%M:%S")] $*"
}

function parseopt() {
	if [ $# -lt 10 ]; then
		echo "wrong options"
		print_usage
		exit 1
	fi
	TEMP=$(getopt -o v:h:p:m:M:i:P:d:s:S: --long mysql_host:,mysql_port:,mysql_backup_user:,mysql_backup_user_password:,saas_db_host:,saas_db_port:,saas_db_user:,saas_db_user_password:,backup_id:,backup_timeout: -- "$@")
	if [ $? -ne 0 ]; then
		echo "Terminating..." >&2
		print_usage
		on_failure 1
	fi
	eval set -- "$TEMP"
	while true; do
		case "$1" in
		-v | --mysql_host)
			mysql_host="$2"
			shift 2
			;;
		-h | --mysql_port)
			mysql_port="$2"
			shift 2
			;;
		-p | --mysql_backup_user)
			mysql_backup_user="$2"
			shift 2
			;;
		-m | --mysql_backup_user_password)
			mysql_backup_user_password="$2"
			shift 2
			;;
		-M | --saas_db_host)
			saas_db_host="$2"
			shift 2
			;;
		-i | --saas_db_port)
			saas_db_port="$2"
			shift 2
			;;
		-P | --saas_db_user)
			saas_db_user="$2"
			shift 2
			;;
		-d | --saas_db_user_password)
			saas_db_user_password="$2"
			shift 2
			;;
		-s | --backup_id)
			backup_id="$2"
			shift 2
			;;
		-S | --backup_timeout)
			backup_timeout="$2"
			shift 2
			;;
		-A | saas_db_name)
			saas_db_name="$2"
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

host_addr=${mysql_host}
user=${mysql_backup_user}
password=${mysql_backup_user_password}
socket="/data/mysql/3306/data/sock/mysql.sock"
myconf="/data/mysql/3306/conf/my.cnf"
hub_ssh_user_passwd="Cljslrl0620@123^&"
proj_name="cmis"

let routines=$(lscpu | grep -w CPU\(s\) | awk '{print $2}' | head -n 1)/2
current_time=$(date +"%Y-%m-%d_%H-%M-%S")
remote_backup_dir="/data/backup_file_storage/mysql/${proj_name}/${current_time}_full"

# for mysql 5.7
function backup57() {
	expect <<EOF
    set timeout 12800;
    spawn bash -c "/usr/local/xtrabackup/bin/xtrabackup --defaults-file=${myconf} \
    --no-timestamp --slave-info \
    --parallel=${routines} --compress --compress-thread=${routines} \
    --safe-slave-backup --safe-slave-backup-timeout=360 \
    --ftwrl-wait-threshold=10 --ftwrl-wait-query-type=all --ftwrl-wait-timeout=10 \
    --kill-long-queries-timeout=40 --kill-long-query-type=SELECT \
    --user=${mysql_backup_user} --password=${mysql_backup_user_password} --socket=${local_mysql_socket} \
    --backup  \
    --stream=xbstream \
    --target-dir=./ | ssh root@${host_addr} \"cat - >${remote_backup_dir}/$(date +%Y-%m-%d_%H:%m:%S)_fullback.xbstream\""

    expect {
        "*yes/no*" {send "yes\n";exp_continue}
        "*Permission denied*" {exit 1}
        "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
        "*Killed by signal 1" {exit 1}
        }
EOF
}
# for mysql 8.0.30
function backup80() {
	expect <<EOF
      set timeout 12800;
      spawn bash -c "/usr/local/xtrabackup/bin/xtrabackup --defaults-file=${myconf} \
      --no-timestamp --slave-info \
      --parallel=${routines} --compress --compress-thread=${routines} \
      --safe-slave-backup --safe-slave-backup-timeout=360 \
      --ftwrl-wait-threshold=10 --ftwrl-wait-query-type=all --ftwrl-wait-timeout=10 \
      --kill-long-queries-timeout=40 --kill-long-query-type=SELECT \
      --user=${mysql_backup_user} --password=${mysql_backup_user_password} --socket=${local_mysql_socket} \
      --backup  \
      --stream=xbstream \
      --target-dir=./ | ssh root@${host_addr} \"cat - >${remote_backup_dir}/$(date +%Y-%m-%d_%H:%m:%S)_fullback.xbstream\""

      expect {
          "*yes/no*" {send "yes\n";exp_continue}
          "*Permission denied*" {exit 1}
          "*password*" {send "${hub_ssh_user_passwd}\n";exp_continue}
          "*Killed by signal 1" {exit 1}
          }
EOF

}

# shellcheck disable=SC1073
function backup80() {
	echo "place holder"
}

function start_slave() {
	${connection_mysql_local} -e "START SLAVE;"
}

function init_env() {
	set -e
	parseopt "$@"
	# 如下命令通过gpt得到
	mysql_client=$(find / -name mysql -type f -executable -print 2>/dev/null)
	connection_mysql_local="${mysql_client} -sN -u${mysql_backup_user} -p${mysql_backup_user_password} -h${mysql_host} -P${mysql_port}"
	# shellcheck disable=SC2034
	connection_mysql_saasdb="${mysql_client} -sN -u${saas_db_user} -p${saas_db_user_password} -h${saas_db_host} -P${saas_db_port} ${saas_db_name}"
}
function main() {
	# shellcheck disable=SC2119
	init_env
	backup_policy
	start_slave
}

function get_hub_info() {
	local sql

	sql="
SELECT CONCAT(center_addr, '--', center_port, '--', backup_root_dir, '--', login_user, '--', login_password) WHERE id IN (
SELECT idc_id
FROM ${saas_db_name}.saas_instance WHERE ip=${mysql_host} AND on_working=1)
      "
	# shellcheck disable=SC2046
	# shellcheck disable=SC2005
	echo $($connection_mysql_saasdb -e "${sql}")

}

function get_domain_name() {
	local sql

	sql="
SELECT domain_name FROM saas_domain WHERE id IN (
SELECT domain_id FROM saas_instance WHERE ip=${mysql_host} AND port=${mysql_port})
      "
	# shellcheck disable=SC2046
	# shellcheck disable=SC2005
	echo $($connection_mysql_saasdb -e "${sql}")

}

function get_local_sock() {
	local sql
	sql="SELECT @@socket"
	# shellcheck disable=SC2046
	# shellcheck disable=SC2005
	echo $(${connection_mysql_local} -e "${sql}")

}

function backup_policy() {
	version=$(${connection_mysql_local} -e "SELECT VERSION()")
	hub_addr=$(get_hub_info | awk -F '--' '{print $1}')
	hub_sshport=$(get_hub_info | awk -F '--' '{print $2}')
	hub_root_dir=$(get_hub_info | awk -F '--' '{print $3}')
	hub_user=$(get_hub_info | awk -F '--' '{print $4}')
	hub_user_password=$(get_hub_info | awk -F '--' '{print $5}')
	#get domain_name
	domain_name=$(get_domain_name)
	# get local socket
	local_mysql_socket=$(get_local_sock)
	#create remote ssh dir on hub
	yum install -y sshpass
	sshpass -p "${hub_user_password}" ssh -p ${hub_sshport} ${hub_user}@${hub_addr} -o StrictHostKeyChecking=no "mkdir -p ${hub_root_dir}/${domain_name}"

	if [[ $version == *"5.7"* ]]; then
		log "mysql version is ${version},choose xtrabackup 2.4"
		backup57
	elif [[ $version == *"8.0"* ]]; then
		log log "mysql version is ${version},choose xtrabackup 8.0"
		backup80
	fi
}
main
