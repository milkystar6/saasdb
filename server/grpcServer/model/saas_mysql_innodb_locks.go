package model

import "time"

/*
如下两个结构体用于映射 mysql innodb 存储引擎表 锁的信息
*/

type MySQLInnoDBLockedWaits struct {
	InsHost                   string    `json:"ins_host,omitempty"`
	InsPort                   int       `json:"ins_port,omitempty"`
	WaitStarted               time.Time `gorm:"column:wait_started"`
	WaitAge                   string    `gorm:"column:wait_age"`
	WaitAgeSecs               int       `gorm:"column:wait_age_secs"`
	LockedTable               string    `gorm:"column:locked_table"`
	LockedTableSchema         string    `gorm:"column:locked_table_schema"`
	LockedTableName           string    `gorm:"column:locked_table_name"`
	LockedTablePartition      string    `gorm:"column:locked_table_partition"`
	LockedTableSubpartition   string    `gorm:"column:locked_table_subpartition"`
	LockedIndex               string    `gorm:"column:locked_index"`
	LockedType                string    `gorm:"column:locked_type"`
	WaitingTrxID              string    `gorm:"column:waiting_trx_id"`
	WaitingTrxStarted         time.Time `gorm:"column:waiting_trx_started"`
	WaitingTrxAge             string    `gorm:"column:waiting_trx_age"`
	WaitingTrxRowsLocked      int       `gorm:"column:waiting_trx_rows_locked"`
	WaitingTrxRowsModified    int       `gorm:"column:waiting_trx_rows_modified"`
	WaitingPID                string    `gorm:"column:waiting_pid"`
	WaitingQuery              string    `gorm:"column:waiting_query"`
	WaitingLockID             string    `gorm:"column:waiting_lock_id"`
	WaitingLockMode           string    `gorm:"column:waiting_lock_mode"`
	BlockingTrxID             string    `gorm:"column:blocking_trx_id"`
	BlockingPID               string    `gorm:"column:blocking_pid"`
	BlockingQuery             string    `gorm:"column:blocking_query"`
	BlockingLockID            string    `gorm:"column:blocking_lock_id"`
	BlockingLockMode          string    `gorm:"column:blocking_lock_mode"`
	BlockingTrxStarted        time.Time `gorm:"column:blocking_trx_started"`
	BlockingTrxAge            string    `gorm:"column:blocking_trx_age"`
	BlockingTrxRowsLocked     int       `gorm:"column:blocking_trx_rows_locked"`
	BlockingTrxRowsModified   int       `gorm:"column:blocking_trx_rows_modified"`
	SqlKillBlockingQuery      string    `gorm:"column:sql_kill_blocking_query"`
	SqlKillBlockingConnection string    `gorm:"column:sql_kill_blocking_connection"`
}
