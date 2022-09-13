// 自动生成模板OggInfo
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// OggInfo 结构体
type OggInfo struct {
	global.GVA_MODEL
	ProcessName string `json:"processName" form:"processName" gorm:"column:process_name;comment:ogg进程名称;size:1000;"`
	Schema      string `json:"schema" form:"schema" gorm:"column:schema;comment:SCHMA;"`
	Table       string `json:"table" form:"table" gorm:"column:table;comment:table;"`
	SrcDb       string `json:"srcDb" form:"srcDb" gorm:"column:src_db;comment:SrcDB;"`
	DstDb       string `json:"dstDb" form:"dstDb" gorm:"column:dst_db;comment:DstDb;"`
}

// TableName OggInfo 表名
func (OggInfo) TableName() string {
	return "saas_ogg_info"
}
