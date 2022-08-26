package request

type SearchProcessList struct {
	// 只需要知道 到与哪个节点的grpcserver交互和对应的mysql连接地址即可
	Vm          string `json:"vm"`
	VmMySQLHost string `json:"vm_mysql_host"`
	VmMySQLPort string `json:"vm_mysql_port"`
}
type DecodeProcessListJSON struct {
	ProcessListInfo []InformationSchemaProcesslist `json:"ProcessListInfo"`
}
type InformationSchemaProcesslist struct {
	Id      int    `json:"ID" form:"id" ,gorm:"column:ID;TYPE:bigint"`
	User    string `json:"USER" ,from:"user" ,gorm:"column:USER;TYPE:varchar(32)"`
	Host    string `json:"HOST" ,form:"host" ,gorm:"column:HOST;TYPE:varchar(261)"`
	Db      string `json:"DB" ,form:"db" ,gorm:"column:DB;TYPE:varchar(64)"`
	Command string `json:"COMMAND" ,form:"command" ,gorm:"column:COMMAND;TYPE:varchar(16)"`
	Time    int    `json:"TIME" ,form:"time" ,gorm:"column:TIME;TYPE:int"`
	State   string `json:"STATE" ,form:"state" ,gorm:"column:STATE;TYPE:varchar(64)"`
	Info    string `json:"INFO" ,form:"info" ,gorm:"column:INFO;TYPE:varchar(65535)"`
}
type DecodeProcessListJSON struct {
	ProcessListInfo []InformationSchemaProcesslist `json:"ProcessListInfo"`
}
type InformationSchemaProcesslist struct {
	Id      int    `json:"ID" form:"id" ,gorm:"column:ID;TYPE:bigint"`
	User    string `json:"USER" ,from:"user" ,gorm:"column:USER;TYPE:varchar(32)"`
	Host    string `json:"host" ,form:"host" ,gorm:"column:HOST;TYPE:varchar(261)"`
	Db      string `json:"HOST" ,form:"db" ,gorm:"column:DB;TYPE:varchar(64)"`
	Command string `json:"COMMAND" ,form:"command" ,gorm:"column:COMMAND;TYPE:varchar(16)"`
	Time    int    `json:"TIME" ,form:"time" ,gorm:"column:TIME;TYPE:int"`
	State   string `json:"STATE" ,form:"state" ,gorm:"column:STATE;TYPE:varchar(64)"`
	Info    string `json:"INFO" ,form:"info" ,gorm:"column:INFO;TYPE:varchar(65535)"`
}
