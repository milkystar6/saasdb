package customize_exporter

var getLongQuerySql string

func (c *CustomizeCollector) longQuerySql(cfg dbConnCfg) (i []interface{}, e error) {
	db := c.connLocalMySQL(cfg)
	getLongQuerySql = `
select trx_id,
       INNODB_TRX.trx_state,
       INNODB_TRX.trx_started,
       se.conn_id as processlist_id,
       trx_lock_memory_bytes,
       se.user,
       se.command,
       se.state,
       se.current_statement,
       se.last_statement
from information_schema.INNODB_TRX,
     sys.session as se
where trx_mysql_thread_id = conn_id;`
	e = db.Raw(getLongQuerySql).Error
	return i, e
}
