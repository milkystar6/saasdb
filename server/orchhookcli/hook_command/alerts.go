package hook_command

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

func (c *Command) SendAlerts(url, msg string) {
	// 构造请求数据
	data := map[string]interface{}{
		"message": msg,
	}
	jsonData, err := json.Marshal(data)
	if err != nil {
		fmt.Printf("JSON 编码失败：%s\n", err)
		return
	}

	// 发送 POST 请求
	resp, err := http.Post(url, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		fmt.Printf("请求失败：%s\n", err)
		return
	}
	defer resp.Body.Close()

	// 读取响应内容
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("读取响应失败：%s\n", err)
		return
	}

	fmt.Println(string(body))
}
