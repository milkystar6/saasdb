package schedule

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/schedule/backup_schedule"
)

type SaasDBSchedule struct {
	backup_schedule.BackupSchedule
}

func (s SaasDBSchedule) Start() {
	go func() {
		s.BackupSchedule.BackupSchedule()
	}()

	go func() {
		// orther Schedule
	}()
	global.GVA_LOG.Info("saasdb schedule run success")
}
