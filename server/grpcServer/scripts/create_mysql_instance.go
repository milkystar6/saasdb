package scripts

import (
	"fmt"
	"os/exec"
	"strconv"
)

/*  用于实现创建1个mysql实例
    支持5.6 5.7 8.0版本数据库创建，默认使用最高版本
    如果需要特定到某个小版本，可以按需定制或者更新package文件中的mysql包
*/
const (
	ScriptPath                 = "./script_files/create_mysql_instance/"
	CreateOneMySQL56ScriptName = "create_mysql56_one.sh"
	CreateOneMySQL57ScriptName = "create_mysql57_one.sh"
	CreateOneMySQL80ScriptName = "create_mysql80_one.sh"
	// 未来版本: 听说MySQL 9.0快要发布了
)

// CreateMysqlInstance
/* CreateMysqlInstance 结构体用于表示脚本需要的参数 */
type CreateMysqlInstance struct {
	Version          string
	Ip               string
	Port             int
	ReplUser         string
	ReplUserPasswd   string
	BackupUser       string
	BackupUserPasswd string
	DomainId         int
	InstanceName     string
	HostId           int
	UseType          string
	MaxMemory        int
	MaxConnections   int
	MySQLHub         *MySQLHub `json:"MySQLHub,omitempty"`
}
type MySQLHub struct {
	MySQLHubIP       string `json:"MySQLHubIP,omitempty"`
	MySQLHubPort     int    ` json:"MySQLHubPort,omitempty"`
	MySQLHubDir      string ` json:"MySQLHubDir,omitempty"`
	HubSshUser       string `json:"HubSshUser,omitempty"`
	HubSsHUserPasswd string `json:"HubSsHUserPasswd,omitempty"`
}

func (c *CreateMysqlInstance) CreateOneMySQL() error {
	if c.Version == "56" {
		return c.RunCreateScripts(CreateOneMySQL56ScriptName)
	} else if c.Version == "57" {
		return c.RunCreateScripts(CreateOneMySQL57ScriptName)
	} else if c.Version == "80" {
		return c.RunCreateScripts(CreateOneMySQL80ScriptName)
	}
	return nil
}

func (c *CreateMysqlInstance) RunCreateScripts(scriptName string) error {
	scriptArgs := "" +
		" --version " + c.Version +
		" --port " + strconv.Itoa(c.Port) +
		" --repl_user " + c.ReplUser +
		" --repl_user_passwd " + c.ReplUserPasswd +
		" --backup_user " + c.BackupUser +
		" --backup_user_passwd " + c.BackupUserPasswd +
		" --max_memory " + strconv.Itoa(c.MaxMemory) + "" +
		" --max_connections" + strconv.Itoa(c.MaxConnections) +
		" --hub_ip " + c.MySQLHub.MySQLHubIP +
		" --hub_port " + strconv.Itoa(c.MySQLHub.MySQLHubPort) +
		" --hub_dir " + c.MySQLHub.MySQLHubDir +
		" --hub_ssh_user " + c.MySQLHub.HubSshUser +
		" --hub_ssh_user_passwd" + c.MySQLHub.HubSsHUserPasswd

	cmd := exec.Command("/bin/bash", ScriptPath+scriptName, scriptArgs)
	output, err := cmd.Output()
	if err != nil {
		fmt.Println("执行命令出错：", err)
		return fmt.Errorf("ERROR: %v,OUTPUT: %v", err, output)
	}
	return nil
}
