package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"time"
)

const (
	TaskDisable = iota
	TaskEnable
)

type ScheduleTask struct {
	global.GVA_MODEL

	// 是否开启
	Enable bool `json:"enable,omitempty" form:"enable" gorm:"column:enable;comment:是否启用"`

	// 每天的具体时间字符串，格式为 "HH:mm:ss"
	DailyTime string `json:"daily_time,omitempty" form:"daily_time" gorm:"column:daily_time"`
	// 每周几字符串，格式为 "Weekday"，例如 "Monday,Tuesday"
	WeeklyTime string `json:"weekly_time,omitempty" form:"weekly_time" gorm:"column:weekly_time"`
	// 每月的具体时间字符串，格式为 "day"，例如 "15,16"
	MonthlyTime string `json:"monthly_time,omitempty" form:"monthly_time" gorm:"column:monthly_time"`
	// 是否为循环任务
	IsRecurring string `json:"is_recurring,omitempty" form:"is_recurring" gorm:"column:is_recurring;type:varchar(10)"`
	// *类型注意在调用的时候判断指针是否为nil
	LastExecutedAt   *time.Time `json:"last_executed_at,omitempty" form:"last_executed_at" gorm:"column:last_executed_at;type:datetime DEFAULT NULL;comment:插入时间"`
	LastExecutedStat string     `json:"last_executed_stat,omitempty" form:"last_executed_stat" gorm:"column:last_executed_stat;type:varchar(10);comment:任务状态"`
}
