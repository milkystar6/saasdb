package hook_command

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"strings"
)

func (c *Command) OpDeadMaster(deadMasterAddr string) {
	deadMasterAddrSlice := strings.Split(deadMasterAddr, ":")
	ipOrhost := deadMasterAddrSlice[0]
	port := deadMasterAddrSlice[1]
	ip := ""
	if makeSureIpOrHostname(ipOrhost) {
		ip = ipOrhost
	} else {
		ip = resloveHostname(ipOrhost)
	}
	fmt.Println("debug dead master ", ip, port)
	// 向 mysql宿主机节点发送grpc请求，完成dead master下线流程 ，如果失败，则失败 do noting。 请求成功 则由节点的grpcServer完成vip下线和设置read_only
	if client, err := c.grpcDeadMasterClient(ip); err != nil {
		// todo 告警推送访问old master失败
		fmt.Println(err)
	} else {
		deadMasterAddr = ip + ":" + port
		c.RpcOpDeadMaster(deadMasterAddr, client)
	}
}
func (c *Command) OpNewMaster(newMasterAddr string) {
	deadMasterAddrSlice := strings.Split(newMasterAddr, ":")
	ipOrhost := deadMasterAddrSlice[0]
	port := deadMasterAddrSlice[1]
	ip := ""
	if makeSureIpOrHostname(ipOrhost) {
		ip = ipOrhost
	} else {
		ip = resloveHostname(ipOrhost)
	}
	// todo 向 mysql宿主机节点发送grpc请求，完成new master下线流程 ，对操作发出推送
	if client, err := c.grpcNewMasterClient(ip); err != nil {
		// todo 告警推送提升新master失败
		fmt.Println(err)
	} else {
		// todo grpc请求
		newMasterAddr = ip + ":" + port
		err = c.RpcOpNewMaster(newMasterAddr, client)
	}
}

func (c *Command) RpcOpNewMaster(newMasterAddr string, client grpc_pb.OpNewMasterServiceClient) error {
	ctx, cancle := context.WithTimeout(context.Background(), global.GrpcCreateTimeout)
	defer cancle()
	res, err := client.NewOpNewMaster(ctx, c.OpNewMasterTask(newMasterAddr))
	if err != nil {
		// todo
		fmt.Println(err)
		return fmt.Errorf("%v", res.MessageError)
	} else {
		return nil
	}
}

func (c *Command) OpNewMasterTask(newMasterAddr string) *grpc_pb.OrchWebHookNewMasterRequest {
	return &grpc_pb.OrchWebHookNewMasterRequest{NewMasterAddress: newMasterAddr}
}

func (c Command) RpcOpDeadMaster(deadMasterAddr string, client grpc_pb.OpDeadMasterServiceClient) {
	ctx, cancle := context.WithTimeout(context.Background(), global.GrpcCreateTimeout)
	defer cancle()
	res, err := client.NewOpDeadMaster(ctx, c.OpDeadMasterTask(deadMasterAddr))
	if err != nil && res != nil {
		// todo
		fmt.Println(res.MessageError)
	} else {
		fmt.Println("task send success")
	}
}

func (c *Command) OpDeadMasterTask(deadMasterAddr string) *grpc_pb.OrchWebHookDeadMasterRequest {
	return &grpc_pb.OrchWebHookDeadMasterRequest{DeadMasterAddress: deadMasterAddr}
}
