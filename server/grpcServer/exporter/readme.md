如下业务能不从主库查询的就不从主库操作
查询主库事务的要这么查询 10s查一次 不要太频繁

## 监控大事务

- 某个SQL执行特别慢，导致整个transaction一直处于running阶段
- 某个Session的SQL已经执行完了，但是迟迟没有commit，一直处于sleep阶段
- 某个Session处于lock wait阶段，迟迟没有结束

```sql
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
where trx_mysql_thread_id = conn_id;

```

- 如何快速解决锁等待问题

```sql
select *
from sys.innodb_lock_waits\ G
```

- 查询已经执行完并没有commit的事务

> 取diff_sec字段判断是否超时

```sql
select now(),
       (UNIX_TIMESTAMP(now()) - UNIX_TIMESTAMP(a.trx_started)) diff_sec,
       b.id,
       b.user,
       b.host,
       b.db,
       d.SQL_TEXT
from information_schema.innodb_trx a
         inner join
     information_schema.PROCESSLIST b
     on a.TRX_MYSQL_THREAD_ID = b.id and b.command = 'Sleep'
         inner join performance_schema.threads c ON b.id = c.PROCESSLIST_ID
         inner join performance_schema.events_statements_current d ON d.THREAD_ID = c.THREAD_ID;
```

```sql
#
查看sql processlist中的非系统库的长会话 可以不考虑这个
select *
from information_schema.processlist
where db not in ('mysql', 'sys', 'information_schema', 'performance_schema');
#
查看正在执行的sql
SELECT *
FROM information_schema.PROCESSLIST
WHERE command not in ('Sleep', 'Connect');
```

```sql
#
查询无主键表
SELECT table_schema,
       table_name
FROM information_schema.TABLES
WHERE (table_schema, table_name) NOT IN
      (SELECT DISTINCT table_schema, table_name FROM information_schema.COLUMNS WHERE COLUMN_KEY = 'PRI')
  AND table_schema NOT IN ('sys', 'mysql', 'information_schema', 'performance_schema');
```

```sql
#
空间大小
SELECT table_schema AS '数据库', table_name AS '表名', a.TABLE_TYPE,
       a.`ENGINE`,
       a.CREATE_TIME,
       a.UPDATE_TIME,
       a.TABLE_COLLATION,
       table_rows AS '记录数', TRUNCATE ( data_length / 1024 / 1024, 2 ) AS '数据容量(MB)', TRUNCATE ( index_length / 1024 / 1024, 2 ) AS '索引容量(MB)', TRUNCATE ( (data_length + index_length) / 1024 / 1024, 2 ) AS '总大小(MB)'
FROM information_schema.TABLES a
GROUP BY table_schema
ORDER BY (data_length + index_length) DESC LIMIT 10;
```

```sql
#
从启动到现在没有使用到的索引
SELECT object_schema, object_name, index_name
FROM performance_schema.table_io_waits_summary_by_index_usage
WHERE index_name IS NOT NULL
  AND count_star = 0
  AND object_schema not in ('mysql', 'performance_schema')
  AND index_name <> 'PRIMARY'
ORDER BY object_schema, object_name;
```

```sql
SELECT CONCAT(center_addr, '--', center_port, '--', backup_root_dir, '--', login_user, '--', login_password) WHERE id IN (
SELECT idc_id
FROM ${saas_db_name}.saas_instance WHERE ip=${mysql_host} AND on_working=1)
```

## 检测强制半同步是否开启

```sql
SELECT 0 AS semisync
FROM DUAL
WHERE NOT EXISTS(SELECT 1
                 FROM performance_schema.global_variables
                 WHERE VARIABLE_NAME = 'rpl_semi_sync_master_wait_no_slave'
                   AND VARIABLE_VALUE = 'ON')
UNION
SELECT 1
FROM DUAL
WHERE EXISTS(SELECT 1
             FROM performance_schema.global_variables
             WHERE VARIABLE_NAME = 'rpl_semi_sync_master_wait_no_slave'
               AND VARIABLE_VALUE = 'ON');
等同于查看参数
rpm_semi_sync_master_wait_no_slave off表示不强制增强半同步
```