package hook_command

import (
	"fmt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"log"
	"strings"
)

type InstanceModifyRole struct {
	//Ip     string `json:"ip" form:"ip" gorm:"column:ip;comment:ip;uniqueIndex:ip_port;"`
	//Port   *int   `json:"port" form:"port" gorm:"column:port;comment:port;uniqueIndex:ip_port;"`
	Health string `json:"health,omitempty" form:"health" gorm:"column:health;type:enum('available','unavailable','restarting','starting','stoping','migrating','standby');comment:;"`
	Role   string `json:"role,omitempty" form:"role" gorm:"column:role;type:enum('master','slaveforha','slaveonly');comment:数据库实例在集群中的角色，master节点只能有一个;"`
}

func (InstanceModifyRole) TableName() string {
	return "saas_instance"
}

func newConn(meta ModifyRoleMsg) (db *gorm.DB, err error) {
	// 用户名:密码@tcp(ip:port)/数据库?charset=utf8mb4&parseTime=True&loc=Local
	dsn := fmt.Sprintf("%v:%v@tcp(%v:%v)/%v?charset=utf8mb4&parseTime=True&loc=Local&timeout=10s&readTimeout=10s&writeTimeout=10s", meta.MSaasDBUser, meta.MSaasDBPassword, strings.Split(meta.MSaasDBAddr, ":")[0], strings.Split(meta.MSaasDBAddr, ":")[1], "saasdb")
	fmt.Println(dsn)
	db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{SkipDefaultTransaction: true})
	// TODO 错误处理 不panic 统计日志记录格式
	if err != nil {
		log.Println("Conn mysql :%v failed,err:%v", dsn, err)
	}
	return db, err
}
