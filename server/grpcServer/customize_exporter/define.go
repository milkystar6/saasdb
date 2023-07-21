package customize_exporter

// 该package的共有变量
const (
	/* 如下是关于ogg dp用户的常量 */
	keyForDumpBinlog   = "Binlog Dump"
	keyForOggOrDpUser  = "qry_bdextract"
	webhookTag         = "customize_exporter"
	maxDumpStatConnNum = -1
	informationSchema  = "information_schema"
	// webhook消息通知
	msgJsonTopicDumpGtid = "ogg_db_binlog_dump"
)
