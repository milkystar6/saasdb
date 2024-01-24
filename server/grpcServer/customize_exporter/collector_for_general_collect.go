package customize_exporter

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"gorm.io/gorm"
)

/* 向本地MySQL发送读心跳 */
/* 查询saasdb里 本地电脑上的(ip来自配置文件？也可以的 合并现有的两个配置文件) ，获取节点上有多少个数据 */
/* 使用saasdb_admin用户/saasdb_agent用户向节点的数据库发起select 1 ,检查数据库可用性 */
/* 修改saasdb数据库中表中instance的状态 [先不这么搞 。。]*/
/* 连续ping多次之后还不通，就向webhook推送消息*/
/* 设置个告警恢复机制 有告警的实例写到一个通道中，另外的携程去查询通道中是否有未恢复的 */

func (c *CustomizeCollector) MySQLSelect1() {
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

		go c.dbPingWork(dbInformationSchema, csaas)
	}
}

func (c *CustomizeCollector) dbPingWork(cfg dbConnCfg, csaas *gorm.DB) {
	db := c.connLocalMySQL(cfg)
	defer c.CloseDB(db)
	defer c.CloseDB(csaas)
	if err := db.Debug().Raw("SELECT 1").Error; err != nil {
		msg := fmt.Sprintf(`
{"message_topic":"%v",
"ins_ip": "%v",
"ins_port":"%v",
"suppress_duration":%v,
"info":"%v"}
`, mesJsonTopicSelect1MySQL, cfg.Host, cfg.Port, select1MySQLUpLimitSuppressDuration, keyForSelect)
		SendMsg2WebHook(csaas, msg)
	}

}
