package backup_schedule

import (
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/robfig/cron/v3"
	"time"
)

const (
	BackupScheduleInterval = 2
	BackupTaskTimeout      = 86400 - BackupScheduleInterval*2 // 一天减去BackupScheduleInterval *2 粗略估计值
)

type BackupSchedule struct {
}

func (bm *BackupSchedule) BackupSchedule() {
	c := cron.New()
	c.AddFunc(fmt.Sprintf("@every %vs", BackupScheduleInterval), func() {
		mysqlbackuptasks, count, err := bm.GetBackupScheduleInfoFromSaadb()
		var m saasdb.DBBackupTask
		if err != nil {
			global.GVA_LOG.Error(fmt.Sprintf("查询saasdb.%v表失败 ...", m.TableName()))
		} else {
			if count == 0 {
				global.GVA_LOG.Info(fmt.Sprintf("get none schedule tasks about database backup from %v", m.TableName()))
			}
			for i := range mysqlbackuptasks {
				if shouldExecuteTask(mysqlbackuptasks[i]) {
					b, err := json.MarshalIndent(mysqlbackuptasks[i], "", "  ")
					if err != nil {
						fmt.Println("error:", err)
					}
					global.GVA_LOG.Info(fmt.Sprintf("满足任务条件，运行任务，cron id: %v,pretty-printed JSON output of scheduled task information:\n%v", mysqlbackuptasks[i].ID, string((b))))

					go func(m saasdb.DBBackupTask) {
						global.GVA_LOG.Info(fmt.Sprintf("更新%v表任务运行状态为running", m.TableName()))
						err := bm.SetBackupTaskStatWithTimeout(m, "running", BackupTaskTimeout)
						if err != nil {
							global.GVA_LOG.Error(fmt.Sprintf("更新%v表任务运行状态失败,err: %v", m.TableName(), err.Error()))
						}
					}(mysqlbackuptasks[i])
					go func() {
						//todo run task
						// 向 saas_agent发送grpc备份数据的消息
					}()

				} else {
					//global.GVA_LOG.Info("none cron task need to run")
				}
			}
			//global.GVA_LOG.Info("schedule running ...")
		}
	})
	c.Start()
	select {}
}

func (bm *BackupSchedule) GetBackupScheduleInfoFromSaadb() ([]saasdb.DBBackupTask, int64, error) {
	db := global.GVA_DB.Model(&saasdb.DBBackupTask{})
	var my []saasdb.DBBackupTask
	var count int64
	err := db.Where("backup_type in (?,?,?) and enable = ?", saasdb.TypeMySQLBackup, saasdb.TypeMongoDBBackup, saasdb.TypeTidbBackup, saasdb.TaskEnable).Find(&my).Count(&count).Error
	return my, count, err
}

func (bm *BackupSchedule) SetBackupTaskStatWithTimeout(c saasdb.DBBackupTask, stat string, timeout int) error {
	db := global.GVA_DB.Model(&saasdb.DBBackupTask{})
	c.LastExecutedStat = stat
	c.LastExecutedAt = nil
	c.CreatedAt = time.Now()
	err := db.Where("id=?", c.ID).Save(&c).Error
	if err != nil {
		return err
	}
	time.Sleep(time.Duration(timeout) * time.Second)
	c.LastExecutedStat = ""
	err = db.Where("id=?", c.ID).Save(&c).Error
	if err != nil {
		return err
	}
	return err
}
