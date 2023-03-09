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
CREATE USER 'repl'@'%' IDENTIFIED WITH mysql_native_password BY '3665156F23D8C0560' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'repl'@'%';

-- monitor --
DROP USER IF EXISTS 'pmm'@'localhost';
CREATE USER 'pmm'@'localhost' IDENTIFIED BY '7yZ3WjZThF5eKqh5' WITH MAX_USER_CONNECTIONS 10;
GRANT SELECT, PROCESS, REPLICATION CLIENT, RELOAD ON *.* TO 'pmm'@'localhost';
GRANT PROCESS, REPLICATION CLIENT, SELECT ON *.* TO 'pmm'@'localhost';

-- saasdb_admin --
DROP USER IF EXISTS 'saasdb_admin'@'%';
CREATE USER 'saasdb_admin'@'%' IDENTIFIED WITH 'mysql_native_password' BY '7yZ3WjZThF5eKqh5' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT SELECT, RELOAD, PROCESS, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'saasdb_admin'@'%';

-- backup --
DROP USER IF EXISTS 'backup'@'127.0.0.1';
CREATE USER 'backup'@'127.0.0.1' IDENTIFIED WITH 'mysql_native_password' BY 'B@ckup@dmIn@' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT SELECT, CREATE, DROP, RELOAD, PROCESS, FILE, SUPER, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'backup'@'127.0.0.1';
GRANT INSERT, UPDATE, CREATE, DROP ON `mysql`.`backup_progress` TO 'backup'@'127.0.0.1';
GRANT SELECT, INSERT, UPDATE, CREATE, DROP, ALTER ON `mysql`.`backup_history` TO 'backup'@'127.0.0.1';
GRANT INSERT, UPDATE, CREATE, DROP ON `mysql`.`backup_sbt_history` TO 'backup'@'127.0.0.1';


-- make sure this variables enable --
SET GLOBAL slow_query_log = 1;
SET GLOBAL log_output = 'FILE';
SET GLOBAL long_query_time = 0;


-- 创建 orch_client 用户，用于探测、切换
DROP USER IF EXISTS 'orch_client'@'%';
CREATE USER 'orch_client'@'%' IDENTIFIED WITH 'mysql_native_password' BY '7yZ3WjZThF5eKqh5' REQUIRE NONE PASSWORD EXPIRE DEFAULT ACCOUNT UNLOCK;
GRANT RELOAD, PROCESS, SUPER, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'orch_client'@'%';
GRANT SELECT ON meta.* TO 'orch_client'@'%';
GRANT SELECT ON `mysql`.`slave_master_info` TO 'orch_client'@'%';
