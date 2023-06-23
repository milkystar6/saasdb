package saasdb

// SaasdbConn 定义后端saasdb config地址 ，参考config模块
type SaasdbConn struct {
	Username, Password, Host string
	Port                     uint32
	Dbname                   string
}
