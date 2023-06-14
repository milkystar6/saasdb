package hook_command

import (
	"fmt"
	"github.com/spf13/cobra"
	"strings"
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

	// saasdb connection
	SaasDBAddr, SaasDBUser, SaasDBPassword string
	// modify roles
	InstanceAddr string
	Role         string

	// 消息推送webhook reset api
	AlertsApiAddr, AlertsInfo string
)

type Command struct{}

func (c *Command) HandleCmd() {
	var rootCmd = &cobra.Command{
		Use:   "op",
		Short: "My CLI operate",
	}

	/* 1、op dead master */
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

	/* 2、op new master */
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

	/* 3、op set read_only */
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

	/* 4、modify role of instance */
	ModifyRolesCmd := &cobra.Command{
		Use:   "Modify_roles",
		Short: "Modify the roles for mysqld instance",
		Run: func(cmd *cobra.Command, args []string) {
			mysqlAddrSlice := strings.Split(InstanceAddr, ":")
			ipOrhost := mysqlAddrSlice[0]
			port := mysqlAddrSlice[1]
			ip := getIpFromAddr(ipOrhost)
			meta := ModifyRoleMsg{
				MIns:            fmt.Sprintf("%v:%v", ip, port),
				MRole:           Role,
				MSaasDBAddr:     SaasDBAddr,
				MSaasDBUser:     SaasDBUser,
				MSaasDBPassword: SaasDBPassword,
			}
			c.ModifyRoles(meta)
		},
	}
	ModifyRolesCmd.Flags().StringVarP(&InstanceAddr, "InstanceAddr", "i", "127.0.0.1:3306", "要修改角色的mysql实例地址")
	ModifyRolesCmd.Flags().StringVarP(&Role, "role", "r", "standby", "角色")
	ModifyRolesCmd.Flags().StringVarP(&SaasDBAddr, "SaasDBAddr", "a", "127.0.0.1:3306", "saasdb数据库地址,{ip}:{port}")
	ModifyRolesCmd.Flags().StringVarP(&SaasDBUser, "SaasDBUser", "u", "", "访问saasdb数据库user")
	ModifyRolesCmd.Flags().StringVarP(&SaasDBPassword, "SaasDBPassword", "p", "123456", "访问saasdb数据库用户password")

	/* 5、发送webhook消息推送 到钉钉 */

	SendAlertsCmd := &cobra.Command{
		Use:   "SendAlerts",
		Short: "Send Alerts to webhook,like dingding ,reset api ,etc",
		Run: func(cmd *cobra.Command, args []string) {
			c.SendAlerts(AlertsApiAddr, AlertsInfo)
		},
	}
	SendAlertsCmd.Flags().StringVarP(&AlertsApiAddr, "alerts_api_addr", "i", "http://127.0.0.1:21000/api", "外部消息推送api的地址")
	SendAlertsCmd.Flags().StringVarP(&AlertsInfo, "alerts_info", "m", "监测到mysql故障", "推送消息信息")

	// root cmd
	rootCmd.AddCommand(OpDeadMasterCmd, OpNewMasterCmd, OpSetReadOnlyCmd, ModifyRolesCmd, SendAlertsCmd)
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
	}
}
