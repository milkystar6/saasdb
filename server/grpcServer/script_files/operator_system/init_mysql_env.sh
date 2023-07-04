#!/bin/bash
#===========================================================================================
#     FileName: init_mysql_env.sh
#         Desc: [saasdb] init mysql env on operating system
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



function init_sysconf() {
    # This script adjusts Linux kernel parameters for MySQL database servers.

    # Backup /etc/sysctl.conf
    backup_file="/etc/sysctl-$(date +%Y%m%d%H%M%S).conf"
    cp /etc/sysctl.conf $backup_file

    # Set kernel parameters for MySQL performance optimization
    log "Setting kernel parameters for MySQL performance optimization..."

    # Define parameters to be set
    parameters=(
        "vm.swappiness=0"
        "vm.dirty_ratio=80"
        "vm.dirty_background_ratio=5"
        "vm.max_map_count=262144"
        "net.core.somaxconn=65535"
        "net.ipv4.tcp_max_syn_backlog=65535"
        "net.core.netdev_max_backlog=250000"
        ## TCP
        ## 当网络接收速率大于内核处理速率时，允许发送到队列中的包数目
        "net.core.netdev_max_backlog = 65535"
        ## 表示SYN队列长度，默认1024，改成65535，可以容纳更多等待连接的网络连接数。
        "net.ipv4.tcp_max_syn_backlog = 65535"
        ## 每个端口监听队列的最大长度。
        "net.core.somaxconn = 65535"
        ## 表示当keepalive启用的时候，TCP发送keepalive消息的频度，默认为2小时，改为30秒。
        "net.ipv4.tcp_keepalive_time = 30"
        ## tcp未获得响应时重发间隔。
        "net.ipv4.tcp_keepalive_intvl = 3"
        ## tcp未获得响应时重发数量。
        "net.ipv4.tcp_keepalive_probes = 3"
        ## 如果套接字由本端要求关闭，这个参数决定了它保持在FIN-WAIT-2状态的时间。
        "net.ipv4.tcp_fin_timeout = 10"
        ## 开启socket重用,允许将TIME-WAIT socket重新用于新的TCP连接，默认为0，表示关闭。
        "net.ipv4.tcp_tw_reuse = 1"
        ## 开启TCP连接中TIME-WAIT socket的快速回收，默认为0，表示关闭。
        "net.ipv4.tcp_tw_recycle = 1"
        ## 套接字接收缓冲区的最大大小
        "net.core.rmem_max = 16777216"
        ## 套接字发送缓冲区的最大大小
        "net.core.wmem_max = 16777216"

        ## fs.aio-max-nr
        "fs.aio-max-nr = 3145728"
    )

    # Loop through parameters and add or update them in /etc/sysctl.conf
    for param in "${parameters[@]}"; do
        grep -q "^${param}" /etc/sysctl.conf && sed -i "s/^${param}.*/${param}/" /etc/sysctl.conf || echo "${param}" >> /etc/sysctl.conf
    done

    # Apply new kernel parameters
    log "Applying new kernel parameters..."
    sysctl -p

    log "Done."

}

function reset_diskio_scheduler() {
    # Step 1: Backup /etc/fstab
    TIMESTAMP=$(date +"%Y%m%d%H%M%S")
    cp /etc/fstab "/etc/fstab.${TIMESTAMP}.bak"

    # Step 2: Determine the device name of /data
    DATA_DEV=$(df /data | awk 'NR==2 {print $1}' | sed 's/[0-9]*$//')

    # Step 3: Change the I/O scheduler of the device to noop
    echo noop > /sys/block"$DATA_DEV"/queue/scheduler

    # Step 4: Verify the change
    if grep -q "\[noop\]" /sys/block"$DATA_DEV"/queue/scheduler; then
        log "I/O scheduler of $DATA_DEV has been set to noop"
    else
        log "Failed to set I/O scheduler of $DATA_DEV to noop"
        exit 1
    fi

    # Step 5: Update /etc/fstab
    FSTAB_ENTRY=$(awk -v dev="$DATA_DEV" '$1 == dev {print $0}' /etc/fstab)
    if echo "$FSTAB_ENTRY" | grep -q noatime,nodiratime; then
        log "noatime,nodiratime options already exist in /etc/fstab for $DATA_DEV"
    else
        sed -i "s|${FSTAB_ENTRY}|${FSTAB_ENTRY/defaults/noatime,nodiratime}|g" /etc/fstab
        log "noatime,nodiratime options added to /etc/fstab for $DATA_DEV"
    fi


}

