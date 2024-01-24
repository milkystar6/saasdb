package customize_exporter

import (
	"fmt"
	al "github.com/flipped-aurora/gin-vue-admin/server/grpcServer/agent_logger"
	"gorm.io/gorm"
	"time"
)

type Transaction struct {
	TrxID              string    `gorm:"column:trx_id"`
	TrxState           string    `gorm:"column:trx_state"`
	TrxStarted         time.Time `gorm:"column:trx_started"`
	ProcesslistID      int       `gorm:"column:processlist_id"`
	TrxLockMemoryBytes int       `gorm:"column:trx_lock_memory_bytes"`
	User               string    `gorm:"column:user"`
	Command            string    `gorm:"column:command"`
	State              string    `gorm:"column:state"`
	CurrentStatement   string    `gorm:"column:current_statement"`
	LastStatement      string    `gorm:"column:last_statement"`
	Host               string    `gorm:"column:host"`
	Db                 string    `gorm:"column:db"`
	DiffSec            string    `gorm:"column:diff_sec"`
}

func (c *CustomizeCollector) GetLongQuerySql(dbInformationSchema dbConnCfg, csaas *gorm.DB, localdb *gorm.DB) {
	//cfg := config.LoadConfig
	//// 访问saasdb ==> get 在saasdb 注册了的数据库的端口
	//// 根据端口 去分别查询数据库
	//localAddr := cfg.MyHostAddrInfo.MyIP
	//
	//csaas, _ := c.connSaasdb()
	//var ins mo.Instance
	//portSlice, _ := ins.QueryPortsByIP(csaas, localAddr, keyForMySQL)
	//for _, v := range portSlice {
	//
	//	dbInformationSchema := dbConnCfg{
	//		//User:   config.LoadConfig.MySQLManager.MysqlManagerUser,
	//		//Passwd: config.LoadConfig.MySQLManager.MysqlManagerPassword,
	//		Host: localAddr,
	//		Port: v,
	//		Db:   informationSchema,
	//	}
	//	go func() {
	//		err := c.LongQuerySql(dbInformationSchema, csaas)
	//		if err != nil {
	//			al.Error(fmt.Sprintf("分析长事务出错: %v", err))
	//		}
	//	}()
	//}
	go func() {
		err := c.LongQuerySql(dbInformationSchema, csaas, localdb)
		if err != nil {
			al.Error(fmt.Sprintf("分析长事务出错: %v", err))
		}
	}()
}

func (c *CustomizeCollector) LongQuerySql(cfg dbConnCfg, csaas *gorm.DB, db *gorm.DB) (e error) {
	//db, _ := c.connLocalMySQL(cfg)

	tol := int64(0)
	yyy := "%S_TIMETASK%"
	checkSql := fmt.Sprintf(`
select
count(*)
from
	information_schema.innodb_trx a
inner join information_schema. PROCESSLIST b on
	a.TRX_MYSQL_THREAD_ID = b.id
	and b.command = "Sleep"
	and ( UNIX_TIMESTAMP(now()) - UNIX_TIMESTAMP(a.trx_started) ) >%v
inner join PERFORMANCE_SCHEMA .threads c on
	b.id = c.PROCESSLIST_ID
inner join PERFORMANCE_SCHEMA .events_statements_current d on
	d.THREAD_ID = c.THREAD_ID
	and upper(d.SQL_TEXT) not like "%%%v";
`, longTransactionThreshold, yyy)

	getLongTrxInfo := fmt.Sprintf(`
select
	a.trx_started  AS trx_started, 
	(UNIX_TIMESTAMP(now()) - UNIX_TIMESTAMP(a.trx_started)) AS  diff_sec,
	b.id AS trx_id,
	b.user AS user ,
	b.HOST AS host,
	b.db AS db,
	d.SQL_TEXT AS last_statement
from
	information_schema.innodb_trx a
inner join information_schema. PROCESSLIST b on
	a.TRX_MYSQL_THREAD_ID = b.id
	and b.command = "Sleep"
	and ( UNIX_TIMESTAMP(now()) - UNIX_TIMESTAMP(a.trx_started) ) >%v
inner join PERFORMANCE_SCHEMA .threads c on
	b.id = c.PROCESSLIST_ID
inner join PERFORMANCE_SCHEMA .events_statements_current d on
	d.THREAD_ID = c.THREAD_ID
	and upper(d.SQL_TEXT) not like "%%%v" order by 2;
`, longTransactionThreshold, yyy)

	//	getLongQuerySqlNum := fmt.Sprintf(`
	//select count(*)
	//from information_schema.INNODB_TRX,
	//     sys.session as se
	//where trx_mysql_thread_id = conn_id
	//AND TIMESTAMPDIFF(SECOND, INNODB_TRX.trx_started, NOW()) > %v;`, longTransactionThreshold)
	//
	//	e = db.Raw(getLongQuerySqlNum).Scan(&tol).Error
	e = db.Raw(checkSql).Scan(&tol).Error

	//	getLongQuerySql := fmt.Sprintf(`
	//select trx_id,
	//       INNODB_TRX.trx_state,
	//       INNODB_TRX.trx_started,
	//       se.conn_id as processlist_id,
	//       trx_lock_memory_bytes,
	//       se.user,
	//       se.command,
	//       se.state,
	//       se.current_statement,
	//       se.last_statement
	//from information_schema.INNODB_TRX,
	//     sys.session as se
	//where trx_mysql_thread_id = conn_id
	//AND TIMESTAMPDIFF(SECOND, INNODB_TRX.trx_started, NOW()) > %v;`, longTransactionThreshold)

	var transactions []Transaction
	//e = db.Raw(getLongQuerySql).Scan(&transactions).Error
	e = db.Raw(getLongTrxInfo).Scan(&transactions).Error

	if tol > 0 && transactions != nil {
		msg := fmt.Sprintf(`
{"message_topic":"%v",
"ins_ip": "%v",
"ins_port":"%v",
"suppress_duration":%v,
"info":"%v，counts:%v,more detail: %v"}
`, mesJsonTopicLongTrx, cfg.Host, cfg.Port, longTrxUpLimitSuppressDuration, keyForLongTrx, tol, transactions)
		SendMsg2WebHook(csaas, msg)
	}

	//c.CloseDB(db)
	//c.CloseDB(csaas)
	return e
}
