package grpcServer

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/scripts"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"gorm.io/gorm"
	"net"
	"reflect"
	"strconv"
)

type CreateSingleMySQLInstance struct {
	grpc_pb.UnimplementedCreateSingleMySQLServiceServer
}

// CI configuration information
type CI struct {
	Version          string    `json:"Version,omitempty"`
	Ip               string    `json:"Ip,omitempty"`
	Port             int       `json:"Port,omitempty"`
	ReplUser         string    `json:"ReplUser,omitempty"`
	ReplUserPasswd   string    `json:"ReplUserPasswd,omitempty"`
	BackupUser       string    `json:"BackupUser,omitempty"`
	BackupUserPasswd string    `json:"BackupUserPasswd,omitempty"`
	DomainId         int       `json:"DomainId,omitempty"`
	InstanceName     string    `json:"InstanceName,omitempty"`
	HostId           int       `json:"HostId,omitempty"`
	UseType          string    `json:"UseType,omitempty"`
	MaxMemory        int       `json:"MaxMemory,omitempty"`
	MaxConnections   int       `json:"MaxConnections,omitempty"`
	MySQLHub         *MySQLHub `json:"MySQLHub,omitempty"`
}
type MySQLHub struct {
	MySQLHubIP       string `json:"MySQLHubIP,omitempty"`
	MySQLHubPort     int    ` json:"MySQLHubPort,omitempty"`
	MySQLHubDir      string ` json:"MySQLHubDir,omitempty"`
	HubSshUser       string `json:"HubSshUser,omitempty"`
	HubSsHUserPasswd string `json:"HubSsHUserPasswd,omitempty"`
}

func (r *CreateSingleMySQLInstance) CreateNewMysqlInstance(req *grpc_pb.CreateSingleMySQLInstanceReq) grpc_pb.CreateSingleMySQLInstanceRes {
	ci := CI{
		Version:          req.GetVersion(),
		Port:             int(req.GetMysqlPort()),
		ReplUser:         req.GetReplUser(),
		ReplUserPasswd:   req.GetReplUserPasswd(),
		BackupUser:       req.GetBackUpAdminUser(),
		BackupUserPasswd: req.GetBackUpAdminUserPasswd(),
		DomainId:         int(req.GetDomainId()),
		InstanceName:     req.GetInstanceName(),
		HostId:           int(req.GetHostId()),
		UseType:          req.GetUseType(),
		MaxMemory:        int(req.GetMaxMemorySize()),
		MaxConnections:   int(req.GetMaxConnections()),
		MySQLHub: &MySQLHub{
			MySQLHubIP:       req.GetMySQLHub().MySQLHubIP,
			MySQLHubPort:     int(req.GetMySQLHub().MySQLHubPort),
			MySQLHubDir:      req.GetMySQLHub().MySQLHubDir,
			HubSshUser:       req.GetMySQLHub().HubSshUser,
			HubSsHUserPasswd: req.GetMySQLHub().HubSsHUserPasswd,
		},
	}
	type saasDBConn struct {
		SaasHost     string
		SaasPort     int
		SaasUser     string
		SaasPassword string
	}
	sc := saasDBConn{
		SaasHost:     config.LoadConfig.SaasDB.SaasDBHost,
		SaasUser:     config.LoadConfig.SaasDB.SaasDBUser,
		SaasPort:     config.LoadConfig.SaasDB.SaasPort,
		SaasPassword: config.LoadConfig.SaasDB.SaasPassword,
	}
	saasDB, err := model.GormMysql(sc.SaasUser, sc.SaasPassword, sc.SaasHost, config.SaasDBNAME, sc.SaasPort)
	if err != nil {
		return grpc_pb.CreateSingleMySQLInstanceRes{
			IsOk: false,
			Msg:  fmt.Sprintf("连接saasdb数据库失败,error: %v", err),
		}
	}

	// 上报数据库信息到saasdb的saas_instance表
	err = r.Report2Saasdb(ci, saasDB)
	if err != nil {
		return grpc_pb.CreateSingleMySQLInstanceRes{}
	}
	// TODO 设计这里的逻辑

	// 用户指定端口的场景下，需要检测目标数据库端口是否占用
	if ci.Port != 0 {
		if r.CheckPort(ci.Ip, ci.Port) {
			err := fmt.Sprintf("Port %d is in use\n", ci.Port)
			return grpc_pb.CreateSingleMySQLInstanceRes{
				IsOk: false,
				Msg:  fmt.Sprintf("%v,请重新选择端口", err),
			}
		}
	}
	isOk, err := r.CreateOne(ci, saasDB)
	if err != nil {
		fmt.Println(isOk, err)
		// clear 信息
	}
	return grpc_pb.CreateSingleMySQLInstanceRes{}
}

func (r *CreateSingleMySQLInstance) CreateOne(ci CI, db *gorm.DB) (isOk bool, err error) {
	// 传递ci结构体的值给md
	var md scripts.CreateMysqlInstance
	source := reflect.ValueOf(&ci).Elem()
	target := reflect.ValueOf(&md).Elem()
	for i := 0; i < source.NumField(); i++ {
		target.Field(i).Set(source.Field(i))
	}
	err = md.CreateOneMySQL()
	if err != nil {
		return false, fmt.Errorf("创建数据库%v失败,error: %v,运行回滚流程%v", ci, err, r.RollBackCreateTask(ci, db))
	}
	return true, nil
}

func (r *CreateSingleMySQLInstance) Report2Saasdb(ci CI, db *gorm.DB) error {

	saasInstance := model.Instance{
		InstanceName: ci.InstanceName,
		HostId:       &ci.HostId,
		Ip:           ci.Ip,
		Port:         &ci.Port,
		Application:  "mysql",
		Version:      ci.Version,
		UseType:      ci.UseType,
		Health:       "creating",
		Role:         "master",
	}
	return db.Create(&saasInstance).Error
}

func (r *CreateSingleMySQLInstance) RollBackCreateTask(ci CI, db *gorm.DB) error {
	saasInstance := model.Instance{
		InstanceName: ci.InstanceName,
		HostId:       &ci.HostId,
		Ip:           ci.Ip,
		Port:         &ci.Port,
		Application:  "mysql",
		Version:      ci.Version,
		UseType:      ci.UseType,
		Health:       "creating",
		Role:         "master",
	}

	return db.Delete(&saasInstance).Error
}

func (r *CreateSingleMySQLInstance) CheckPort(host string, port int) bool {
	address := host + ":" + strconv.Itoa(port)
	conn, err := net.Dial("tcp", address)
	if err != nil {
		return false
	}
	err = conn.Close()
	if err != nil {
		return false
	}
	return true
}
