package customize_exporter

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/customize_exporter/opsbase"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"gorm.io/gorm"
)

func (c *CustomizeCollector) SpaceUsage() {
	cfg := config.LoadConfig
	// 访问saasdb ==> get 在saasdb 注册了的数据库的端口
	// 根据端口 去分别查询数据库
	localAddr := cfg.MyHostAddrInfo.MyIP

	csaas := c.connSaasdb()
	var ins mo.Instance
	portSlice, _ := ins.QueryPortsByIP(csaas, localAddr, keyForMySQL)

	for _, v := range portSlice {

		dbInformationSchema := dbConnCfg{
			//User:   config.LoadConfig.MySQLManager.MysqlManagerUser,
			//Passwd: config.LoadConfig.MySQLManager.MysqlManagerPassword,
			Host: localAddr,
			Port: v,
			Db:   informationSchema,
		}

		go c.getSpaceUsage(dbInformationSchema, csaas)
	}
}

func (c *CustomizeCollector) getSpaceUsage(dbInformationSchema dbConnCfg, csaasdb *gorm.DB) {
	db := c.connLocalMySQL(dbInformationSchema)
	dataDir := c.GetVariables(db, "datadir", 0)
	//dataDir = "/Users/anderalex/Desktop/学习资料"
	// time of consumption toc
	res, toc, l := opsbase.Analyze(dataDir, 10)

	info := fmt.Sprintf("more details: top%v文件:%v,统计任务耗时:%v", l, res, toc)

	msg := fmt.Sprintf(`
{"message_topic":"%v",
"ins_ip": "%v",
"ins_port":"%v",
"suppress_duration":%v,
"info":"%v，counts:%v"}
`, "Top10FileUsage", dbInformationSchema.Host, dbInformationSchema.Port, 43200, info, "null")
	SendMsg2WebHook(csaasdb, msg)
	c.CloseDB(db)
	c.CloseDB(csaasdb)
}
