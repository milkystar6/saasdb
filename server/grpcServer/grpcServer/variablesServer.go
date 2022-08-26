package grpcServer

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"github.com/golang/protobuf/ptypes/any"
	"google.golang.org/protobuf/proto"
	"google.golang.org/protobuf/types/known/anypb"
)

type VariablesTaskClientService struct {
	grpc_pb.UnimplementedMySQLVariablesServiceServer
}

func (server *VariablesTaskClientService) VariablesHandler(ctx context.Context, req *grpc_pb.HandleVariablesRequest) (*grpc_pb.HandleVariablesResponse, error) {
	// mysqlconn info
	mysqlip := req.GetMySQLIP()
	mysqlport := int(req.GetMySQLPort())
	if !req.GetMethod() {
		// show variables
		return server.ShowVariables(req.GetShowVariablesUseArray(), mysqlip, mysqlport)
	} else {
		// set variables
		isetok, err := server.SetVariables(req.GetSetVariablesUseMap(), mysqlip, mysqlport)
		if !isetok || err != nil {
			return &grpc_pb.HandleVariablesResponse{
				SetOK: false,
			}, err
		} else {
			return &grpc_pb.HandleVariablesResponse{
				SetOK: true,
			}, nil
		}
	}
}
func (server *VariablesTaskClientService) ShowVariables(arr []*grpc_pb.ShowVariablesUseArray, ip string, port int) (res *grpc_pb.HandleVariablesResponse, err error) {
	variablesValue := make(map[string]string)
	for _, v := range arr {
		variablesValue[v.Var], err = server.GetVariableRunningValue(v.Var, ip, port)
		if err != nil {
			return res, err
		}
	}
	res = &grpc_pb.HandleVariablesResponse{
		VariableName: variablesValue,
	}
	return res, nil
}

// 精确匹配参数
func (server *VariablesTaskClientService) GetVariableRunningValue(variable string, ip string, port int) (string, error) {

	// use gorm to get value and defer close session
	db, err := model.GormMysql(config.LoadConfig.MySQLManager.MysqlManagerUser, config.LoadConfig.MySQLManager.MysqlManagerPassword, ip, "information_schema", port)
	if err != nil {
		return "", err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()

	type Variables struct {
		VariableName string `gorm:"column:Variable_name"`
		Value        string `gorm:"column:Value"`
	}
	var v Variables
	sql := fmt.Sprintf("SHOW VARIABLES LIKE \"%v\"", variable)
	db.Debug().Raw(sql).Scan(&v)
	if v.Value != "" {
		return v.Value, nil
	}
	return "NONE_VALUE_RETURNED", nil
}

// 模糊匹配参数
func (server *VariablesTaskClientService) GetVariableRunningValueFuzzyMatching(variable string, ip string, port int) (string, error) {

	// use gorm to get value and defer close session
	db, err := model.GormMysql(config.LoadConfig.MySQLManager.MysqlManagerUser, config.LoadConfig.MySQLManager.MysqlManagerPassword, ip, "information_schema", port)
	if err != nil {
		return "", err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()

	type Variables struct {
		VariableName string `gorm:"column:Variable_name"`
		Value        string `gorm:"column:Value"`
	}
	var v Variables
	sql := "SHOW VARIABLES LIKE " + "\"%" + variable + "%\""
	db.Debug().Raw(sql).Scan(&v)
	if v.Value != "" {
		return v.Value, nil
	}
	return "NONE_VALUE_RETURNED", nil
}

// 修改参数 每次只支持单个参数修改
func (server *VariablesTaskClientService) SetVariables(setvariablemap map[string]*grpc_pb.SetVariablesUseMap, ip string, port int) (bool, error) {

	// use gorm to get value and defer close session
	db, err := model.GormMysql(config.LoadConfig.MySQLManager.MysqlManagerUser, config.LoadConfig.MySQLManager.MysqlManagerPassword, ip, "information_schema", port)
	if err != nil {
		return false, err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()

	if len(setvariablemap) != 1 {
		return false, fmt.Errorf("当前版本不支持同时修改多个参数")
	} else {
		sql := ""
		for k, v := range setvariablemap {
			// 判断value消息
			switch v.VariableValue.(type) {
			case *grpc_pb.SetVariablesUseMap_VariableValueString:
				fmt.Println("string", k, v)
				sql = fmt.Sprintf("SET GLOBAL %v = '%v'", k, v.GetVariableValueString())
			case *grpc_pb.SetVariablesUseMap_VariableValueInt32:
				fmt.Println("int", k, v)
				sql = fmt.Sprintf("SET GLOBAL %v = %v", k, v.GetVariableValueInt32())
			}
		}
		err = db.Debug().Raw(sql).Exec(sql).Error
		if err != nil {
			return false, fmt.Errorf("MySQL Server Returns Error when exec sql,sql is %v ,err is %v ", sql, err)
		}
		return true, nil
	}
}

func Unmarshal(data *any.Any) (*grpc_pb.SetVariablesUseMap, error) {
	var m grpc_pb.SetVariablesUseMap
	err := anypb.UnmarshalTo(data, &m, proto.UnmarshalOptions{})
	return &m, err
}
