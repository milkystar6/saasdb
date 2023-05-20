#!/bin/bash
#use xtrabackup

function log() {
	echo "[$(date +"%Y-%m-%d %H:%M:%S")] $*"
}

host_addr=172.19.204.249
user=root
password=$(cat /data/mysql/3306/script_files/root.cnf)
socket="/data/mysql/3306/data/sock/mysql.sock"
myconf="/data/mysql/3306/conf/my.cnf"
hub_ssh_user_passwd="Cljslrl0620@123^&"
proj_name="cmis"

let routines=$(lscpu | grep -w CPU\(s\) | awk '{print $2}' | head -n 1)/2
current_time=$(date +"%Y-%m-%d_%H-%M-%S")
remote_backup_dir="/data/backup_file_storage/mysql/${proj_name}/${current_time}_full"

yum install -y sshpass
sshpass -p "${hub_ssh_user_passwd}" ssh root@${host_addr} "mkdir -p ${remote_backup_dir}"

function backup() {
	expect <<EOF
    set timeout 12800;
    spawn bash -c "/usr/local/xtrabackup/bin/xtrabackup --defaults-file=${myconf} \
    --no-timestamp --slave-info \
    --parallel=${routines} --compress --compress-thread=${routines} \
    --safe-slave-backup --safe-slave-backup-timeout=360 \
    --ftwrl-wait-threshold=10 --ftwrl-wait-query-type=all --ftwrl-wait-timeout=180 \
    --kill-long-queries-timeout=40 --kill-long-query-type=SELECT \
    --user=${user} --password=${password} --socket=${socket} \
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

function main() {
  backup
}
main