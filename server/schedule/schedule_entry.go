package schedule

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/schedule/backup_consume"
	"github.com/flipped-aurora/gin-vue-admin/server/schedule/backup_schedule"
)

type SaasDBSchedule struct {
	backup_schedule.BackupSchedule
	backup_consume.HandleConsume
}

func (s SaasDBSchedule) Start() {
	// 一组 生产消息 消费消息
	go func() {
		s.BackupSchedule.BackupSchedule()
	}()

	go func() {
		s.HandleConsume.HandleConsume()
	}()

	go func() {
		// orther Schedule
	}()
	global.GVA_LOG.Info("saasdb schedule run success")
}
