package grpcServer

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/scripts"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"strconv"
	"strings"
)

type HandleDeadMaster struct {
	grpc_pb.UnimplementedOpDeadMasterServiceServer
}

type HandleNewMaster struct {
	grpc_pb.UnimplementedOpNewMasterServiceServer
}

// NewOpNewMaster 去掉vip并更新saasdb.saas_instance表
func (h HandleNewMaster) NewOpNewMaster(ctx context.Context, req *grpc_pb.NewMasterRequest) (res *grpc_pb.NewMasterResponse, err error) {
	db, err := model.GormMysql(config.LoadConfig.SaasDB.SaasDBUser, config.LoadConfig.SaasDB.SaasPassword, config.LoadConfig.SaasDB.SaasDBHost, "saasdb", config.LoadConfig.SaasDB.SaasPort)
	if err != nil {
		return nil, err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()
	reqSlice := strings.Split(req.GetNewMasterAddress(), ":")
	newMysqlMasterIp := reqSlice[0]
	newMysqlMasterPort := reqSlice[1]
	newMysqlMasterport, _ := strconv.Atoi(newMysqlMasterPort)

	// 用gorm也太麻烦了
	//// get domain id
	//var ins  []model.Instance
	//var instance = db.Model(&model.Instance{})
	//
	//err = instance.Debug().Where("ip=? and port=?", &newMysqlMasterIp, newMysqlMasterport).Find(&ins).Error
	//if err!=nil{
	//	return nil,err
	//}
	//var domain_id *int
	//for _,v :=range ins{
	//	domain_id=v.DomainId
	//}
	//// get vip
	//var host []model.
	vip := ""
	sql := fmt.Sprintf("SELECT vip FROM saas_domain WHERE ip='%v' and port='%v'", newMysqlMasterIp, newMysqlMasterport)

	db.Exec(sql).Scan(&vip)

	var op scripts.OrchWebHooks
	op.OpNewMaster(vip)

	return nil, err
}
