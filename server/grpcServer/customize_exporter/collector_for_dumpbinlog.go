package customize_exporter

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"gorm.io/gorm"
)

/* 检查是否有过多的keyForOggOrDpUser的slave 会话 */

func (c *CustomizeCollector) CheckBinlogDumpThreadsCounts(dbInformationSchema dbConnCfg, csaas *gorm.DB, localdb *gorm.DB) {
	//cfg := config.LoadConfig
	// 访问saasdb ==> get 在saasdb 注册了的数据库的端口
	// 根据端口 去分别查询数据库
	//localAddr := cfg.MyHostAddrInfo.MyIP

	//csaas := c.connSaasdb()
	//var ins mo.Instance
	//portSlice, _ := ins.QueryPortsByIP(csaas, localAddr, keyForMySQL)
	//
	//for _, v := range portSlice {
	//
	//	dbInformationSchema := dbConnCfg{
	//		//User:   config.LoadConfig.MySQLManager.MysqlManagerUser,
	//		//Passwd: config.LoadConfig.MySQLManager.MysqlManagerPassword,
	//		Host: localAddr,
	//		Port: v,
	//		Db:   informationSchema,
	//	}
	//
	//	go c.CheckBinlogDumpThreadsCountsWorker(localdb, csaas)
	//}
	go c.CheckBinlogDumpThreadsCountsWorker(dbInformationSchema, localdb, csaas)
}

//func (c *CustomizeCollector) CheckBinlogDumpThreadsCountsWorker(dbInformationSchema dbConnCfg, csaasdb *gorm.DB) {

func (c *CustomizeCollector) CheckBinlogDumpThreadsCountsWorker(dbInformationSchema dbConnCfg, db *gorm.DB, csaasdb *gorm.DB) {
	//db := c.connLocalMySQL(dbInformationSchema)
	var pro model.InformationSchemaProcesslist

	_, count := pro.GetProcesslistWithCommandAndUser(db, keyForDumpBinlog, keyForOggOrDpUser)
	// 获取webhook地址
	wb := mo.SaasAlertWebhook{
		Tag: webhookTag,
	}

	db1 := csaasdb
	webhook, _ := wb.GetHookInfo(db1)
	// 推送webhook消息
	if count > maxDumpStatConnNum {
		fmtJson := fmt.Sprintf(`{"message_topic":"%v","ins_ip": "%v","ins_port":"%v","suppress_duration":%v,"info":"%v，counts:%v"}`, msgJsonTopicDumpGtid, dbInformationSchema.Host, dbInformationSchema.Port, oggOrDpSuppressDuration, keyForDumpBinlog, count)
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
	//c.CloseDB(db)
	//c.CloseDB(csaasdb)
}
