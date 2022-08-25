package request

type SearchProcessList struct {
	// 只需要知道 到与哪个节点的grpcserver交互和对应的mysql连接地址即可
	Vm          string `json:"vm"`
	VmMySQLHost string `json:"vm_mysql_host"`
	VmMySQLPort int    `json:"vm_mysql_port"`
}
