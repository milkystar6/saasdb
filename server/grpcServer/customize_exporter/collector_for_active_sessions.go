package customize_exporter

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"gorm.io/gorm"
)

func (c *CustomizeCollector) ActiveSessions() {
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
		go c.CountActiveSessions(dbInformationSchema, csaas)
	}
}

// CountActiveSessions 统计活跃会话的个数
func (c *CustomizeCollector) CountActiveSessions(dbInformationSchema dbConnCfg, csaasdb *gorm.DB) {
	// 定义会话状态常量
	//var SessionStates = []string{
	//	"INIT",
	//	"QUEUED",
	//	"WAITING FOR HANDLER",
	//	"CHECKING PERMISSIONS",
	//	"ANALYZING",
	//	"COPY TO TMP TABLE",
	//	"CONVERTING HEAP TO MYISAM",
	//	"COPYING TO GROUP TABLE",
	//	"SENDING DATA",
	//	"SORTING RESULT",
	//	"UPDATE",
	//	"UPDATING",
	//	"EXECUTING",
	//	"LOCKED",
	//	"PREPARING",
	//	"REPAIR BY SORTING",
	//	"REPAIR WITH KEYCACHE",
	//	"UPDATE BY KEYCACHE",
	//	"WRITE TO BINLOG",
	//}
	db := c.connLocalMySQL(dbInformationSchema)
	var pro model.InformationSchemaProcesslist
	//count := pro.CountActiveSessions(db, SessionStates)

	count := pro.ActiveSessionNotSleep(db)

	if count > activeSessionsUpLimit {
		// 获取webhook地址
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
"info":"%v，counts:%v"}
`, msgJsonTopicActiveSessions, dbInformationSchema.Host, dbInformationSchema.Port, activeSessionsUpLimitSuppressDuration, keyForCountActiveSessions, count)
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
