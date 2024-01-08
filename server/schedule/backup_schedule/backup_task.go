package backup_schedule

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/go-redis/redis/v8"
)

const KeyOFBackUpTaskDomainId = "backup_tasks"

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
func produceTaskOld(ctx context.Context, rdb *redis.Client) error {
	if task, ok := ctx.Value("task_domain_id").(saasdb.DBBackupTask); ok {
		//判断是否已经有了这个
		r, e := containsValue(ctx, rdb, KeyOFBackUpTaskDomainId, task)
		if e != nil {
			return e
		} else if r {
			return nil
		}
		// 将任务添加到队列
		err := rdb.RPush(ctx, KeyOFBackUpTaskDomainId, task).Err()
		if err != nil {
			return err
		}
	}
	//task := ctx.Value("task_domain_id")
	return nil
}

func produceTask(ctx context.Context, rdb *redis.Client) error {
	if task, ok := ctx.Value("task_domain_id").(saasdb.DBBackupTask); ok {
		// 判断是否已经有了这个
		r, e := containsValue(ctx, rdb, KeyOFBackUpTaskDomainId, task)
		if e != nil {
			return e
		} else if r {
			return nil
		}

		// 使用 JSON 序列化任务对象
		serializedTask, err := json.Marshal(task)
		if err != nil {
			return err
		}

		// 将任务添加到队列
		err = rdb.RPush(ctx, KeyOFBackUpTaskDomainId, serializedTask).Err()
		if err != nil {
			return err
		}
	}
	return nil
}
