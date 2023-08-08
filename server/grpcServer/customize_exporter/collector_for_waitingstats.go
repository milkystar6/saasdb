package customize_exporter

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"gorm.io/gorm"
)

func (c *CustomizeCollector) CheckWaitMetaDL() {
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
		go c.GetMetaDataLock(dbInformationSchema, csaas)
	}
}

func (c *CustomizeCollector) GetMetaDataLock(dbInformationSchema dbConnCfg, csaasdb *gorm.DB) {

	db := c.connLocalMySQL(dbInformationSchema)
	var pro model.InformationSchemaProcesslist

	processlist, count := pro.GetProcesslistWithState(db, stateOfMetaDataLock)
	// 将Slice转换为JSON格式 ==> 不解析了
	//jsonData, err := json.Marshal(processlist)
	//if err != nil {
	//	fmt.Println("转换为JSON失败:", err)
	//	return
	//}

	if count > 0 {
		//		wb := mo.SaasAlertWebhook{
		//			Tag: webhookTag,
		//		}
		//
		//		db1 := csaasdb
		//		webhook, _ := wb.GetHookInfo(db1)
		//		fmtJson := fmt.Sprintf(`
		//{"message_topic":"%v",
		//"ins_ip": "%v",
		//"ins_port":"%v",
		//"suppress_duration":%v,
		//"info":"%v，counts:%v"}
		//`, msgJsonTopicActiveSessions, dbInformationSchema.Host, dbInformationSchema.Port, activeSessionsUpLimitSuppressDuration, keyForCountActiveSessions, count)
		//		fmt.Println(fmtJson)

		wb := mo.SaasAlertWebhook{
			Tag: webhookTag,
		}
		db1 := csaasdb
		webhook, _ := wb.GetHookInfo(db1)

		fmtJson := fmt.Sprintf(`
{"message_topic":"%v",
"ins_ip": "%v",
"ins_port":"%v",
"suppress_duration":%v,
"info":"%v\n%vcounts:%v,\n%vmore detail:%v"}
`, msgJsonTopicMetaDataLock,
			dbInformationSchema.Host,
			dbInformationSchema.Port,
			metaDataLockUpLimitSuppressDuration,
			keyForMetaDataLock,
			metaDataLockMsgPlaceholder,
			count,
			metaDataLockMsgPlaceholder,
			processlist)

		data := []byte(fmtJson)

		url := fmt.Sprintf("%v/api/reset", webhook.WebhookUrl)
		headers := map[string]string{
			//"Authorization": "Bearer your-token",
			//"Custom-Header": "value",
			"Content-Type": "application/json",
		}
		AnalyzeHeader(data, url, headers)
	}

	c.CloseDB(db)
	c.CloseDB(csaasdb)
}
