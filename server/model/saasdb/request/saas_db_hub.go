package request

type DBHub struct {
	DBType  string `json:"DBType,omitempty" form:"db_type" gorm:"column:db_type;type:enum('oracle','mysql','redis','mongodb','tidb');comment:数据库类型;"`
	HubIp   string `json:"hub_ip,omitempty" form:"hub_ip" gorm:"column:hub_ip;comment:hub_ip;"`
	HubPort *int   `json:"hub_port,omitempty" form:"hub_port" gorm:"column:hub_port;comment:hub_port;"`
	HubDir  string `json:"hub_dir,omitempty" form:"hub_dir" gorm:"column:hub_dir;comment:hub_dir;"`
}

// TableName DBHub  表名
func (DBHub) TableName() string {
	return "saas_db_hub"
}
