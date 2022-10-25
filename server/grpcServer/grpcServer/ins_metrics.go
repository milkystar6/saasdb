package grpcServer

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
)

type InsMetricsServer struct {
	grpc_pb.UnimplementedInsMetricServiceServer
}

func (s *InsMetricsServer) NewInsMetric(ctx context.Context, req *grpc_pb.InsMetricRequest) (*grpc_pb.InsMetricResponse, error) {
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
	type version struct {
		Version string `json:"version,omitempty"`
	}
	// get version
	var v version
	err = db.Exec("SELECT VERSION() as version").Scan(&v).Error

	if err != nil {
		metric := grpc_pb.InsMetric{
			Status: false,
		}
		return &grpc_pb.InsMetricResponse{InsMetric: &metric}, fmt.Errorf("get db version info failed, error: %v", err)
	}
	type starttime struct {
		WhenStart string `json:"when_start,omitempty"`
	}
	// get start time
	var st starttime
	sql := "SELECT NOW() - INTERVAL variable_value SECOND AS  when_start\nFROM performance_schema.global_status\nWHERE variable_name='Uptime';"
	err = db.Exec(sql).Scan(&st).Error
	if err != nil {
		metric := grpc_pb.InsMetric{
			Status: false,
		}
		return &grpc_pb.InsMetricResponse{InsMetric: &metric}, fmt.Errorf("get db start_time failed, error: %v", err)
	}

	// get deploy path
	type dp struct {
		Value string `json:"value,omitempty"`
	}
	var d dp
	sql = "SHOW VARIABLES LIKE \"basedir\""
	err = db.Exec(sql).Scan(&d).Error
	if err != nil {
		metric := grpc_pb.InsMetric{
			Status: false,
		}
		return &grpc_pb.InsMetricResponse{InsMetric: &metric}, fmt.Errorf("get db deploy path failed, error: %v", err)
	}

	metric := grpc_pb.InsMetric{
		IP:         mysqlip,
		Port:       int32(mysqlport),
		DeployPath: d.Value,
		Version:    v.Version,
		StartTime:  st.WhenStart,
		Status:     true,
	}
	return &grpc_pb.InsMetricResponse{InsMetric: &metric}, err
}