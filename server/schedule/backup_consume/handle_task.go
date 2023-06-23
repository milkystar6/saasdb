package backup_consume

import (
	"database/sql"
	"fmt"
	saasdbApi "github.com/flipped-aurora/gin-vue-admin/server/api/v1/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.uber.org/zap"
	"golang.org/x/net/context"
	"math/rand"
	"time"
)

const (
	consumeInterval               = 1
	backupStatusRunning           = "running"
	mysqlBackupFullUseMysqldump   = "mysqldump_full"
	mysqlBackupSingleUseMysqldump = "mysqldump_single"
	mysqlBackupUseXtrafull        = "xtra_full"
	mysqlBackupUseXtraincr        = "xtra_incr"
	mysqlBackupFullUseMydumper    = "mydumper_full"
	mysqlBackupSingleUseMydumper  = "mydumper_single"
)

type HandleConsume struct {
}

func (hc *HandleConsume) HandleConsume() {
	for {
		time.Sleep(consumeInterval * time.Second)
		/*
			1、从redis 消息队列 中 获取要操作的数据库集群id
			2、根据集群id 选择一个合适的数据库实例 （找一个slave节点 随机选择或者是说选择一个会话少的 或者说是设置tag）
			3、向saasdb 数据库的备份信息表中，插入数据库备份任务信息
			4、向对应节点发起grpc任务请求
			5、备份脚本自动处理这部分任务，并在任务结束最后更新saasdb信息
		*/

		/* 1、从redis 消息队列 中 获取要操作的数据库集群id */
		ctx := context.Background()
		domainId := func(ctx context.Context) int {
			id, err := consumeTask(ctx, global.GVA_REDIS)
			if err != nil {
				global.GVA_LOG.Error(fmt.Sprintf("从redis中获取备份任务列表失败,%v", err))
				return 0
			}
			return id
		}(ctx)

		/*2、根据集群id 选择一个合适的数据库实例 （找一个slave节点 随机选择或者是说选择一个会话少的 或者说是设置tag）*/
		dstInstance, err := hc.getDstInstance(domainId)
		if err != nil {
			global.GVA_LOG.Error(err.Error())
			continue
		}
		/* 1、创建备份任务日志 saasdb.backuplog */
		err = hc.createBackupLog(domainId, int(dstInstance.ID))
		if err != nil {
			global.GVA_LOG.Error(err.Error())
		}
		//TODO 2、向目标数据库发起GRPC任务
		//TODO 3、通过发送webhook消息

	}

}

func (hc *HandleConsume) createBackupLog(domainId, insId int) error {
	/* 获取一个唯一的id，通过mongo的objectid实现 */
	objectID := primitive.NewObjectID()
	newBackupLog := &saasdb.BackLog{
		GVA_MODEL:     global.GVA_MODEL{},
		FinishedAt:    sql.NullTime{},
		DomainId:      &domainId,
		InsId:         &insId,
		BackupType:    mysqlBackupUseXtrafull,
		DataSize:      nil,
		Status:        backupStatusRunning,
		BackUpFeature: nil,
		BackUpUuid:    objectID.String(),
	}
	var se service.ServiceGroup
	return se.SaasdbServiceGroup.BackLogService.CreateBackLog(*newBackupLog)

}

func (hc *HandleConsume) getDstInstance(id int) (saasdb.Instance, error) {
	var pageInfo saasdbReq.DomainJoinSearch
	pageInfo.PageSize = 1
	pageInfo.Page = 1
	if list, total, err := saasdbApi.SaasInstanceService.GetInstanceInfoByDomainID(&id); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
	} else if total > 1 {
		// array of possible instance ids
		possibleIdsArr := make([]int, 0, 0)

		for k, v := range list {
			if v.Role != saasdb.RoleMaster && v.Health == saasdb.Avaiabel {
				possibleIdsArr = append(possibleIdsArr, k)
			}
			if n := len(possibleIdsArr); n > 0 {
				randNum := func(arr []int) int {
					rand.Seed(time.Now().UnixNano()) // 设置随机数种子
					randomNumber := rand.Intn(n) + 1 // 生成0到n-1之间的随机数，并加上1
					return randomNumber
				}(possibleIdsArr)
				return list[randNum], nil
			}

		}
	} else if total == 1 && list[0].Health == saasdb.Avaiabel {
		return list[0], nil
	}
	var nilInstance saasdb.Instance
	return nilInstance, fmt.Errorf("未找到合适的备份实例")
}
