package grpcServer

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
)

type ShowProcessListServer struct {
	grpc_pb.UnimplementedMySQLShowProcessListServiceServer
}

func (server *ShowProcessListServer) NewShowProcesslist(ctx context.Context, req *grpc_pb.ShowProcesslistRequest) (*grpc_pb.ShowProcesslistResponce, error) {
	mysqlip := req.GetMySQLIP()
	mysqlport := int(req.GetMySQLPort())

	db, err := model.GormMysql(config.LoadConfig.MySQLManager.MysqlManagerUser, config.LoadConfig.MySQLManager.MysqlManagerPassword, mysqlip, "information_schema", mysqlport)
	if err != nil {
		return nil, err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()

	var r model.InformationSchemaProcesslist
	processList := r.GetAllProcesslist(db)
	pL := make([]*grpc_pb.ProcessListInfo, 0, 0)
	for _, v := range processList {
		var a *grpc_pb.ProcessListInfo
		if data, err := json.MarshalIndent(v, "", "\t"); err == nil {
			err1 := json.Unmarshal(data, &a)
			if err1 != nil {
				return nil, err1
			}
			pL = append(pL, a)
		}
	}
	processlistInfo := &grpc_pb.ShowProcesslistResponce{ProcessListInfo: pL}
	return processlistInfo, nil
}

type StopProcessServer struct {
	grpc_pb.UnimplementedMySQLStopProcessServiceServer
}

func (server *StopProcessServer) NewStopProcess(ctx context.Context, req *grpc_pb.StopProcessRequset) (*grpc_pb.StopProcessResponse, error) {
	mysqlip := req.GetMySQLIP()
	mysqlport := int(req.GetMySQLPort())
	processid := int(req.GetProcessId())

	db, err := model.GormMysql(config.LoadConfig.MySQLManager.MysqlManagerUser, config.LoadConfig.MySQLManager.MysqlManagerPassword, mysqlip, "information_schema", mysqlport)
	if err != nil {
		return &grpc_pb.StopProcessResponse{
			IsSuccess:               0,
			MoreDetailedInformation: fmt.Sprintf("%v", fmt.Errorf("KILL PROCESS Failed, Get Error Returned %v", err)),
		}, fmt.Errorf("KILL PROCESS Failed, Get Error Returned %v", err)
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()

	sql := fmt.Sprintf("KILL %v", processid)

	err = db.Exec(sql).Error
	if err != nil {
		return &grpc_pb.StopProcessResponse{
			IsSuccess:               0,
			MoreDetailedInformation: fmt.Sprintf("%v", fmt.Errorf("KILL PROCESS Failed, Get Error Returned %v", err)),
		}, fmt.Errorf("KILL PROCESS Failed, Get Error Returned %v", err)
	}
	return &grpc_pb.StopProcessResponse{
		IsSuccess:               1,
		MoreDetailedInformation: "",
	}, nil
}
