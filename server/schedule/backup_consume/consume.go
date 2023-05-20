package backup_consume

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/schedule/backup_schedule"
	"github.com/go-redis/redis/v8"
	"regexp"
	"strconv"
)

// 消费者函数，获取任务并处理
func consumeTask(ctx context.Context, rdb *redis.Client) (int, error) {
	// 从队列中获取任务
	result, err := rdb.BLPop(ctx, 0, backup_schedule.KeyOFBackUpTaskDomainId).Result()
	if err != nil {
		return 0, err
	}
	// 解析任务数据
	taskData := result[1]
	// 处理任务
	id, err := handleTask(ctx, taskData)
	if err != nil {
		return id, err
	}
	return id, nil
}

// 处理任务的函数
func handleTask(ctx context.Context, taskData string) (int, error) {
	// 分析数据有效性
	if !isPositiveInteger(taskData) {
		return 0, fmt.Errorf(fmt.Sprintf("从消息队列中获取到非正整数的domainID: %v", taskData))
	}
	global.GVA_LOG.Info(fmt.Sprintf("从消息队列中获取到需要备份的数据库domainID: %v", taskData))

	// 处理任务逻辑
	id, _ := strconv.Atoi(taskData)
	return id, nil
}

func isPositiveInteger(str string) bool {
	match, _ := regexp.MatchString("^[1-9]\\d*$", str)
	return match
}
