package linux_cmd_interface

import (
	"os"
	"testing"
)

// 测试脚本执行功能
func TestScriptExecution(t *testing.T) {
	// 创建脚本执行器对象
	scriptExecutor := &DefaultScriptExecutor{}

	// 设置脚本的路径和参数
	scriptPath := "test.sh"
	scriptArgs := []string{"-a", "xxx", "-b", "xxx", "--c", "xxx"}

	// 调用脚本执行器的方法执行脚本
	output, err := scriptExecutor.ExecuteScript(scriptPath, scriptArgs)
	if err != nil {
		t.Errorf("Error executing script: %s", err)
	}

	// 检查输出是否符合预期
	expectedOutput := "Your expected output"
	if string(output) != expectedOutput {
		t.Errorf("Unexpected output.\nExpected: %s\nActual: %s", expectedOutput, string(output))
	}
}

func TestMain(m *testing.M) {
	// 运行测试
	code := m.Run()

	// 执行一些测试后的清理操作
	// ...

	os.Exit(code)
}