function set_cpu_to_performance_mode() {
    # Set CPU governor to performance mode
    # echo "Setting CPU governor to performance mode"
    # echo "performance" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
    cpupower -c all frequency-set -g performance
}


function disable_numa() {
    # Check if NUMA is enabled
    yum install numactl -y
    if numactl --hardware | grep -q "available: 1 nodes (0)"; then
      echo "NUMA is not enabled."
    else
      echo "NUMA is enabled. Disabling NUMA..."

      # Backup the original GRUB configuration file
      cp /etc/default/grub /etc/default/grub.$(date +%Y%m%d%H%M%S)

      # Append "numa=off" to GRUB_CMDLINE_LINUX_DEFAULT in /etc/default/grub
      sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="/&numa=off /' /etc/default/grub

      # Update GRUB configuration
      update-grub

      # Reboot the system
      reboot

    fi

}

function update_mysql_limits() {
    # 确认MySQL用户的用户名
    MYSQL_USER="mysql"

    # 设定最大文件打开句柄数
    MAX_OPEN_FILES=65535

    # 备份 limits.conf 文件
    DATE=$(date +"%Y%m%d%H%M%S")
    cp /etc/security/limits.conf "/etc/security/limits.conf.$DATE.bak"

    # 查找并更新 MySQL 用户的文件打开句柄限制
    if grep -q "^$MYSQL_USER" /etc/security/limits.conf; then
      sed -i "/^$MYSQL_USER/ s/.*/$MYSQL_USER soft nofile $MAX_OPEN_FILES\n$MYSQL_USER hard nofile $MAX_OPEN_FILES/" /etc/security/limits.conf
    else
      echo "$MYSQL_USER soft nofile $MAX_OPEN_FILES" >> /etc/security/limits.conf
      echo "$MYSQL_USER hard nofile $MAX_OPEN_FILES" >> /etc/security/limits.conf
    fi

}
function disable_mm_hugepage(){
  # 检查大页功能是否已开启
  if [ -f /sys/kernel/mm/transparent_hugepage/enabled ]; then
      enabled=$(cat /sys/kernel/mm/transparent_hugepage/enabled)
      if [[ "$enabled" =~ .*\[.*\].* ]]; then
          # 开启了大页功能，备份配置文件并关闭大页
          date=$(date +%Y%m%d%H%M%S)
          cp /etc/default/grub /etc/default/grub.$date.bak
          sed -i '/GRUB_CMDLINE_LINUX/s/"$/ transparent_hugepage=never"/' /etc/default/grub
          grub2-mkconfig -o /boot/grub2/grub.cfg
          echo "已备份配置文件 /etc/default/grub 为 /etc/default/grub.$date.bak，并已关闭内存大页功能。"

          # 重新加载 GRUB 配置
          echo "正在重新加载 GRUB 配置，请稍候..."
          source /etc/default/grub

          # 关闭大页
          echo never > /sys/kernel/mm/transparent_hugepage/enabled
          echo "已关闭内存大页功能。"
      else
          # 没有开启大页功能
          echo "内存大页功能未开启，无需关闭。"
      fi
  else
      # 文件不存在，无法确认是否开启大页功能
      echo "无法确认是否开启内存大页功能。"
  fi

}
function disable_selinux() {
   # 检查 SELinux 状态
   sestatus | grep -i 'SELinux status' | grep -iq 'enabled'

   if [ $? -eq 0 ]; then
       # 关闭 SELinux
       sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
       setenforce 0

       echo "已关闭 SELinux。"
   else
       echo "SELinux 未启用，无需关闭。"
   fi

}
function disable_firewalld() {
  systemctl stop  firewalld
  systemctl disable firewalld
}
function main() {
    init_sysconf
#    reset_diskio_scheduler
    set_cpu_to_performance_mode
    update_mysql_limits
    disable_numa
    disable_selinux
    disable_mm_hugepage
    disable_firewalld
}
main