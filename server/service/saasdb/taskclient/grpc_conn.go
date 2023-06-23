package taskclient

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

func NewGrpcConn(wn string) (*grpc.ClientConn, error) {
	// pem ca
	creditsServePem := global.GVA_CONFIG.GrpcServer.GrpcCA
	// web url
	commandName := global.GVA_CONFIG.GrpcServer.GrpcWebUrl
	//creditsServePem := "/Users/anderalex/go/src/workgrpc/certify/server.crt"
	//commandName := "example.server.com"
	creds, _ := credentials.NewClientTLSFromFile(creditsServePem, commandName)
	// 组成 grpc server端端连接地址
	grpcserverconn := fmt.Sprintf("%v:%v", wn, global.GVA_CONFIG.GrpcServer.GrpcServerListenPort)
	conn, err := grpc.Dial(grpcserverconn, grpc.WithTransportCredentials(creds))
	if err != nil {
		return nil, fmt.Errorf("初始化grpc client 到%v 失败, err: %v", grpcserverconn, err.Error())
	}
	return conn, nil

}
