// 自动生成模板Host
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Host 结构体
type Host struct {
	global.GVA_MODEL
	Hostname string `json:"hostname" form:"hostname" gorm:"column:hostname;comment:;"`
	Ip       string `json:"ip" form:"ip" gorm:"column:ip;comment:;"`
	Cpu      *int   `json:"cpu" form:"cpu" gorm:"column:cpu;comment:;size:10;"`
	Memory   *int   `json:"memory" form:"memory" gorm:"column:memory;comment:;"`
	//Disksize *int   `json:"disksize" form:"disksize" gorm:"column:disksize;comment:;"`
	// 不用json 对于不确定key的内容，gorm不好解析
	DiskInfo string `json:"disk_info" form:"diskinfo" gorm:"column:diskinfo;comment:;"`
}

// TableName Host 表名
func (Host) TableName() string {
	return "saas_host"
}
