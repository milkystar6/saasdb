package customize_exporter

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"gorm.io/gorm"
)

/* 检查是否有过多的keyForOggOrDpUser的slave 会话 */

func (c *CustomizeCollector) CheckBinlogDumpThreadsCounts() {
	cfg := config.LoadConfig
	//dbSaasdb := dbConnCfg{
	//	User:   cfg.SaasDB.SaasDBUser,
	//	Passwd: cfg.SaasDB.SaasPassword,
	//	Port:   cfg.SaasDB.SaasPort,
	//	Host:   cfg.SaasDB.SaasDBHost,
	//	Db:     cfg.SaasDB.SaasDBName,
	//}

	// 访问saasdb ==> get 在saasdb 注册了的数据库的端口
	// 根据端口 去分别查询数据库
	localAddr := cfg.MyHostAddrInfo.MyIP

	csaas := c.connSaasdb()
	var ins mo.Instance
	portSlice, _ := ins.QueryPortsByIP(csaas, localAddr)

	for _, v := range portSlice {

		dbInformationSchema := dbConnCfg{
			//User:   config.LoadConfig.MySQLManager.MysqlManagerUser,
			//Passwd: config.LoadConfig.MySQLManager.MysqlManagerPassword,
			Host: localAddr,
			Port: v,
			Db:   informationSchema,
		}

		go c.CheckBinlogDumpThreadsCountsWorker(dbInformationSchema, csaas)
	}

}

func (c CustomizeCollector) CheckBinlogDumpThreadsCountsWorker(dbInformationSchema dbConnCfg, csaasdb *gorm.DB) {
	db := c.connLocalMySQL(dbInformationSchema)
	var pro model.InformationSchemaProcesslist

	_, count := pro.GetProcesslistWithCommandAndUser(db, keyForDumpBinlog, keyForOggOrDpUser)
	// 获取webhook地址
	wb := mo.SaasAlertWebhook{
		Tag: webhookTag,
	}

	db1 := csaasdb
	webhook, _ := wb.GetHookInfo(db1)

	//TODO 根据IP、PORT获取MySQL的实例名称

	// 推送webhook消息
	if count >= maxDumpStatConnNum {
		fmtJson := fmt.Sprintf(`{"message_topic":"%v","ins_ip": "%v","ins_port":"%v","info":"数据库存在较多%v状态会话，counts:%v"}`, msgJsonTopicDumpGtid, dbInformationSchema.Host, dbInformationSchema.Port, keyForDumpBinlog, count)
		fmt.Println(fmtJson)
		data := []byte(fmtJson)
		url := fmt.Sprintf("%v/api/reset", webhook.WebhookUrl)
		headers := map[string]string{
			//"Authorization": "Bearer your-token",
			//"Custom-Header": "value",
			"Content-Type": "application/json",
		}
		AnalyzeHeader(data, url, headers)
	}

	// 关闭连接
	c.CloseDB(db)
	c.CloseDB(csaasdb)
}
