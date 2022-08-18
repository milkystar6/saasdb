// 自动生成模板BackLog
package saasdb

import (
	"database/sql"
	"database/sql/driver"
	"encoding/json"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/google/uuid"
)

// BackLog 结构体
type BackLog struct {
	global.GVA_MODEL
	FinishedAt    sql.NullTime   `json:"finished_at" form:"finished_at" gorm:"column:finished_at;TYPE:datetime "` // 完成时间
	DomainId      int            `json:"domainId" form:"domainId" gorm:"column:domain_id;index;comment:;"`
	BackupType    string         `json:"backupType" form:"backupType" gorm:"column:backup_type;type:enum('mysqldump','xtrafull','xtraincr','mydumper','redis','tidb');comment:备份类型;"`
	DataSize      int            `json:"dataSize" form:"dataSize" gorm:"column:data_size;comment:;"`
	Status        string         `json:"status" form:"status" gorm:"column:status;type:enum('backup','success','failed');comment:备份类型;"`
	BackUpFeature *BackUpFeature `json:"backupfeature" gorm:"TYPE:json;default:NULL"`
	BackUpUuid    uuid.UUID      `json:"back_up_uuid" gorm:"column:back_up_uuid;uniqueIndex:back_up_uuid"`
}
type BackUpFeature struct {
	UserName     string `json:"user_name"`
	UserPassword string `json:"user_password"`
}

func (c BackUpFeature) Value() (driver.Value, error) {
	b, err := json.Marshal(c)
	return string(b), err
}

func (c *BackUpFeature) Scan(input interface{}) error {
	return json.Unmarshal(input.([]byte), c)
}

// TableName BackLog 表名
func (BackLog) TableName() string {
	return "saas_back_log"
}
