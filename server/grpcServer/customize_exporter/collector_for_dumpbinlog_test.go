package customize_exporter

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"testing"
)

// the maximum number of connections in the dump state

func TestCustomizeCollector_GetProcesslistWithCommand(t *testing.T) {
	testCfg := dbConnCfg{
		User:   "root",
		Passwd: "letsg0",
		Host:   "127.0.0.1",
		Port:   3307,
		Db:     "information_schema",
	}
	db := testConnLocalMySQL(testCfg)
	var pro model.InformationSchemaProcesslist
	command := "Binlog Dump"
	_, count := pro.GetProcesslistWithCommand(db, command)

	// 获取webhook地址    todo 改成全局的 直接调用即可
	testCfg1 := dbConnCfg{
		User:   "root",
		Passwd: "letsg0",
		Host:   "127.0.0.1",
		Port:   3307,
		Db:     "saasdb",
	}
	db1 := testConnLocalMySQL(testCfg1)
	wb := mo.SaasAlertWebhook{
		Tag: webhookTag,
	}
	fmt.Println(wb.GetHookInfo(db1))

	// 推送webhook消息
	if count >= maxDumpStatConnNum {
		data := []byte(fmt.Sprintf(`{"ins_ip": "172.23.204.7","ins_port":"3306","info":"这是测试,数据库存在较多%v状态会话，counts:%v"}`, keyForDumpBinlog, count))
		url := "http://127.0.0.1:21000/api/reset"
		headers := map[string]string{
			//"Authorization": "Bearer your-token",
			//"Custom-Header": "value",
			"Content-Type": "application/json",
		}
		AnalyzeHeader(data, url, headers)
	}
}
