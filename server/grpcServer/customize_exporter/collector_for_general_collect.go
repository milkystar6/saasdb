package customize_exporter

import (
	"encoding/json"
	"fmt"
	al "github.com/flipped-aurora/gin-vue-admin/server/grpcServer/agent_logger"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"gorm.io/gorm"
	"strconv"
	"strings"
)

/* 向本地MySQL发送读心跳 */
/* 查询saasdb里 本地电脑上的(ip来自配置文件？也可以的 合并现有的两个配置文件) ，获取节点上有多少个数据 */
/* 使用saasdb_admin用户/saasdb_agent用户向节点的数据库发起select 1 ,检查数据库可用性 */
/* 修改saasdb数据库中表中instance的状态 [先不这么搞 。。]*/
/* 连续ping多次之后还不通，就向webhook推送消息*/
/* 设置个告警恢复机制 有告警的实例写到一个通道中，另外的携程去查询通道中是否有未恢复的 */
/* 添加新的通用的查询 */

func (c *CustomizeCollector) MySQLSelect1(dbInformationSchema dbConnCfg, csaas *gorm.DB, localdb *gorm.DB) {
	//cfg := config.LoadConfig
	//// 访问saasdb ==> get 在saasdb 注册了的数据库的端口
	//// 根据端口 去分别查询数据库
	//localAddr := cfg.MyHostAddrInfo.MyIP
	//
	//csaas, _ := c.connSaasdb()
	//var ins mo.Instance
	//portSlice, _ := ins.QueryPortsByIP(csaas, localAddr, keyForMySQL)
	//
	//for _, v := range portSlice {
	//
	//	dbInformationSchema := dbConnCfg{
	//		//User:   config.LoadConfig.MySQLManager.MysqlManagerUser,
	//		//Passwd: config.LoadConfig.MySQLManager.MysqlManagerPassword,
	//		Host: localAddr,
	//		Port: v,
	//		Db:   informationSchema,
	//	}
	//	fmt.Println(dbInformationSchema)
	//	go c.dbPingWork(dbInformationSchema, csaas)
	//}
	go c.dbPingWork(dbInformationSchema, csaas, localdb)
}

func (c *CustomizeCollector) dbPingWork(cfg dbConnCfg, csaas *gorm.DB, db *gorm.DB) {
	//db, _ := c.connLocalMySQL(cfg)
	//defer c.CloseDB(db)
	//defer c.CloseDB(csaas)
	if err := db.Debug().Raw("SELECT 1").Error; err != nil {
		msg := fmt.Sprintf(`
            {"message_topic":"%v",
            "ins_ip": "%v",
            "ins_port":"%v",
            "suppress_duration":%v,
            "info":"%v"}
            `,
			mesJsonTopicSelect1MySQL,
			cfg.Host,
			cfg.Port,
			select1MySQLUpLimitSuppressDuration,
			keyForSelect,
		)
		SendMsg2WebHook(csaas, msg)
	}

	lockList, t, err := c.dbGetInnodbLockedWaits(db)
	if err != nil {
		al.Error(fmt.Sprintf("%v", err))
	}
	if err == nil && t > 0 {
		//jsonData, err := json.MarshalIndent(lockList, "", "  ")
		//if err != nil {
		//	al.Error(fmt.Sprintf("%v", err))
		//}
		//msg := string(jsonData)

		lockMap := make(map[string]interface{})
		lockMap["lock_list"] = lockList // 这里假设你的 LockList 结构体有一个字段名为 data
		lockMap["ins_host"] = cfg.Host
		lockMap["ins_port"] = cfg.Port

		// 将 map 转换为 JSON 格式
		jsonData, err := json.MarshalIndent(lockMap, "", "  ")
		if err != nil {
			al.Error(fmt.Sprintf("%v", err))
		}
		msg := string(jsonData)
		SendMsg2WebHookWithApi(csaas, msg, "api/v1/mysql_innodb_locks")
	}
}

