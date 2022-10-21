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
	"strconv"
	"time"
)

type VariablesTaskClientService struct {
}

// ShowVariablesTask /*      show vars         */
func ShowVariablesTask(s []string, ip string, port int32) *grpc_pb.HandleVariablesRequest {
	return &grpc_pb.HandleVariablesRequest{
		Method:                false, // show
		ShowVariablesUseArray: NewVariables(s),
		MySQLIP:               ip,
		MySQLPort:             port,
	}

}

func NewVariables(s []string) (vv []*grpc_pb.ShowVariablesUseArray) {

	for _, v := range s {
		b := &grpc_pb.ShowVariablesUseArray{Var: v}
		vv = append(vv, b)
	}
	return vv
}

// SetVariablesStringTask /*      set vars         */
func SetVariablesStringTask(v map[string]string) *grpc_pb.HandleVariablesRequest {
	a := make(map[string]*grpc_pb.SetVariablesUseMap)
	for k, v := range v {
		a[k] = &grpc_pb.SetVariablesUseMap{VariableValue: SetVariablesUseMap_VariableValueString(v)}
	}
	return &grpc_pb.HandleVariablesRequest{
		Method:             true, // set
		SetVariablesUseMap: a,
	}
}

func SetVariablesInt32Task(v map[string]string) *grpc_pb.HandleVariablesRequest {
	a := make(map[string]*grpc_pb.SetVariablesUseMap)
	for k, v := range v {
		a[k] = &grpc_pb.SetVariablesUseMap{VariableValue: SetVariablesUseMap_VariableValueInt32(v)}
	}
	return &grpc_pb.HandleVariablesRequest{
		Method:             true, // set
		SetVariablesUseMap: a,
	}
}

func SetVariablesUseMap_VariableValueString(v string) *grpc_pb.SetVariablesUseMap_VariableValueString {
	return &grpc_pb.SetVariablesUseMap_VariableValueString{VariableValueString: v}
}

func SetVariablesUseMap_VariableValueInt32(v string) *grpc_pb.SetVariablesUseMap_VariableValueInt32 {
	return &grpc_pb.SetVariablesUseMap_VariableValueInt32{VariableValueInt32: v}
}

// ShowVariables show variables like "" ; 精确匹配参数运行值  TODO 这个方法用处不大 ，直接查询全部的参数然后在前端过滤即可
func (s *VariablesTaskClientService) ShowVariables(variables []string, ip string, port int32, client grpc_pb.MySQLVariablesServiceClient) {
	ctx, cancle := context.WithTimeout(context.Background(), time.Second)
	defer cancle()

	res, err := client.VariablesHandler(ctx, ShowVariablesTask(variables, ip, port))
	if err != nil {
		fmt.Println(err)
	}
	for k, v := range res.VariableName {
		fmt.Printf("variable %v  value : %v\n", k, v)
	}
	if res != nil {
		strbyte, e := json.Marshal(res)
		if e != nil {
			fmt.Println(e)
		}
		// strbyte 是 []byte 类型，可以直接通过接口 func()gin.H{} 返回给前端json数组
		fmt.Printf("%s\n", pretty.Pretty(strbyte))
	}
}

// ShowVariables_fuzzy_matching show variables like "%%" 用于模糊匹配参数,不写条件的话, 等同于 show variables
// TODO Variables 参数 用结构体传递 不要用参数了 太繁琐。。。。
func (s *VariablesTaskClientService) ShowVariables_fuzzy_matching(variables []string, ip string, port int32, client grpc_pb.MySQLVariablesServiceClient) ([]byte, error) {
	ctx, cancle := context.WithTimeout(context.Background(), global.GrpcCreateTimeout)
	defer cancle()

	res, err := client.VariablesHandler(ctx, ShowVariablesTask(variables, ip, port))
	if err != nil {
		return nil, fmt.Errorf("grpc通信后端失败, 请查看后端日志确认, err: %v", err.Error())
	}
	//for k, v := range res.VariableName {
	//	fmt.Printf("variable %v  value : %v\n", k, v)
	//}
	if res != nil {
		strbyte, e := json.Marshal(res)
		if e != nil {
			fmt.Println(e)
		}
		// strbyte 是 []byte 类型，可以直接通过接口 func()gin.H{} 返回给前端json数组
		//fmt.Printf("%s\n", pretty.Pretty(strbyte))
		return strbyte, err
	}
	return nil, err
}

// SetVariable 修改参数的运行值 (数据库配置文件参数设置的值，修改数据库配置文件 方法不够安全，最好是人工修改 ，第一版本不支持自动修改，这种可以加一个数据库运行值和配置文件参数设置值的监控告警)
func (s *VariablesTaskClientService) SetVariable() {

}

func (s *VariablesTaskClientService) NewClient(msg global.GrpcMsg) (grpc_pb.MySQLVariablesServiceClient, error) {
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

	client := grpc_pb.NewMySQLVariablesServiceClient(conn)

	return client, err

}

// ShowVariablesEntry 入口函数
func (s *VariablesTaskClientService) ShowVariablesEntry(req request.ReqVariables) ([]byte, error) {
	var msg = global.GrpcMsg{
		WorkNode: req.Vm,
	}

	client, err := s.NewClient(msg)
	if err != nil {
		return nil, err
	}
	if len(req.VariablesSlice) == 0 {
		/* 默认展示的参数，如果需要增加或者修改参数的话，同时在/Users/anderalex/go/src/saasdb/server/model/saasdb/request/grpcvariables.go中修改DecodeVariablesJson结构体 */
		req.VariablesSlice = global.DefaultVariablesList
	}
	port, _ := strconv.Atoi(req.VmMySQLPort)
	return s.ShowVariables_fuzzy_matching(req.VariablesSlice, req.VmMySQLHost, int32(port), client)
}
