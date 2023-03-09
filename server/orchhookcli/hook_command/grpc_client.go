package hook_command

import (
	"fmt"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	wh_proto "orch_hook/proto"
)

// grpcClient 申请一个新的grpc连接
func (c *Command) grpcClient(workNode string) (wh_proto.OpNewMasterServiceClient, error) {
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
