package initialize

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"go.uber.org/zap"
	"google.golang.org/grpc"
	"net"
)

type BackupServe struct {
}

func Workflow() {
	listen, err := net.Listen("tcp", ":3000")
	// TODO 做到配置文件里
	global.GVA_LOG.Info("Grpc server run success on ", zap.String("address", "local:3000"))
	if err != nil {
		global.GVA_LOG.Panic("Grpc server run failed on ", zap.String("address", "local:3000"), zap.String("err", err.Error()))
	}
	s := grpc.NewServer()
	s.Serve(listen)
}
