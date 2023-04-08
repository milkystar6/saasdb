package backup_schedule

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"strconv"
	"strings"
	"time"
)

func shouldExecuteTask(task saasdb.DBBackupTask) bool {
	// TODO 兼容字符串转成多个数组
	if task.LastExecutedAt == nil {
		// do nothing
	}

	// 任务正在运行，新的任务不运行
	if strings.ToLower(task.LastExecutedStat) == strings.ToLower("running") {
		return false
	}
	if task.DailyTime == "" {
		return false
	}
	// 获取当前时间
	now := time.Now()
	// 解析计划任务的执行时间
	layout := "2006-01-02 15:04:05"
	dateStr := now.Format("2006-01-02")
	dt := strings.ReplaceAll(task.DailyTime, " ", "")
	dailyTime := dateStr + " " + dt
	cst, _ := time.LoadLocation("Asia/Shanghai")
	scheduledTime, err := time.ParseInLocation(layout, dailyTime, cst)
	if err != nil {
		global.GVA_LOG.Error(fmt.Sprintf("failed to parse scheduled time: %v", err))
		return false
	}

	/* 拆解任务计划
	MonthlyTime       每月什么时候执行
		WeeklyTime        每周什么执行
		    DailyTime         每天的什么时候执行
	优先级依次执行
	*/
	// 如果monthlytime字段非空并且不是计划任务的当天 不运行任务
	if task.MonthlyTime != "" {
		taskMonthDay, _ := strconv.Atoi(task.MonthlyTime)
		if !isNowAndInputIsSameDay(taskMonthDay) {
			return false
		}
	}
	if task.WeeklyTime != "" {
		if now.Weekday() != getDayOfWeek(task.WeeklyTime) {
			//fmt.Println(now.Weekday(), getDayOfWeek(task.WeeklyTime))
			return false
		}
	}

	// 计算当前时间和计划任务执行时间的时间差
	timeDiff := scheduledTime.Sub(now).Seconds()
	// 如果时间差为负数，表示计划任务已经过期
	fmt.Println(timeDiff, now, scheduledTime)
	if timeDiff < 0 {
		fmt.Println("scheduled time has passed")
		return false
	}
	if timeDiff >= 0 && timeDiff <= BackupScheduleInterval {
		return true
	}

	return false
}

func isSameDay(t1, t2 time.Time) bool {
	return t1.Year() == t2.Year() && t1.Month() == t2.Month() && t1.Day() == t2.Day()
}
func isNowAndInputIsSameDay(day1 int) bool {
	now := time.Now()
	return day1 == now.Day()
}

func getDayOfWeek(dayOfWeek string) time.Weekday {
	d := strings.ToLower(dayOfWeek)
	switch d {
	case "monday":
		return time.Monday
	case "tuesday":
		return time.Tuesday
	case "wednesday":
		return time.Wednesday
	case "thursday":
		return time.Tuesday
	case "friday":
		return time.Friday
	case "saturday":
		return time.Saturday
	case "sunday":
		return time.Sunday
	default:
		return 0
	}
}
