// 自动生成模板Host
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Host 结构体
type Host struct {
	global.GVA_MODEL
	Hostname             string   `json:"hostname" form:"hostname" gorm:"column:hostname;comment:;"`
	Ip                   string   `json:"ip" form:"ip" gorm:"column:ip;type:varchar(64);index:ip,unique,not null;comment:;"`
	Gateway              string   `json:"gateway" form:"gateway" gorm:"column:gateway;type:varchar(64);comment:;"`
	NetMask              int      `json:"netmask" form:"netmask" gorm:"column:netmask;type:int;comment:;"`
	OsVersion            string   `json:"os_version" form:"os_version" gorm:"column:os_version"`
	KernelVersion        string   `json:"kernel_version" form:"kernel_version" gorm:"column:kernel_version"`
	MachineType          string   `json:"machine_type" form:"machine_type" gorm:"column:machine_type"`
	InternetDataCenterId int      `json:"internet_data_center_id" form:"internet_data_center_id" gorm:"column:internet_data_center_id;type:int;comment:idc数据中心id"`
	Alias                string   `json:"alias" form:"alias" gorm:"column:alias;comment:别名"`
	ExtraInfo            string   `json:"extra_info" form:"extra_info" gorm:"column:extra_info;type:varchar(255);comment:;"`
	HostStatus           string   `json:"host_status" form:"host_name" gorm:"column:host_status;type:varchar(10)"`
	Feature              *Feature `json:"feature" gorm:"TYPE:json"`
}

// TableName Host 表名
func (Host) TableName() string {
	return "saas_host"
}
