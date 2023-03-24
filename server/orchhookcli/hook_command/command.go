package hook_command

import (
	"fmt"
	"github.com/spf13/cobra"
)

var (
	// DeadMasterAddress 旧master地址
	DeadMasterAddress string
	// NewMasterAddress 新master地址
	NewMasterAddress string
	// OpMySQLReadOnlyAddress 要修改read_only参数的MySQL实例地址
	OpMySQLReadOnlyAddress string
	//MySQLReadOnly readonly的值
	MySQLReadOnly bool

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

	OpSetReadOnlyCmd := &cobra.Command{
		Use:   "Op_set_read_only",
		Short: "set mysql global variable read_only 0 or 1",
		Run: func(cmd *cobra.Command, args []string) {
			c.OpSetReadOnly(OpMySQLReadOnlyAddress)
		},
	}

	OpSetReadOnlyCmd.Flags().StringVarP(&OpMySQLReadOnlyAddress, "Op_mysql_addr", "r", "127.0.0.1:3306", "要操作的mysql 地址")
	OpSetReadOnlyCmd.Flags().StringVarP(&GrpcCA, "GrpcCA", "m", "", "GrpcCA")
	OpSetReadOnlyCmd.Flags().StringVarP(&GrpcWebUrl, "GrpcWebUrl", "l", "", "GrpcWebUrl")
	OpSetReadOnlyCmd.Flags().IntVar(&GrpcServerListenPort, "WorkNode", 3000, "GrpcServerListenPort")
	OpSetReadOnlyCmd.Flags().BoolVarP(&MySQLReadOnly, "ReadOnly", "b", false, "是否设置read_only")

	// root cmd
	rootCmd.AddCommand(OpDeadMasterCmd, OpNewMasterCmd, OpSetReadOnlyCmd)
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
	}
}
