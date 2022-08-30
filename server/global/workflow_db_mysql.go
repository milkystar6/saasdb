package global

/*
  用来记录数据库操作的时候，grpc_pb 像对端节点发送任务请求时所需要的信息
  第一版本，支持单个任务处理
  第二版本，支持多个任务并行发送任务处理
  用结构体来存储这些信息

  数据库中统一创建一个任务用户 权限得有所需任务的权限
*/

type GrpcMsg struct {
	// WorkNode 操作节点ip地址
	WorkNode string
	// WorkPort grpc_pb client 端口
	WorkPort int
	// MySQL Conn
	MySQLConn MySQLConn
}
type MySQLConn struct {
	// MySQL Conn
	MysqlUser   string
	MysqlPasswd string
	MysqlHost   string
	MysqlPort   int
}

var DefaultVariablesList = []string{"innodb_buffer_pool_size", "sql_mode", "version", "transaction_isolation", "innodb_adaptive_flushing", "innodb_adaptive_hash_index", "innodb_doublewrite", "innodb_io_capacity", "innodb_lock_wait_timeout", "innodb_log_file_size", "innodb_log_files_in_group", "innodb_read_only", "innodb_flush_log_at_trx_commit", "sync_binlog"}
