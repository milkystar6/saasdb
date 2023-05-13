package backup_schedule

import (
	"context"
	"fmt"
	"github.com/go-redis/redis/v8"
)

const keyOFBackUpTaskDomainId = "backup_tasks"

func containsValue(ctx context.Context, client *redis.Client, key string, value interface{}) (bool, error) {
	// 使用 LRange 命令获取列表中的所有元素
	list, err := client.LRange(ctx, key, 0, -1).Result()
	if err != nil {
		return false, err
	}

	// 遍历列表，判断是否包含指定的值
	for _, v := range list {
		if v == fmt.Sprintf("%v", value) {
			return true, nil
		}
	}

	return false, nil
}

// 生产者函数，添加任务到队列
func produceTask(ctx context.Context, rdb *redis.Client) error {
	task := ctx.Value("task_domain_id")
	//判断是否已经有了这个
	r, e := containsValue(ctx, rdb, keyOFBackUpTaskDomainId, task)
	if e != nil {
		return e
	} else if r {
		return nil
	}
	// 将任务添加到队列
	err := rdb.RPush(ctx, keyOFBackUpTaskDomainId, task).Err()
	if err != nil {
		return err
	}
	return nil
}

// 消费者函数，获取任务并处理
func consumeTask(ctx context.Context, rdb *redis.Client) error {
	// 从队列中获取任务
	result, err := rdb.BLPop(ctx, 0, keyOFBackUpTaskDomainId).Result()
	if err != nil {
		return err
	}
	// 解析任务数据
	taskData := result[1]
	// 处理任务
	err = handleTask(ctx, []byte(taskData))
	if err != nil {
		return err
	}
	return nil
}

// 处理任务的函数
func handleTask(ctx context.Context, taskData []byte) error {
	// 处理任务逻辑
	return nil
}
