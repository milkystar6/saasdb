package customize_exporter

// 该package的共有变量
const (
	/* 如下是关于ogg dp用户 定义的常量 */
	keyForMySQL        = "mysql"
	keyForDumpBinlog   = "Binlog Dump"
	keyForOggOrDpUser  = "qry_bdextract"
	webhookTag         = "customize_exporter"
	maxDumpStatConnNum = 6
	informationSchema  = "information_schema"
	// webhook消息通知
	msgJsonTopicDumpGtid    = "CheckSession-Ogg_Dp_Dump_Binlog"
	oggOrDpSuppressDuration = 3600 - 5

	/* 如下是关于活跃会话 定义的常量 */
	msgJsonTopicActiveSessions            = "CountActiveSessions"
	activeSessionsUpLimit                 = 50
	activeSessionsUpLimitSuppressDuration = 600 - 5
	keyForCountActiveSessions             = "数据库正在运行的活跃会话个数"

	/* 如下是关于 meta data lock 定义的常量 */
	msgJsonTopicMetaDataLock = "MetaDataLock"
	keyForMetaDataLock       = "数据库此刻存在元数据锁定等待，请优先检查此问题！！！！！"
	stateOfMetaDataLock      = "metadata lock"
	//stateOfMetaDataLock = "Waiting for table metadata lock"
	metaDataLockUpLimitSuppressDuration = 60 - 5
	metaDataLockMsgPlaceholder          = "                          "

	/* 如下是长事务 定义的常量*/
	mesJsonTopicLongTrx            = "LongTrx"
	keyForLongTrx                  = "数据库此刻存在长事务，请关注数据库状态"
	longTrxUpLimitSuppressDuration = 60 - 5
	// 长事务阈值
	longTransactionThreshold = 10

	/* 如下是 ping db监控 */
	mesJsonTopicSelect1MySQL            = "PingMySQL"
	select1MySQLUpLimitSuppressDuration = 60
	keyForSelect                        = "MySQL 不可读取"

	/* 如下是dir usage */
	mesJsonTopicDirUsage = "Top10FileUsage"
)
