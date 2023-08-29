package saasdb

import (
	"errors"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"gorm.io/gorm"
)

type DirUsage struct {
	global.GVA_MODEL
	InsId              *uint  `json:"ins_id" form:"InsId" gorm:"column:ins_id;index;comment:ins_id;"`
	DataDirName        string `json:"data_dir_name" form:"data_dir_name" gorm:"column:data_dir_name;comment:data_dir_name;"`
	DataDirSize        *int64 `json:"data_dir_size" form:"data_dir_size" gorm:"column:data_dir_size;comment:data_dir_size;"`
	DataDirSizeHuman   string `json:"data_dir_size_human" form:"data_dir_size_human" gorm:"column:data_dir_size_human;comment:data_dir_size_human"`
	BinlogDirName      string `json:"binlog_dir_name" form:"binlog_dir_name" gorm:"column:binlog_dir_name;comment:binlog_dir_name"`
	BinlogDirSize      *int64 `json:"binlog_dir_size" form:"binlog_dir_size" gorm:"column:binlog_dir_size;comment:binlog_dir_size"`
	BinlogDirSizeHuman string `json:"binlog_dir_size_human" form:"binlog_dir_size_human" gorm:"column:binlog_dir_size_human;comment:binlog_dir_size_human"`
}

func (*DirUsage) TableName() string {
	return "saas_dir_usage"
}

func (dirUsage *DirUsage) Save(db *gorm.DB) error {
	if dirUsage == nil {
		return errors.New("DirUsage object is nil")
	}

	if db == nil {
		return errors.New("database connection is not initialized")
	}

	if err := db.Debug().Create(&dirUsage).Error; err != nil {
		return err
	}
	return nil
}
