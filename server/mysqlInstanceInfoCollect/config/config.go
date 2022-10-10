package config

import (
	"flag"
	"github.com/BurntSushi/toml"
	"log"
)

var LoadConfig MyConnInfo

type MyConnInfo struct {
	MySQLInstance MySQLInstance
	SaasDB        SaasDB
	Instance      Instance
}
type MySQLInstance struct {
	// MySQL 实例连接信息
	MyHost     string `toml:"MyHost"  json:"my_host,omitempty"`
	MyUser     string `toml:"MyUser" json:"my_user,omitempty"`
	MyPassword string `toml:"MyPassword" json:"my_password,omitempty"`
	MyPort     int    `toml:"MyPort" json:"my_port,omitempty"`
}

type SaasDB struct {
	// SaasDB数据库连接信息
	SaasDBHost   string `toml:"SaasDBHost" json:"saas_db_host"`
	SaasDBUser   string `toml:"SaasDBUser" json:"saas_db_user"`
	SaasPassword string `toml:"SaasPassword" json:"saas_password"`
	SaasPort     int    `toml:"SaasPort" json:"saas_port"`
	SaasDBName   string `toml:"SaasDBName" json:"saas_db_name"`
}

type Instance struct {
	//InstanceName string `toml:"InstanceName" json:"instance_name"`
	ProjId       int    `toml:"ProjId" json:"proj_id"`
	DomainId     int    `toml:"DomainId" json:"domain_id"`
	Role         string `toml:"Role" json:"role"`
}

//func (M *MyConnInfo) GetConnInfo() {
//	flag.StringVar(&M.MyHost, "host", "127.0.0.1", "host")
//	flag.StringVar(&M.MyUser, "user", "testuser", "user")
//	flag.StringVar(&M.MyPassword, "password", "testpassword", "password")
//	flag.IntVar(&M.MyPort, "port", 3306, "port")
//	flag.Parse()
//}

func (M *MyConnInfo) InitConfigfile() *MyConnInfo {
	configfile := ""
	flag.StringVar(&configfile, "f", "config.toml", "configfile")
	flag.Parse()
	return LoadConfig.LoadConfig(configfile)
}

func (M *MyConnInfo) LoadConfig(configfile string) *MyConnInfo {
	_, err := toml.DecodeFile(configfile, &M)
	if err != nil {
		log.Fatal("load configfile error ,err %v", err.Error())
	}
	return M
}
