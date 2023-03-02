-- 创建默认的数据库账号和完成授权 --
-- author: milky star --
-- email: haochen@corp.netease.com --

set sql_log_bin=0;

-- proj_sa --
DROP USER IF EXISTS 'proj_sa'@'%';
CREATE USER 'proj_sa'@'%' IDENTIFIED WITH mysql_native_password BY 'A424970F97C19A2E88CF72038C039' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT SELECT, RELOAD, PROCESS, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'proj_sa'@'%';


-- repl --
DROP USER IF EXISTS 'repl'@'%';
CREATE USER 'repl'@'%' IDENTIFIED WITH mysql_native_password BY '3665156F23D8C05603DC53EBAD2D7E374' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl'@'%';

-- monitor --
DROP USER IF EXISTS 'pmm'@'localhost';
CREATE USER 'pmm'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '7yZ3WjZThF5eKqh5' WITH MAX_USER_CONNECTIONS 10;
GRANT SELECT, PROCESS, REPLICATION CLIENT, RELOAD, BACKUP_ADMIN ON *.* TO 'pmm'@'localhost';
GRANT PROCESS, REPLICATION CLIENT, SELECT,SUPER  ON *.* TO 'pmm'@'localhost';
-- saasdb_admin --
DROP USER IF EXISTS 'saasdb_admin'@'127.0.0.1';
CREATE USER 'saasdb_admin'@'127.0.0.1' IDENTIFIED WITH 'mysql_native_password' BY '7yZ3WjZThF5eKqh5' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT SELECT, RELOAD, PROCESS, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'saasdb_admin'@'127.0.0.1';


-- backup --
DROP USER IF EXISTS 'backup'@'%';
CREATE USER 'backup'@'%' IDENTIFIED WITH 'mysql_native_password' AS '*84F85C2180F3305F7058C5463AAD498EFE72DAAE' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT BACKUP_ADMIN on *.* TO 'backup'@'%';

-- make sure this variables enable --
SET GLOBAL slow_query_log = 1;
SET GLOBAL log_output = 'FILE';
SET GLOBAL long_query_time = 0;



UPDATE performance_schema.setup_consumers
SET ENABLED = 'YES' WHERE NAME LIKE '%statements%';
SET GLOBAL innodb_monitor_enable = all;
