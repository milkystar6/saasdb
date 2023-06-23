package hb

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"time"
)

/* 向本地MySQL发送读心跳 */
/* 查询saasdb里 本地电脑上的(ip来自配置文件？也可以的 合并现有的两个配置文件) ，获取节点上有多少个数据 */
/* 使用saasdb_admin用户/saasdb_agent用户向节点的数据库发起select 1 ,检查数据库可用性 */
/* 修改saasdb数据库中表中instance的状态 [先不这么搞 。。]*/
/* 连续ping多次之后还不通，就向webhook推送消息*/
/* 设置个告警恢复机制 有告警的实例写到一个通道中，另外的携程去查询通道中是否有未恢复的 */
type ReadHeatBreatService struct {
}

func (r *ReadHeatBreatService) Start() {
	for {
		r.GetAllDBProcess(config.LoadConfig.MyHostAddrInfo.MyIP)
		// 获取节点上的mysql实例的端口 然后下方发起读心跳检测
		// RH read heatbreat

		r.HB()
		time.Sleep(time.Second)
	}

}
func (r *ReadHeatBreatService) HB() {

}

type MP struct {
	MysqldProcess string
}

func (r *ReadHeatBreatService) GetAllDBProcess(ip string) []MP {

	db, err := model.GormMysql(config.LoadConfig.MySQLManager.MysqlManagerUser, config.LoadConfig.MySQLManager.MysqlManagerPassword, config.LoadConfig.SaasDB.SaasDBHost, config.SaasDBNAME, config.LoadConfig.SaasDB.SaasPort)
	if err != nil { // todo err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()

	mp := make([]MP, 0, 0)
	sql := fmt.Sprintf("SELECT CONCAT(ip,'__',port as MysqldProcess ) FROM saas_instance where ip = \"%v\"", ip)
	err = db.Raw(sql).Scan(&mp).Error
	if err != nil {
	}

	return mp
}
