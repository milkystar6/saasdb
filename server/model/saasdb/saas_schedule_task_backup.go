package saasdb

const (
	BackupTableName = "saas_schedule_backup"
	// 备份相关任务

	TypeMySQLBackup   = "mysql"
	TypeMongoDBBackup = "mongodb"
	TypeTidbBackup    = "tidb"

	// MySQL备份场景 backup scenarios
	MySQLBackupUseXtrabackup = "xtrabackup"
	MySQLBackupUseMysqldump  = "mysqldump"
	MySQLBackupUseMydumper   = "mydumper"
	MySQLBackupUseDumpling   = "dumpling"

	// 备份方式 backup mode

	// FullBak 全备份
	FullBak = "full"
	// IncrBak 增量备份 作为一个 place holder, 基本不用
	IncrBak = "incr"
	// SingleTableBak 单表备份
	SingleTableBak = "table"
	// SingleDBBak 单数据库备份
	SingleDBBak = "db"
)

type DBBackupTask struct {
	ScheduleTask
	// 任务类型
	BackupType string `json:"backup_type,omitempty" form:"backup_type" gorm:"column:backup_type"`
	// 任务场景,精细化的任务详情
	BackupScenarios string `json:"backup_scenarios,omitempty" form:"backup_scenarios" gorm:"column:backup_scenarios"`
	// 备份方式
	BackupMode string `json:"backup_mode,omitempty" form:"backup_mode" gorm:"column:backup_mode"`
	// 集群ID
	DomainId int `json:"domain_id,omitempty" form:"domain_id" gorm:"column:domain_id"`
}

func (m *DBBackupTask) TableName() string {
	return BackupTableName
}
