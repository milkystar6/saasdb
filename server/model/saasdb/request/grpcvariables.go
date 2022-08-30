package request

type ReqVariables struct {
	// 只需要知道 到与哪个节点的grpcserver交互和对应的mysql连接地址即可
	Vm          string `json:"vm"`
	VmMySQLHost string `json:"vm_mysql_host"`
	VmMySQLPort string `json:"vm_mysql_port"`
	// 业务信息
	VariablesSlice []string `json:"variable_slice"` // 用于存放 variables的 切片
}

type DecodeVariablesJson struct {
	VariableName VariableName `json:"variableName"`
}

type VariableName struct {
	InnodbBufferPoolSize      string `json:"innodb_buffer_pool_size"`
	SqlMode                   string `json:"sql_mode"`
	TransactionIsolation      string `json:"transaction_isolation"`
	Version                   string `json:"version"`
	InnodbAdaptiveFlushing    string `json:"innodb_adaptive_flushing"`
	InnodbAdaptiveHashIndex   string `json:"innodb_adaptive_hash_index"`
	InnodbDoublewrite         string `json:"innodb_doublewrite"`
	InnodbIoCapacity          string `json:"innodb_io_capacity"`
	InnodbLockWaitTimeout     string `json:"innodb_lock_wait_timeout"`
	InnodbLogFileSize         string `json:"innodb_log_file_size"`
	InnodbLogFilesInGroup     string `json:"innodb_log_files_in_group"`
	InnodbReadOnly            string `json:"innodb_read_only"`
	InnodbFlushLogAtTrxCommit string `json:"innodb_flush_log_at_trx_commit"`
	SyncBinlog                string `json:"sync_binlog"`
}
