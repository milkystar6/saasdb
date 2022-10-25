package model

// Host 结构体
type Host struct {
	GVA_MODEL
	Hostname string   `json:"hostname,omitempty" form:"hostname" gorm:"column:hostname;comment:;"`
	Ip       string   `json:"ip,omitempty" form:"ip" gorm:"column:ip;comment:;"`
	Feature  *Feature `json:"feature,omitempty" gorm:"TYPE:json`
}

// TableName Host 表名
func (Host) TableName() string {
	return "saas_host"
}
