package hook_command

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"strconv"
	"strings"
)

func (c *Command) OpSetReadOnly(mysqlAddr string) {
	mysqlAddrSlice := strings.Split(mysqlAddr, ":")
	ipOrhost := mysqlAddrSlice[0]
	port := mysqlAddrSlice[1]
	ip := ""
	if makeSureIpOrHostname(ipOrhost) {
		ip = ipOrhost
	} else {
		ip = resloveHostname(ipOrhost)
	}
	// conn2db or send grpc message 2 grpcServer(saasdb_agent)
	vars := make(map[string]string, 0)
	fmt.Println(MySQLReadOnly)
	if MySQLReadOnly {
		vars["read_only"] = "ON"
	} else {
		vars["read_only"] = "OFF"
	}
	if client, err := c.grpcNewSetReadOnly(ip); err != nil {
		// todo 告警推送提升新master失败
	} else {
		// todo grpc请求
		if intPort, err := strconv.Atoi(port); err == nil {
			nErr := c.SetVariable(vars, ip, int32(intPort), client)
			if nErr != nil {
				fmt.Println(nErr)
			}
		}
	}
}

func (c *Command) SetVariable(v map[string]string, ip string, port int32, client grpc_pb.MySQLVariablesServiceClient) error {
	ctx, cancle := context.WithTimeout(context.Background(), global.GrpcCreateTimeout)
	defer cancle()
	res, err := client.VariablesHandler(ctx, c.SetVariablesStringTask(v, ip, port))
	if err != nil {
		return fmt.Errorf("grpc通信后端失败, 请查看后端日志确认, err: %v", err.Error())
	}
	if res.SetOK {
		//todo 推送set read only 成功
	} else {
		//todo 推送set read only失败
	}
	return nil
}

// SetVariablesStringTask /*      set vars         */
func (c *Command) SetVariablesStringTask(v map[string]string, ip string, port int32) *grpc_pb.HandleVariablesRequest {
	a := make(map[string]*grpc_pb.SetVariablesUseMap)
	for k, v := range v {
		a[k] = &grpc_pb.SetVariablesUseMap{VariableValue: c.SetVariablesUseMap_VariableValueString(v)}
	}
	return &grpc_pb.HandleVariablesRequest{
		Method:             true, // set
		SetVariablesUseMap: a,
		MySQLIP:            ip,
		MySQLPort:          port,
	}
}

func (c *Command) SetVariablesInt32Task(v map[string]string) *grpc_pb.HandleVariablesRequest {
	a := make(map[string]*grpc_pb.SetVariablesUseMap)
	for k, v := range v {
		a[k] = &grpc_pb.SetVariablesUseMap{VariableValue: c.SetVariablesUseMap_VariableValueInt32(v)}
	}
	return &grpc_pb.HandleVariablesRequest{
		Method:             true, // set
		SetVariablesUseMap: a,
	}
}

func (c *Command) SetVariablesUseMap_VariableValueString(v string) *grpc_pb.SetVariablesUseMap_VariableValueString {
	return &grpc_pb.SetVariablesUseMap_VariableValueString{VariableValueString: v}
}

func (c *Command) SetVariablesUseMap_VariableValueInt32(v string) *grpc_pb.SetVariablesUseMap_VariableValueInt32 {
	return &grpc_pb.SetVariablesUseMap_VariableValueInt32{VariableValueInt32: v}
}
