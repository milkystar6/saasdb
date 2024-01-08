package backup_consume

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/schedule/backup_schedule"
	"github.com/go-redis/redis/v8"
	"regexp"
	//"saasdb/server/vendor/github.com/go-redis/redis/v8"
	"strconv"
)

func consumeTaskOld(ctx context.Context, rdb *redis.Client) (int, error) {
	// 从队列中获取任务
	result, err := rdb.BLPop(ctx, 0, backup_schedule.KeyOFBackUpTaskDomainId).Result()
	if err != nil {
		return 0, err
	}
	// 解析任务数据
	taskData := result[1]
	fmt.Println(taskData)
	// 处理任务
	id, err := handleTask(ctx, taskData)
	if err != nil {
		return id, err
	}
	return id, nil
}

// 消费者函数，获取任务并处理
func consumeTask(ctx context.Context, rdb *redis.Client) (s saasdb.DBBackupTask, e error) {
	// 设置 Redis 键名
	key := backup_schedule.KeyOFBackUpTaskDomainId

	// 从 Redis 中获取 JSON 数据
	jsonStr, err := rdb.LPop(context.Background(), key).Result()

	// 没有数据的场景
	if jsonStr == "" && err != nil {
		return s, nil
	}
	//if err != nil {
	//	fmt.Println("Error fetching JSON from Redis:", err)
	//	return s, err
	//}

	// 解析 JSON 数据为结构体
	var task saasdb.DBBackupTask // 你的任务类型
	if err := json.Unmarshal([]byte(jsonStr), &task); err != nil {
		fmt.Println("Error parsing JSON:", err)
		return task, err
	}
	// 处理任务
	_, err = handleTask(ctx, strconv.Itoa(task.DomainId))
	if err != nil {
		return task, err
	}
	return task, nil
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
