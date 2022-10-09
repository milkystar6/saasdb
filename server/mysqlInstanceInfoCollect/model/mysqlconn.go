package model

import (
	"MySQLInstanceInfoCollect/config"
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"log"
	"strconv"
)

type MyDB struct {
	DB *gorm.DB
}

var ConnInfo config.MyConnInfo

func (c MyDB) InitConfigFile() *config.MyConnInfo {
	return ConnInfo.InitConfigfile()
}

func (c *MyDB) NewDBConn(isInstance bool, conn *config.MyConnInfo) (*MyDB, error) {

	var db *gorm.DB
	var err error
	if isInstance {
		db, err = c.ConnectDB(conn.MySQLInstance.MyHost, strconv.Itoa(conn.MySQLInstance.MyPort), conn.MySQLInstance.MyUser, conn.MySQLInstance.MyPassword, "information_schema")

	} else {
		db, err = c.ConnectDB(conn.SaasDB.SaasDBHost, strconv.Itoa(conn.SaasDB.SaasPort), conn.SaasDB.SaasDBUser, conn.SaasDB.SaasPassword, conn.SaasDB.SaasDBName)
	}

	if err != nil {
		return nil, err
	}
	return &MyDB{
		DB: db,
	}, nil
}
func (c *MyDB) ConnectDB(ip, port, username, password, dbname string) (db *gorm.DB, err error) {
	// 用户名:密码@tcp(ip:port)/数据库?charset=utf8mb4&parseTime=True&loc=Local
	dsn := fmt.Sprintf("%v:%v@tcp(%v:%v)/%v?charset=utf8mb4&parseTime=True&loc=Local&timeout=10s&readTimeout=10s&writeTimeout=10s", username, password, ip, port, dbname)
	fmt.Println(dsn)
	db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{SkipDefaultTransaction: true})
	// TODO 错误处理 不panic 统计日志记录格式
	if err != nil {
		log.Println("Conn mysql :%v failed,err:%v", dsn, err)
	}
	return db, err
}
