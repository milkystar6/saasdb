package linux_cmd_interface

import "os/exec"

// 定义脚本执行接口
type ScriptExecutor interface {
	ExecuteScript(scriptPath string, scriptArgs []string) ([]byte, error)
}

// 实现脚本执行接口
type DefaultScriptExecutor struct{}

func (e *DefaultScriptExecutor) ExecuteScript(scriptPath string, scriptArgs []string) ([]byte, error) {
	cmd := exec.Command(scriptPath, scriptArgs...)
	return cmd.Output()
}
