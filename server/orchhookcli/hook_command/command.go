package hook_command

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"github.com/spf13/cobra"
	"strings"
)

var (
	// DeadMasterAddress 旧master ip
	DeadMasterAddress string
	// NewMasterAddress 新master ip
	NewMasterAddress string

	// GrpcServerListenPort grpc配置
	GrpcServerListenPort int

	// GrpcCA CA
	GrpcCA string
	// GrpcKey CA Key
	GrpcKey string
	// GrpcWebUrl WebUrl default: example.server.com
	GrpcWebUrl string
)

type Command struct{}

func (c *Command) HandleCmd() {
	var rootCmd = &cobra.Command{
		Use:   "op",
		Short: "My CLI operate",
	}

	OpDeadMasterCmd := &cobra.Command{
		Use:   "Op_dead_master",
		Short: "Operate dead master",
		Run: func(cmd *cobra.Command, args []string) {
			c.OpDeadMaster(DeadMasterAddress)
		},
	}

	// todo 加一个故障类型  先判断类型，如果符合能切换的场景就操作 ，否则退出并推送告警
	OpDeadMasterCmd.Flags().StringVarP(&DeadMasterAddress, "Op_dead_master", "d", "127.0.0.1:3306", "要操作的dead master 地址")
	OpDeadMasterCmd.Flags().StringVarP(&GrpcCA, "GrpcCA", "m", "", "GrpcCA")
	OpDeadMasterCmd.Flags().StringVarP(&GrpcWebUrl, "GrpcWebUrl", "l", "", "GrpcWebUrl")
	OpDeadMasterCmd.Flags().IntVar(&GrpcServerListenPort, "WorkNode", 30081, "GrpcServerListenPort")

	OpNewMasterCmd := &cobra.Command{
		Use:   "Op_new_master",
		Short: "Operate new master",
		Run: func(cmd *cobra.Command, args []string) {
			c.OpNewMaster(NewMasterAddress)

		},
	}
	OpNewMasterCmd.Flags().StringVarP(&NewMasterAddress, "Op_new_master", "n", "127.0.0.2:3306", "要操作的new master 地址")
	OpNewMasterCmd.Flags().StringVarP(&GrpcCA, "GrpcCA", "m", "", "GrpcCA")
	OpNewMasterCmd.Flags().StringVarP(&GrpcWebUrl, "GrpcWebUrl", "l", "", "GrpcWebUrl")
	OpNewMasterCmd.Flags().IntVar(&GrpcServerListenPort, "WorkNode", 3000, "GrpcServerListenPort")

	rootCmd.AddCommand(OpDeadMasterCmd, OpNewMasterCmd)
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
	}
}

func (c *Command) OpDeadMaster(deadMasterAddr string) {
	deadMasterAddrSlice := strings.Split(deadMasterAddr, ":")
	ip := deadMasterAddrSlice[0]
	port := deadMasterAddrSlice[1]
	fmt.Println("debug dead master ", ip, port)
	// 向 mysql宿主机节点发送grpc请求，完成deal master下线流程 ，如果失败，则失败 do noting。 请求成功 则由节点的grpcServer完成vip下线和设置read_only
	if client, err := c.grpcDeadMasterClient(ip); err != nil {
		// todo 告警推送访问old master失败
		fmt.Println(err)
	} else {
		c.RpcOpDeadMaster(deadMasterAddr, client)
	}
}
func (c *Command) OpNewMaster(newMasterAddr string) {
	deadMasterAddrSlice := strings.Split(newMasterAddr, ":")
	ip := deadMasterAddrSlice[0]
	port := deadMasterAddrSlice[1]
	fmt.Println(ip, port)
	// 向 mysql宿主机节点发送grpc请求，完成new master下线流程 ，对操作发出推送
	if client, err := c.grpcNewMasterClient(ip); err != nil {
		// todo 告警推送提升新master失败
		fmt.Println(err)
	} else {
		// todo grpc请求
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
