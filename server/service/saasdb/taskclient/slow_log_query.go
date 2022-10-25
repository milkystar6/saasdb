package taskclient

import (
	"context"
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"github.com/songzhibin97/gkit/tools/pretty"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	"google.golang.org/grpc/status"
	"google.golang.org/protobuf/types/known/timestamppb"
	"strconv"
	"time"
)

type SlowLogTaskClientService struct {
}

// GetSlowLogEntry /* Get slow log */
func (ls *SlowLogTaskClientService) GetSlowLogEntry(req request.GetSlowLogSearch) ([]byte, error) {
	var msg = global.GrpcMsg{
		WorkNode: req.Vm,
	}
	client, err := ls.Newclient(msg)
	if err != nil {
		return nil, err
	}

	return ls.GetSlowLog(req, client)
}

func (ls *SlowLogTaskClientService) Newclient(msg global.GrpcMsg) (grpc_pb.MySQLSlowLogQueryServiceClient, error) {
	// pem ca
	creditsServePem := global.GVA_CONFIG.GrpcServer.GrpcCA
	// web url
	commandName := global.GVA_CONFIG.GrpcServer.GrpcWebUrl
	creds, _ := credentials.NewClientTLSFromFile(creditsServePem, commandName)
	// 组成 grpc server端端连接地址
	grpcserverconn := fmt.Sprintf("%v:%v", msg.WorkNode, global.GVA_CONFIG.GrpcServer.GrpcServerListenPort)
	conn, err := grpc.Dial(grpcserverconn, grpc.WithTransportCredentials(creds))
	if err != nil {
		return nil, fmt.Errorf("初始化grpc client 到%v 失败, err: %v", grpcserverconn, err.Error())
	}
	client := grpc_pb.NewMySQLSlowLogQueryServiceClient(conn)
	return client, err
}

func (ls *SlowLogTaskClientService) GetSlowLog(req request.GetSlowLogSearch, client grpc_pb.MySQLSlowLogQueryServiceClient) ([]byte, error) {
	ctx, cancle := context.WithTimeout(context.Background(), global.GrpcCreateTimeout)
	defer cancle()

	res, err := client.NewGetSlowQuery(ctx, ls.GetSlowLogTask(req))
	if err != nil {
		//if err.Error()=="DeadlineExceeded desc = context deadline exceeded" {return nil, fmt.Errorf("收集慢日志任务下发成功，TODO 进度展示功能")}
		errorStatus,_:=status.FromError(err)
		return nil, fmt.Errorf("grpc通信后端失败, 请查看后端日志确认, err: %v", errorStatus)
	}
	//for k, v := range res.SlowLogs {
	//	fmt.Printf("variable %v  value : %v\n", k, v)
	//}
	if res != nil {
		strbyte, e := json.Marshal(res)
		if e != nil {
			return nil, e
		}
		// strbyte 是 []byte 类型，可以直接通过接口 func()gin.H{} 返回给前端json数组
		fmt.Printf("%s\n", pretty.Pretty(strbyte))
		return strbyte, err
	}
	return nil, err
}

func (ls *SlowLogTaskClientService) GetSlowLogTask(req request.GetSlowLogSearch) *grpc_pb.SlowLogQueryRequest {
	port, _ := strconv.Atoi(req.VmMySQLPort)
	// 如果前端没有给详细的其实时间，默认分析一天时间的日志
	if req.StartTime.IsZero() || req.EndTime.IsZero() {
		layout := "2006-01-02 15:04:05"
		t := time.Now().Add(8 * time.Hour) // 转为北京时间
		toDay := t.Format(layout)
		beforeDay := t.AddDate(0, 0, -1).Format(layout)
		loc, _ := time.LoadLocation("Local")
		toDayTime, _ := time.ParseInLocation(layout, toDay, loc)
		beforeDayTime, _ := time.ParseInLocation(layout, beforeDay, loc)
		return &grpc_pb.SlowLogQueryRequest{
			MySQLIP:   req.VmMySQLHost,
			MySQLPort: int32(port),
			StartTime: timestamppb.New(beforeDayTime),
			EndTime:   timestamppb.New(toDayTime),
		}
	}
	return &grpc_pb.SlowLogQueryRequest{
		MySQLIP:   req.VmMySQLHost,
		MySQLPort: int32(port),
		StartTime: timestamppb.New(req.StartTime),
		EndTime:   timestamppb.New(req.EndTime),
	}
}
