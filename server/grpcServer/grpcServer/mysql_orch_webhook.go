package grpcServer

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/scripts"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"gorm.io/gorm"
	"strconv"
	"strings"
)

type HandleDeadMaster struct {
	grpc_pb.UnimplementedOpDeadMasterServiceServer
}

type HandleNewMaster struct {
	grpc_pb.UnimplementedOpNewMasterServiceServer
}

func (h *HandleDeadMaster) NewOpDeadMaster(ctx context.Context, req *grpc_pb.OrchWebHookDeadMasterRequest) (res *grpc_pb.OrchWebHookDeadMasterResponse, err error) {
	// 能接收到服务表示请求成功
	fmt.Println("收到NewOpDeadMaster 请求")
	reqSlice := strings.Split(req.GetDeadMasterAddress(), ":")
	deadMasterIp := reqSlice[0]
	deadMasterPortString := reqSlice[1]
	deadMasterport, _ := strconv.Atoi(deadMasterPortString)

	vip, err := getVip(deadMasterIp, deadMasterport)
	if err != nil {
		return &grpc_pb.OrchWebHookDeadMasterResponse{
			MessageError: fmt.Sprintf("failed to get dead master vip by master_ip: %v,master_port: %v", deadMasterIp, deadMasterport),
		}, err
	}
	var op scripts.OrchWebHooks
	err = op.OpDeadMaster(vip)
	fmt.Println("", err)
	if err != nil {
		r := &grpc_pb.OrchWebHookDeadMasterResponse{
			MessageError: "Failed Operator Dead MySQL Master",
		}
		return r, err
	} else {
		r := &grpc_pb.OrchWebHookDeadMasterResponse{
			MessageInfo: "Success Operator Dead MySQL Master",
		}
		return r, err
	}
}

// NewOpNewMaster 去掉vip并更新saasdb.saas_instance表
func (h *HandleNewMaster) NewOpNewMaster(ctx context.Context, req *grpc_pb.OrchWebHookNewMasterRequest) (res *grpc_pb.OrchWebHookNewMasterResponse, err error) {
	// 能接收到服务表示请求成功
	fmt.Println("NewOpNewMaster 请求", req)
	reqSlice := strings.Split(req.GetNewMasterAddress(), ":")
	newMysqlMasterIp := reqSlice[0]
	newMysqlMasterPortString := reqSlice[1]
	newMysqlMasterport, _ := strconv.Atoi(newMysqlMasterPortString)

	vip, err := getVip(newMysqlMasterIp, newMysqlMasterport)
	if err != nil {
		return &grpc_pb.OrchWebHookNewMasterResponse{
			MessageError: fmt.Sprintf("failed to get dead master vip by master_ip: %v,master_port: %v", newMysqlMasterIp, newMysqlMasterport),
		}, err
	}

	var op scripts.OrchWebHooks
	err = op.OpNewMaster(newMysqlMasterIp, vip)
	if err != nil {
		r := &grpc_pb.OrchWebHookNewMasterResponse{
			MessageError: "Failed Operator New MySQL Master",
		}
		return r, err
	} else {
		r := &grpc_pb.OrchWebHookNewMasterResponse{
			MessageInfo: "Success Operator New MySQL Master",
		}
		return r, err
	}
}

func getVip(ip string, port int) (string, error) {
	db, err := getSaasDB()
	if err != nil {
		return "", err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()
	/*
		用gorm也太麻烦了
		get domain id
		var ins  []model.Instance
		var instance = db.Model(&model.Instance{})

		err = instance.Debug().Where("ip=? and port=?", &newMysqlMasterIp, newMysqlMasterport).Find(&ins).Error
		if err!=nil{
			return nil,err
		}
		var domain_id *int
		for _,v :=range ins{
			domain_id=v.DomainId
		}
		// get vip
		var host []model.
	*/

	vip := ""
	sql := fmt.Sprintf("SELECT vip FROM saas_domain WHERE id = (SELECT domain_id as id FROM saas_instance WHERE ip='%v' and port='%v' limit 1)", ip, port)
	fmt.Println(sql)
	err = db.Debug().Raw(sql).Scan(&vip).Error
	return vip, err
}

// getSaasDB 读取配置文件中配置的saasdb数据库的连接信息并返回 *gorm.db
func getSaasDB() (*gorm.DB, error) {
	db, err := model.GormMysql(config.LoadConfig.SaasDB.SaasDBUser, config.LoadConfig.SaasDB.SaasPassword, config.LoadConfig.SaasDB.SaasDBHost, "saasdb", config.LoadConfig.SaasDB.SaasPort)
	return db, err
}

/* setReadOnly 根据switchStat确定开启或者关闭read_only参数
   switchStat: true  开启read_only
             : false 关闭read_only
*/

func setReadOnly(switchStat bool) error {
	db, err := getSaasDB()
	if err != nil {
		return err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()
	if switchStat {
		sql := fmt.Sprintf("SET global read_only='%v'", "ON")
		return db.Exec(sql).Error
	} else {
		sql := fmt.Sprintf("SET global read_only='%v'", "OFF")
		return db.Exec(sql).Error
	}
}
