package hook_command

import (
	"fmt"
	wh_proto "github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

// grpcNewSetReadOnly 申请一个set read_only grpc连接
func (c *Command) grpcNewSetReadOnly(workNode string) (wh_proto.MySQLVariablesServiceClient, error) {
	// pem ca
	creditsServePem := GrpcCA
	// web url
	commandName := GrpcWebUrl
	creds, _ := credentials.NewClientTLSFromFile(creditsServePem, commandName)
	// 组成 grpc server端端连接地址
	grpcserverconn := fmt.Sprintf("%v:%v", workNode, GrpcServerListenPort)
	conn, err := grpc.Dial(grpcserverconn, grpc.WithTransportCredentials(creds))
	if err != nil {
		return nil, fmt.Errorf("初始化grpc client 到%v 失败, err: %v", grpcserverconn, err.Error())
	}
	client := wh_proto.NewMySQLVariablesServiceClient(conn)
	return client, err
}

// grpcNewMasterClient 申请一个新的new master grpc连接
func (c *Command) grpcNewMasterClient(workNode string) (wh_proto.OpNewMasterServiceClient, error) {
	// pem ca
	creditsServePem := GrpcCA
	// web url
	commandName := GrpcWebUrl
	creds, _ := credentials.NewClientTLSFromFile(creditsServePem, commandName)
	// 组成 grpc server端端连接地址
	grpcserverconn := fmt.Sprintf("%v:%v", workNode, GrpcServerListenPort)
	conn, err := grpc.Dial(grpcserverconn, grpc.WithTransportCredentials(creds))
	if err != nil {
		return nil, fmt.Errorf("初始化grpc client 到%v 失败, err: %v", grpcserverconn, err.Error())
	}
	client := wh_proto.NewOpNewMasterServiceClient(conn)
	return client, err
}

// grpcDeadMasterClient 申请一个新的grpc连接
func (c *Command) grpcDeadMasterClient(workNode string) (wh_proto.OpDeadMasterServiceClient, error) {
	// pem ca
	creditsServePem := GrpcCA
	// web url
	commandName := GrpcWebUrl
	creds, _ := credentials.NewClientTLSFromFile(creditsServePem, commandName)
	// 组成 grpc server端端连接地址
	grpcserverconn := fmt.Sprintf("%v:%v", workNode, GrpcServerListenPort)
	conn, err := grpc.Dial(grpcserverconn, grpc.WithTransportCredentials(creds))
	if err != nil {
		return nil, fmt.Errorf("初始化grpc client 到%v 失败, err: %v", grpcserverconn, err.Error())
	}
	client := wh_proto.NewOpDeadMasterServiceClient(conn)
	return client, err
}
