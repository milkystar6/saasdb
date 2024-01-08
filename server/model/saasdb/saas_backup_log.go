// 自动生成模板BackLog
package saasdb

import (
	"database/sql"
	"database/sql/driver"
	"encoding/json"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// BackLog 结构体
type BackLog struct {
	global.GVA_MODEL
	FinishedAt    sql.NullTime   `json:"finished_at" form:"finished_at" gorm:"column:finished_at;TYPE:datetime "` // 完成时间
	DomainId      *int           `json:"domainId,omitempty" form:"domainId" gorm:"column:domain_id;index;comment:;"`
	InsId         *int           `json:"ins_id,omitempty" form:"ins_id" gorm:"column:ins_id"`
	BackupType    string         `json:"backupType,omitempty" form:"backupType" gorm:"column:backup_type;type:enum('mysqldump','mysqldump_full','mysqldump_single','xtra_full','xtra_incr','mydumper_full','mydumper_single','redis','tidb');comment:备份类型;"`
	DataSize      *int           `json:"dataSize" form:"dataSize" gorm:"column:data_size;comment:;"`
	Status        string         `json:"status" form:"status" gorm:"column:status;type:enum('backup','success','failed','running');comment:备份类型;"`
	BackUpFeature *BackUpFeature `json:"back_up_feature" gorm:"column:back_up_feature;TYPE:json;default:NULL"`
	BackUpUuid    string         `json:"back_up_uuid" gorm:"column:back_up_uuid;uniqueIndex:back_up_uuid"`
}
type BackUpFeature struct {
	UserName     string `json:"user_name"`
	UserPassword string `json:"user_password"`
	// 备份服务器id
	BackUpCenterId string `json:"back_up_center_id"`
	// 备份集合url
	BackUpSetUrl string `json:"back_up_set_url"`
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
