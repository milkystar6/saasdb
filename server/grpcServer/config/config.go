package config

import (
	"flag"
	"github.com/BurntSushi/toml"
	"log"
)

// 配置文件匹配
type ServerConfig struct {
	MySQLManager *MySQLManager `yaml:"MySQLManager" json:"MySQLManager" toml:"MySQLManager"`
	GrpcServer   *GrpcServer   `yaml:"GrpcServer" json:"GrpcServer" toml:"GrpcServer"`
}

type MySQLManager struct {
	MysqlManagerUser     string `yaml:"mysqlmanager_user" json:"mysqlmanager_user" toml:"mysqlmanager_user"`
	MysqlManagerPassword string `yaml:"mysqlmanager_password" json:"mysqlmanager_password" toml:"mysqlmanager_password"`
}

type GrpcServer struct {
	CreditsServeKey string `yaml:"creditsServeKey" json:"creditsServeKey" toml:"creditsServeKey"`
	CreditsServeCrt string `yaml:"creditsServeCrt" json:"creditsServeCrt" toml:"creditsServeCrt"`
	Protocol        string `yaml:"protocol" json:"protocol" toml:"protocol"`
	ListenPort      int    `yaml:"listenPort" json:"listenPort" toml:"listenPort"`
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
	flag.StringVar(&configfile, "config", "/Users/haochen/go/src/saasdb/server/grpcServer/config/config.toml", "configfile")
	flag.Parse()

	LoadConfig.LoadConfig(configfile)
}