func (c CustomizeCollector) dbGetInnodbLockedWaits(db *gorm.DB) (milw []model.MySQLInnoDBLockedWaits, t int, e error) {
	// 获取参数 innodb_lock_wait_timeout
	lockWaitTimeout, _ := strconv.Atoi(c.GetVariables(db, "innodb_lock_wait_timeout", 1))
	if lockWaitTimeout >= 10 {
		lockWaitTimeout = 10
	}

	// 5.7 版本 SQL
	sql57 := fmt.Sprintf(`
    SELECT
        r.trx_wait_started AS wait_started,
        TIMEDIFF(NOW(), r.trx_wait_started) AS wait_age,
        TIMESTAMPDIFF(SECOND, r.trx_wait_started, NOW()) AS wait_age_secs,
        rl.lock_table AS locked_table_name,
        rl.lock_index AS locked_index,
        rl.LOCK_TYPE AS locked_type,
        r.trx_id AS waiting_trx_id,
        r.trx_started AS waiting_trx_started,
        TIMEDIFF(NOW(), r.trx_started) AS waiting_trx_age,
        r.trx_rows_locked AS waiting_trx_rows_locked,
        r.trx_rows_modified AS waiting_trx_rows_modified,
        r.trx_mysql_thread_id AS waiting_pid,
        sys.format_statement(r.trx_query) AS waiting_query,
        rl.lock_id AS waiting_lock_id,
        rl.LOCK_MODE AS waiting_lock_mode,
        b.trx_id AS blocking_trx_id,
        b.trx_mysql_thread_id AS blocking_pid,
        sys.format_statement(b.trx_query) AS blocking_query,
        bl.lock_id AS blocking_lock_id,
        bl.LOCK_MODE AS blocking_lock_mode,
        b.trx_started AS blocking_trx_started,
        TIMEDIFF(NOW(), b.trx_started) AS blocking_trx_age,
        b.trx_rows_locked AS blocking_trx_rows_locked,
        b.trx_rows_modified AS blocking_trx_rows_modified,
        CONCAT('KILL QUERY ', b.trx_mysql_thread_id) AS sql_kill_blocking_query,
        CONCAT('KILL ', b.trx_mysql_thread_id) AS sql_kill_blocking_connection
    FROM
        information_schema.innodb_lock_waits w
        JOIN information_schema.INNODB_TRX b ON b.trx_id = CAST(w.blocking_trx_id AS CHAR CHARSET utf8mb4)
        JOIN information_schema.INNODB_TRX r ON r.trx_id = CAST(w.requesting_trx_id AS CHAR CHARSET utf8mb4)
        JOIN information_schema.innodb_locks bl ON bl.LOCK_ID = w.blocking_lock_id
        JOIN information_schema.innodb_locks rl ON rl.LOCK_ID = w.requested_lock_id
    WHERE
    TIMESTAMPDIFF(SECOND, r.trx_wait_started, NOW()) >= %v
    ORDER BY r.trx_wait_started
    `,
		lockWaitTimeout)

	// 8.0 版本 SQL
	sql80 := fmt.Sprintf(`
    SELECT
        r.trx_wait_started AS wait_started,
        TIMEDIFF(NOW(), r.trx_wait_started) AS wait_age,
        TIMESTAMPDIFF(SECOND, r.trx_wait_started, NOW()) AS wait_age_secs,
        CONCAT(sys.quote_identifier(rl.OBJECT_SCHEMA), '.', sys.quote_identifier(rl.OBJECT_NAME)) AS locked_table,
        rl.OBJECT_SCHEMA AS locked_table_schema,
        rl.OBJECT_NAME AS locked_table_name,
        rl.PARTITION_NAME AS locked_table_partition,
        rl.SUBPARTITION_NAME AS locked_table_subpartition,
        rl.INDEX_NAME AS locked_index,
        rl.LOCK_TYPE AS locked_type,
        r.trx_id AS waiting_trx_id,
        r.trx_started AS waiting_trx_started,
        TIMEDIFF(NOW(), r.trx_started) AS waiting_trx_age,
        r.trx_rows_locked AS waiting_trx_rows_locked,
        r.trx_rows_modified AS waiting_trx_rows_modified,
        r.trx_mysql_thread_id AS waiting_pid,
        sys.format_statement(r.trx_query) AS waiting_query,
        rl.ENGINE_LOCK_ID AS waiting_lock_id,
        rl.LOCK_MODE AS waiting_lock_mode,
        b.trx_id AS blocking_trx_id,
        b.trx_mysql_thread_id AS blocking_pid,
        sys.format_statement(b.trx_query) AS blocking_query,
        bl.ENGINE_LOCK_ID AS blocking_lock_id,
        bl.LOCK_MODE AS blocking_lock_mode,
        b.trx_started AS blocking_trx_started,
        TIMEDIFF(NOW(), b.trx_started) AS blocking_trx_age,
        b.trx_rows_locked AS blocking_trx_rows_locked,
        b.trx_rows_modified AS blocking_trx_rows_modified,
        CONCAT('KILL QUERY ', b.trx_mysql_thread_id) AS sql_kill_blocking_query,
        CONCAT('KILL ', b.trx_mysql_thread_id) AS sql_kill_blocking_connection
    FROM
        performance_schema.data_lock_waits w
        JOIN information_schema.INNODB_TRX b ON b.trx_id = CAST(w.BLOCKING_ENGINE_TRANSACTION_ID AS CHAR CHARSET utf8mb4)
        JOIN information_schema.INNODB_TRX r ON r.trx_id = CAST(w.REQUESTING_ENGINE_TRANSACTION_ID AS CHAR CHARSET utf8mb4)
        JOIN performance_schema.data_locks bl ON bl.ENGINE_LOCK_ID = w.BLOCKING_ENGINE_LOCK_ID
        JOIN performance_schema.data_locks rl ON rl.ENGINE_LOCK_ID = w.REQUESTING_ENGINE_LOCK_ID
    WHERE
    TIMESTAMPDIFF(SECOND, r.trx_wait_started, NOW()) >= %v
    ORDER BY r.trx_wait_started
    `,
		lockWaitTimeout)
	ver := strings.Split(c.GetVariables(db, "version", 1), ".")
	bigVer, _ := strconv.Atoi(ver[0] + ver[1])
	getLockSQL := ""
	if bigVer == 57 {
		getLockSQL = sql57
	} else if bigVer == 80 {
		getLockSQL = sql80
	}
	err := db.Raw(getLockSQL).Scan(&milw).Error
	return milw, len(milw), err
}
