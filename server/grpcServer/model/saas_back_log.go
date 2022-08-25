package model

import (
	"database/sql"
	"database/sql/driver"
	"encoding/json"
	"github.com/google/uuid"
	"gorm.io/gorm"
	"time"
)

type GvaModel struct {
	ID        uint           `gorm:"primarykey"` // 主键ID
	CreatedAt time.Time      // 创建时间
	UpdatedAt time.Time      // 更新时间
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"` // 删除时间
}

// BackLog 结构体
type BackLog struct {
	GvaModel
	FinishedAt    sql.NullTime   `json:"finished_at" form:"finished_at" gorm:"column:finished_at;TYPE:datetime "` // 完成时间
	DomainId      int            `json:"domainId" form:"domainId" gorm:"column:domain_id;index;comment:;"`
	BackupType    string         `json:"backupType" form:"backupType" gorm:"column:backup_type;type:enum('mysqldump','xtrafull','xtraincr','mydumper','redis','tidb');comment:备份类型;"`
	DataSize      int            `json:"dataSize" form:"dataSize" gorm:"column:data_size;comment:;"`
	Status        string         `json:"status" form:"status" gorm:"column:status;type:enum('backup','success','failed');comment:备份类型;"`
	BackUpFeature *BackUpFeature `json:"backupfeature" gorm:"TYPE:json;default:{}"`
	BackUpUuid    uuid.UUID      `json:"back_up_uuid" gorm:"column:back_up_uuid;uniqueIndex:back_up_uuid"`
}

type BackUpFeature struct {
	BackFeature string `json:"extra"`
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

func NewBackUpFeature(a string) *BackUpFeature {
	return &BackUpFeature{
		BackFeature: a,
	}
}
