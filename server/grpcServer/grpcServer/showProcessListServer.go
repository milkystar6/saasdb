package grpcServer

import (
	"context"
	"encoding/json"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
)

type ShowProcessListServer struct {
	grpc_pb.UnimplementedMySQLShowProcessListServiceServer
}

func (server *ShowProcessListServer) NewShowProcesslist(ctx context.Context, req *grpc_pb.ShowProcesslistRequest) (*grpc_pb.ShowProcesslistResponce, error) {

	db, err := model.GormMysql(config.LoadConfig.MySQLManager.MysqlManagerUser, config.LoadConfig.MySQLManager.MysqlManagerPassword, config.LoadConfig.MySQLManager.MySQLManagerHost, "information_schema", config.LoadConfig.MySQLManager.MySQLManagerPort)
	if err != nil {
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
