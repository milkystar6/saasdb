package taskclient

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"github.com/songzhibin97/gkit/tools/pretty"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	"time"
)

type ShowProcessListTaskClientService struct {
}

// 创建一个gRPC的client
func (c *ShowProcessListTaskClientService) NewClient(msg global.GrpcMsg) (grpc_pb.MySQLShowProcessListServiceClient, error) {
	// pem ca
	creditsServePem := global.GVA_CONFIG.GrpcServer.GrpcCA
	// web url
	commandName := global.GVA_CONFIG.GrpcServer.GrpcWebUrl
	//creditsServePem := "/Users/anderalex/go/src/workgrpc/certify/server.crt"
	//commandName := "example.server.com"
	creds, _ := credentials.NewClientTLSFromFile(creditsServePem, commandName)
	// 组成 grpc server端端连接地址
	grpcserverconn := fmt.Sprintf("%v:%v", msg.WorkNode, global.GVA_CONFIG.GrpcServer.GrpcServerListenPort)
	conn, err := grpc.Dial(grpcserverconn, grpc.WithTransportCredentials(creds))
	if err != nil {
		return nil, fmt.Errorf("初始化grpc client 到%v 失败, err: %v", grpcserverconn, err.Error())
	}

	client := grpc_pb.NewMySQLShowProcessListServiceClient(conn)
	return client, err
}

// 创建一个Request 的消息
func (c *ShowProcessListTaskClientService) NewShowProcessListTaskRequest(ip string, port int) *grpc_pb.ShowProcesslistRequest {
	return &grpc_pb.ShowProcesslistRequest{
		MySQLIP:   ip,
		MySQLPort: int32(port),
	}
}

// 核心方法 完成showprocesslist的返回
func (c *ShowProcessListTaskClientService) NewShowProcessListTask(client grpc_pb.MySQLShowProcessListServiceClient, ip string, port int) ([]byte, error) {
	ctx, cancle := context.WithTimeout(context.Background(), time.Second)
	defer cancle()
	res, err := client.NewShowProcesslist(ctx, c.NewShowProcessListTaskRequest(ip, port))
	if err != nil {
		return nil, fmt.Errorf("grpc通信后端失败, 请查看后端日志确认, err: %v", err.Error())
	}
	if res != nil {
		strbyte, e := json.Marshal(res)
		if e != nil {
			fmt.Println(e)
		}
		// strbyte 是 []byte 类型，可以直接通过接口 func()gin.H{} 返回给前端json数组
		fmt.Printf("%s\n", pretty.Pretty(strbyte))
		return strbyte, nil
	}
	return nil, fmt.Errorf("can't get any processlist , please cheak the log")
}

// 入口func 接收前端的 vm mysqlhost port信息
func (c *ShowProcessListTaskClientService) ShowProcessList(vm string, mysqlhost string, port int) ([]byte, error) {
	var msg = global.GrpcMsg{
		WorkNode: vm,
		MySQLConn: global.MySQLConn{
			MysqlUser:   global.GVA_CONFIG.GrpcServer.GrpcMySQLMangerUser,
			MysqlPasswd: global.GVA_CONFIG.GrpcServer.GrpcMySQLMangerPassword,
			MysqlHost:   mysqlhost,
			MysqlPort:   port,
		},
	}
	client, err := c.NewClient(msg)
	if err != nil {
	}
	return c.NewShowProcessListTask(client, mysqlhost, port)
}
