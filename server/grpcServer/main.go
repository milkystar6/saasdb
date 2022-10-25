package main

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/grpcServer"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/hb"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	"log"
	"net"
)

func main() {
	// openssl生成SAN证书
	//https://www.cnblogs.com/outsrkem/p/16056756.html

	config.InitConfig()
	creditsServeKey := config.LoadConfig.GrpcServer.CreditsServeKey
	creditsServeCrt := config.LoadConfig.GrpcServer.CreditsServeCrt
	creds, _ := credentials.NewServerTLSFromFile(creditsServeCrt, creditsServeKey)
	s := grpc.NewServer(grpc.Creds(creds))
	listen, err := net.Listen(config.LoadConfig.GrpcServer.Protocol, fmt.Sprintf(":%v", config.LoadConfig.GrpcServer.ListenPort))
	if err != nil {
		log.Panic(err.Error())
	}

	/* Show Processlist 服务 */
	grpc_pb.RegisterMySQLShowProcessListServiceServer(s, &grpcServer.ShowProcessListServer{})
	/* Stop Processlist 服务 */
	grpc_pb.RegisterMySQLStopProcessServiceServer(s, &grpcServer.StopProcessServer{})
	/* Handle Variables MySQL Running 服务 */
	grpc_pb.RegisterMySQLVariablesServiceServer(s, &grpcServer.VariablesServer{})
	/* 慢日志分析 服务 */
	grpc_pb.RegisterMySQLSlowLogQueryServiceServer(s, &grpcServer.SlowLogQueryServer{})
	/* 获取实例metric信息 服务 */
	grpc_pb.RegisterInsMetricServiceServer(s, &grpcServer.InsMetricsServer{}) // TODO 规范服务的日志 结合zap框架
	// TODO 心跳表服务 读取到集群TOPO表中到mysql信息，然后记录心跳表 参考pt-heartbeat ，获取当前节点mysql的ip port，查询instance表中，该实例的角色信息，根据角色信息做读写心跳检测。 不支持单机多实例类型
	// 数据库读心跳 RS read heartbreat service
	var RS hb.ReadHeatBreatService
	RS.Start()
	if err := s.Serve(listen); err != nil {
		log.Println(fmt.Errorf("run serve err :%w", err))
	}
}
