package backup_schedule

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"strconv"
	"strings"
	"time"
)

const (
	monthTimeSplitFlag  = ';'
	weeklyTimeSplitFlag = ';'
	dailyTimeSplitFlag  = ';'
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
	// 无dailyTime直接退出
	if task.DailyTime == "" {
		return false
	}

	// 不支持slice 废弃掉
	//如果MonthlyTime字段非空并且不是计划任务的当天 不运行任务
	//if task.MonthlyTime != "" {
	//	taskMonthDay, _ := strconv.Atoi(task.MonthlyTime)
	//	if !isNowAndInputIsSameDay(taskMonthDay) {
	//		return false
	//	}
	//}

	/* 拆解任务计划
	MonthlyTime       每月什么时候执行
		WeeklyTime        每周什么执行
		    DailyTime         每天的什么时候执行
	优先级依次执行
	*/

	/* 备注
	首先判断月份
	1、saasdb.schedule_task_backup表中的monthly_time字段记录的是月份的一个数组(实际是varchar类型),类似于"1,2,3,4,5,6"
	  通过对这个string类型根据','拆分成一个个月份的slice，然后判断这个月份集合中是否有符合条件的值
	2、根据matchMonth()决定是否有符合条件的值 如果都不符合返回false，有一个符合直接返回true，接着判断后面的逻辑
	*/
	monthlySlice := strings.Split(task.MonthlyTime, string(monthTimeSplitFlag))

	checkMonth := func(monthlySlice []string) bool {
		for _, v := range monthlySlice {
			a, _ := strconv.Atoi(v)
			if matchMonth(a) {
				return true
			}
		}
		return false
	}(monthlySlice)
	//fmt.Println("aaaaaa", monthlySlice)
	if !checkMonth {
		return false
	}

	/* 判断是否有符合的
	   一周的某一天
	*/
	weeklyDaySlice := strings.Split(task.WeeklyTime, string(weeklyTimeSplitFlag))
	checkWeeklyDay := func(weeklyDaySlice []string) bool {
		for _, v := range weeklyDaySlice {
			if matchWeeklyDay(v) {
				return true
			}
		}
		return false
	}(weeklyDaySlice)
	//fmt.Println("bbbbb", weeklyDaySlice)
	if !checkWeeklyDay {
		return false
	}

	/* 解析delayTime

	 */

	dailyTimeSlice := strings.Split(task.DailyTime, string(dailyTimeSplitFlag))
	checkDailyTime := func(dailyTimeSlice []string) bool {
		for _, v := range dailyTimeSlice {
			if matchDailyTime(v) {
				return true
			}
		}
		return false
	}(dailyTimeSlice)
	//fmt.Println("ccccc", dailyTimeSlice)
	/* 已满足以上月份，周几，每日时间的 条件,表示符合调度策略*/
	if checkDailyTime {
		return true
	}

	return false
}

func matchDailyTime(v string) bool {
	// 获取当前时间
	now := time.Now()
	// 解析计划任务的执行时间
	layout := "2006-01-02 15:04:05"
	dateStr := now.Format("2006-01-02")
	dt := strings.ReplaceAll(v, " ", "")
	dailyTime := dateStr + " " + dt
	cst, _ := time.LoadLocation("Asia/Shanghai")
	scheduledTime, err := time.ParseInLocation(layout, dailyTime, cst)
	if err != nil {
		global.GVA_LOG.Error(fmt.Sprintf("failed to parse scheduled time: %v", err))
		return false
	}
	// 计算当前时间和计划任务执行时间的时间差
	timeDiff := scheduledTime.Sub(now).Seconds()
	// 如果时间差为负数，表示计划任务已经过期
	//fmt.Println(timeDiff, now, scheduledTime)
	if timeDiff < 0 {
		// TODO 优化这里
		//fmt.Println("scheduled time has passed")
		return false
	}
	if timeDiff >= 0 && timeDiff <= BackupScheduleInterval {
		return true
	}
	return false
}

func matchWeeklyDay(v string) bool {
	now := time.Now()
	return now.Weekday() == getDayOfWeek(v)
}

func matchMonth(i int) bool {
	return i == getMonth()
}

func getMonth() int {
	month := time.Now().Month()
	return int(month)
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
