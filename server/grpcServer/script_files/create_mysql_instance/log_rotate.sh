#!/bin/bash
port=$1
local_data_dir=/data/mysql/${port}
local_mysqld_conf=${local_data_dir}/conf/my.cnf
local_base_dir=/root/mysql_base_dir/
scripts_dir=${local_data_dir}/script_files
default_root_passwd=$(cat ${scripts_dir}/root.cnf)
conn_local_mysql="${local_base_dir}basedir/bin/mysql -uroot -p${default_root_passwd} -S ${local_data_dir}/data/sock/mysql.sock  "

function log_rotate() {
	# slow log
	MY_PATH=${local_mysqld_conf}
	# shellcheck disable=SC2002
	SLOW_LOG_FILE=$(cat "$MY_PATH" | grep slow_query_log_file | awk -F '=' '{print $2}' | sed -e 's/ //g')
	SLOW_LOG_BAK=$SLOW_LOG_FILE.$(date -d yesterday +%Y%m%d)
	# shellcheck disable=SC2034
	# shellcheck disable=SC2001
	SLOW_LOG_PATH=$(echo "$SLOW_LOG_FILE" | sed -e 's/slow.log//g')
	# shellcheck disable=SC2002
	LONG_QUERY_TIME=$(cat "$MY_PATH" | grep long_query_time | awk -F '=' '{print $2}' | sed -e 's/ //g')

	####### slow log rotate
	echo "---------------------------------------------------------------------"
	echo "start at $(date +%Y-%m-%d_%H:%M:%S) ......"
	echo "change the long query time......"
	sudo ${conn_local_mysql} -e "set global long_query_time=100*$LONG_QUERY_TIME;flush logs;"
	echo "chmod SLOW_LOG at $(date +%Y-%m-%d_%H:%M:%S) ......"
	chmod o+r "$SLOW_LOG_FILE"
	echo "backup the slow log......"
	# shellcheck disable=SC2086
	cp "$SLOW_LOG_FILE" $SLOW_LOG_BAK
	# shellcheck disable=SC2086
	cat /dev/null >$SLOW_LOG_FILE
	echo "restore the long query time......"
	sudo ${conn_local_mysql} -e "set global long_query_time=$LONG_QUERY_TIME;flush logs;"
	echo "slow log backup is finished......"
	echo "finish at $(date +%Y-%m-%d_%H:%M:%S) ......"

	# error log
	ERROR_LOG_FILE=$(cat $MY_PATH | grep log-error | awk -F '=' '{print $2}' | sed -e 's/ //g')
	ERROR_LOG_BAK=$ERROR_LOG_FILE.$(date -d yesterday +%Y%m%d)
	# shellcheck disable=SC2034
	ERROR_LOG_PATH=$(echo "$ERROR_LOG_FILE" | sed -e 's/error.log//g')

	####### error log rotate
	echo "---------------------------------------------------------------------"
	echo "start at $(date +%Y-%m-%d_%H:%M:%S) ......"
	echo "chmod ERROR_LOG at $(date +%Y-%m-%d_%H:%M:%S) ......"
	# shellcheck disable=SC2086
	chmod o+r $ERROR_LOG_FILE
	echo "backup the error log......"
	cp "$ERROR_LOG_FILE" "$ERROR_LOG_BAK"
	cat /dev/null >"$ERROR_LOG_FILE"
	echo "error log is finished......"
	echo "finish at $(date +%Y-%m-%d_%H:%M:%S) ......"

	# general log
	general_log_enabled=$(${conn_local_mysql} -e "select @@general_log" | grep -v general_log)
	if [ "${general_log_enabled}" -eq 1 ]; then
		GENERAL_LOG_FILE=$(cat $MY_PATH | grep general_log_file | awk -F '=' '{print $2}' | sed -e 's/ //g')
		GENERAL_LOG_BAK=$GENERAL_LOG_FILE.$(date -d yesterday +%Y%m%d)
		# shellcheck disable=SC2034
		GENERAL_LOG_PATH=$(echo $GENERAL_LOG_FILE | sed -e 's/general.log//g')
		####### general log rotate
		echo "---------------------------------------------------------------------"
		echo "start at $(date +%Y-%m-%d_%H:%M:%S) ......"
		echo "chmod $GENERAL_LOG at $(date +%Y-%m-%d_%H:%M:%S) ......"
		chmod o+r $$GENERAL_LOG_FILE
		echo "backup the general log......"
		cp $GENERAL_LOG_FILE $GENERAL_LOG_BAK
		cat /dev/null >$GENERAL_LOG_FILE
		echo "general log is finished......"
		echo "finish at $(date +%Y-%m-%d_%H:%M:%S) ......"

	fi

	####### clean log
	#	echo "---------------------------------------------------------------------"
	#	echo "list the old slow logs:"
	#	find $SLOW_LOG_PATH -name "slow.log.*" -mtime +7
	#	echo "delete the old slow logs......"
	#	find $SLOW_LOG_PATH -name "slow.log.*" -mtime +7 | xargs rm -rf
	#	echo "---------------------------------------------------------------------"
	#	echo "list the old error logs:"
	#	find $ERROR_LOG_PATH -name "error.log.*" -mtime +7
	#	echo "delete the old error logs......"
	#	find $ERROR_LOG_PATH -name "error.log.*" -mtime +7 | xargs rm -rf
	#	echo "---------------------------------------------------------------------"
	#	echo "list the old general logs:"
	#	find $GENERAL_LOG_PATH -name "general.log.*" -mtime +7
	#	echo "delete the old general logs......"
	#	find $GENERAL_LOG_PATH -name "general.log.*" -mtime +7 | xargs rm -rf
	#	echo "---------------------------------------------------------------------"
}

function main() {
	log_rotate
}
main
