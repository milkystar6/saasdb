package model

// Host 结构体
type Host struct {
	GVA_MODEL
	Hostname string `json:"hostname,omitempty" form:"hostname" gorm:"column:hostname;comment:;"`
	Ip       string `json:"ip,omitempty" form:"ip" gorm:"column:ip;comment:;"`
	Cpu      *int   `json:"cpu,omitempty" form:"cpu" gorm:"column:cpu;comment:;size:10;"`
	Memory   *int   `json:"memory,omitempty" form:"memory" gorm:"column:memory;comment:;"`
	// 不用json 对于不确定key的内容，gorm不好解析
	DiskInfo string `json:"disk_info,omitempty" form:"diskinfo" gorm:"column:diskinfo;comment:;"`
}

// TableName Host 表名
func (Host) TableName() string {
	return "saas_host"
}
