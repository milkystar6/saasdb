package config

import (
	"flag"
	"github.com/BurntSushi/toml"
	"log"
)

const SaasDBNAME = "saasdb"

// ServerConfig 配置文件匹配
type ServerConfig struct {
	MySQLManager   *MySQLManager   `yaml:"MySQLManager" json:"MySQLManager" toml:"MySQLManager"`
	GrpcServer     *GrpcServer     `yaml:"GrpcServer" json:"GrpcServer" toml:"GrpcServer"`
	SaasDB         *SaasDB         `yaml:"SaasDB" json:"SaasDB" toml:"SaasDB"`
	MyHostAddrInfo *MyHostAddrInfo `yaml:"MyHostAddrInfo" json:"MyHostAddrInfo" toml:"MyHostAddrInfo"`
	Scripts        *Scripts        `yaml:"scripts" toml:"scripts" json:"scripts,omitempty"`
}
type MyHostAddrInfo struct {
	MyIP string `yaml:"MyIP" json:"MyIP" toml:"MyIP"`
}
type MySQLManager struct {
	MysqlManagerUser     string `yaml:"mysqlmanager_user" json:"mysqlmanager_user" toml:"mysqlmanager_user"`
	MysqlManagerPassword string `yaml:"mysqlmanager_password" json:"mysqlmanager_password" toml:"mysqlmanager_password"`
	//MysqlLocalAddr       string `yaml:"mysql_local_addr" json:"mysql_local_addr,omitempty" toml:"mysql_local_addr"`
}

type GrpcServer struct {
	CreditsServeKey string `yaml:"creditsServeKey" json:"creditsServeKey" toml:"creditsServeKey"`
	CreditsServeCrt string `yaml:"creditsServeCrt" json:"creditsServeCrt" toml:"creditsServeCrt"`
	Protocol        string `yaml:"protocol" json:"protocol" toml:"protocol"`
	ListenPort      int    `yaml:"listenPort" json:"listenPort" toml:"listenPort"`
}

type SaasDB struct {
	// SaasDB数据库连接信息
	SaasDBHost   string `yaml:"saas_db_host" toml:"SaasDBHost" json:"saas_db_host"`
	SaasDBUser   string `yaml:"saas_db_user" toml:"SaasDBUser" json:"saas_db_user"`
	SaasPassword string `yaml:"saas_password" toml:"SaasPassword" json:"saas_password"`
	SaasPort     int    `yaml:"saas_port" toml:"SaasPort" json:"saas_port"`
	SaasDBName   string `yaml:"saas_db_name" toml:"SaasDBName" json:"saas_db_name"`
}
type Scripts struct {
	ScriptsHomeDir        string `yaml:"scripts_home_dir,omitempty" toml:"scripts_home_dir" json:"scripts_home_dir,omitempty"`
	BackupMysqlScriptName string `yaml:"backup_mysql_script_name,omitempty" toml:"backup_mysql_script_name" json:"backup_mysql_script_name"`
}

func (c *ServerConfig) LoadConfig(configfile string) *ServerConfig {

	_, err := toml.DecodeFile(configfile, &c)
	if err != nil {
		log.Fatal("load configfile error ,err %v", err.Error())
	}
	return c
}

var LoadConfig ServerConfig

func InitConfig() {
	configfile := ""
	flag.StringVar(&configfile, "config", "./config.toml", "configfile")
	flag.Parse()

	LoadConfig.LoadConfig(configfile)
}
