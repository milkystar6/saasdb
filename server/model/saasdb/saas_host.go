// 自动生成模板Host
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Host 结构体
type Host struct {
	global.GVA_MODEL
	Hostname string   `json:"hostname" form:"hostname" gorm:"column:hostname;comment:;"`
	Ip       string   `json:"ip" form:"ip" gorm:"column:ip;type:varchar(64);index:ip,unique,not null;comment:;"`
	Feature  *Feature `json:"feature" gorm:"TYPE:json"`
}

// TableName Host 表名
func (Host) TableName() string {
	return "saas_host"
}
