#!/bin/python3
"""
author: milkystar
function: 用于定义查询mysql指标的语句
"""

sql_get_tables_info = """
SELECT
TABLE_SCHEMA AS '数据库',
TABLE_NAME AS '表名',
TABLE_ROWS AS '行数',
CONCAT(ROUND(DATA_LENGTH / (1024 * 1024), 2), ' MB') AS '数据大小',
CONCAT(ROUND(INDEX_LENGTH / (1024 * 1024), 2), ' MB') AS '索引大小',
CONCAT(ROUND(DATA_FREE / (1024 * 1024), 2), ' MB') AS '未使用空间',
ROUND(((DATA_LENGTH + INDEX_LENGTH) / (1024 * 1024 * 1024)), 3) AS '总大小(GB)',
ROUND(((DATA_LENGTH + INDEX_LENGTH) / (1024 * 1024)) / (1024 * 1024), 2) AS '总大小(GB)',
ROUND((DATA_FREE / (DATA_LENGTH + INDEX_LENGTH)) * 100, 2) AS '碎片率(%)',
ENGINE AS '存储引擎'
FROM
INFORMATION_SCHEMA.TABLES
WHERE
TABLE_SCHEMA NOT IN ('MYSQL', 'SYS', 'INFORMATION_SCHEMA', 'PERFORMANCE_SCHEMA', 'TEST')
ORDER BY
TABLE_SCHEMA,
`总大小(GB)` DESC;
"""

sql_get_tables_not_innodb = """
SELECT
TABLE_SCHEMA AS '数据库',
TABLE_NAME AS '表名',
ENGINE AS '存储引擎'
FROM
INFORMATION_SCHEMA.TABLES
WHERE
TABLE_SCHEMA NOT IN ('MYSQL', 'SYS', 'INFORMATION_SCHEMA', 'PERFORMANCE_SCHEMA', 'TEST')
AND ENGINE != "InnoDB"
ORDER BY
TABLE_SCHEMA;
"""

sql_get_schema = """
SELECT SCHEMA_NAME AS 数据库名称, DEFAULT_CHARACTER_SET_NAME AS 默认字符集, DEFAULT_COLLATION_NAME AS 默认字符序列
FROM information_schema.schemata;
"""

sql_get_no_pk_table = """
select
	table_schema AS 数据库名称,
	table_name AS 表名称
from
	information_schema.TABLES
where
	(table_schema,
	table_name) not in
      (
	select
		distinct table_schema,
		table_name
	from
		information_schema.COLUMNS
	where
		COLUMN_KEY = 'PRI')
	and table_schema not in ('sys', 'mysql', 'information_schema', 'performance_schema');
"""

sql_get_user_info = """
select
	user,
	Host,
	Super_priv,
	password_expired,
	password_last_changed,
	password_lifetime,
	account_locked
from
	mysql.user;
"""
