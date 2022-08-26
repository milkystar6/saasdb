package request

type ReqVariables struct {
	// 只需要知道 到与哪个节点的grpcserver交互和对应的mysql连接地址即可
	Vm          string `json:"vm"`
	VmMySQLHost string `json:"vm_mysql_host"`
	VmMySQLPort string `json:"vm_mysql_port"`
	// 业务信息
	VariablesSlice []string `json:"variable_slice"` // 用于存放 variables的 切片
}
