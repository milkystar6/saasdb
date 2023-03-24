package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"time"
)

type ScheduleTask struct {
	global.GVA_MODEL

	// 是否开启
	Enable string `json:"enable,omitempty" form:"enable" gorm:"column:enable;TYPE:varchar(10);comment:是否启用"`

	// 每天的具体时间，格式为 "HH:mm:ss"
	DailyTime string `json:"daily_time,omitempty" form:"daily_time" gorm:"column:daily_time"`
	// 每周的具体时间，格式为 "Weekday HH:mm:ss"，例如 "Monday 12:00:00"
	WeeklyTime string `json:"weekly_time,omitempty" form:"weekly_time" gorm:"column:weekly_time"`
	// 每月的具体时间，格式为 "day HH:mm:ss"，例如 "15 12:00:00"
	MonthlyTime string `json:"monthly_time,omitempty" form:"monthly_time" gorm:"column:monthly_time"`
	// 是否为循环任务
	IsRecurring      string    `json:"is_recurring,omitempty" form:"is_recurring" gorm:"column:is_recurring;type:varchar(10)"`
	LastExecutedAt   time.Time `json:"last_executed_at,omitempty" form:"last_executed_at" gorm:"column:last_executed_at;type:datetime NOT NULL DEFAULT CURRENT_TIMESTAMP;comment:插入时间"`
	LastExecutedStat string    `json:"last_executed_result,omitempty" form:"last_executed_result" gorm:"column:last_executed_result;type:varchar(10);comment:任务状态"`
}
