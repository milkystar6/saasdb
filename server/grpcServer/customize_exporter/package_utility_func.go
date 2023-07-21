package customize_exporter

import (
	"fmt"
	al "github.com/flipped-aurora/gin-vue-admin/server/grpcServer/agent_logger"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

/*
  用于实现公共方法，方便外部调用
  A common function can be referred to as a "shared function" or a "utility function"
*/

/* 如下方法实现访问数据库 */

type dbConnCfg struct {
	User   string
	Passwd string
	Host   string
	Port   int
	Db     string
}

// 采用独立的连接
func (c *CustomizeCollector) connSaasdb() *gorm.DB {
	dbCfg := dbConnCfg{
		User:   config.LoadConfig.SaasDB.SaasDBUser,
		Passwd: config.LoadConfig.SaasDB.SaasPassword,
		Host:   config.LoadConfig.SaasDB.SaasDBHost,
		Port:   config.LoadConfig.SaasDB.SaasPort,
		Db:     config.LoadConfig.SaasDB.SaasDBName,
	}
	return c.newConn(dbCfg)
}
func (c *CustomizeCollector) connLocalMySQL(cfg dbConnCfg) *gorm.DB {
	dbCfg := dbConnCfg{
		User:   config.LoadConfig.MySQLManager.MysqlManagerUser,
		Passwd: config.LoadConfig.MySQLManager.MysqlManagerPassword,
		Host:   cfg.Host,
		Port:   cfg.Port,
		Db:     cfg.Db,
	}
	return c.newConn(dbCfg)
}

func (c *CustomizeCollector) newConn(cfg dbConnCfg) (db *gorm.DB) {
	// 用户名:密码@tcp(ip:port)/数据库?charset=utf8mb4&parseTime=True&loc=Local
	dsn := fmt.Sprintf("%v:%v@tcp(%v:%v)/%v?charset=utf8mb4&parseTime=True&loc=Local&timeout=10s&readTimeout=10s&writeTimeout=10s", cfg.User, cfg.Passwd, cfg.Host, cfg.Port, cfg.Db)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{SkipDefaultTransaction: true})
	// TODO 错误处理 不panic 统计日志记录格式
	if err != nil {
		al.Error(fmt.Sprintf("Conn mysql :%v failed,err:%v\n", dsn, err))
	}

	// 注意要手动关闭db db.DB.close()

	return db
}

func (c *CustomizeCollector) CloseDB(db *gorm.DB) {
	sqlDB, _ := db.DB()
	err := sqlDB.Close()
	if err != nil {
		return
	}
}
