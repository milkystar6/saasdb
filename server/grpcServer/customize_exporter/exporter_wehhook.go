package customize_exporter

import (
	"bytes"
	"fmt"
	"net/http"
)

/* 推送消息到统一的web服务 */

func AnalyzeHeader(data []byte, url string, headers map[string]string) {
	client := &http.Client{}
	req, err := http.NewRequest("POST", url, bytes.NewBuffer(data))
	if err != nil {
		//al.Error(fmt.Sprintf("Failed to create request:", err))
		fmt.Println(err)
		return
	}

	// 添加额外的请求头信息
	for key, value := range headers {
		req.Header.Set(key, value)
	}

	resp, err := client.Do(req)
	if err != nil {
		//al.Error(fmt.Sprintf("HTTP request error:", err))
		fmt.Println(err)
		return

	}
	defer resp.Body.Close()

	headerContentType := resp.Header.Get("Content-Type")
	//al.Info(fmt.Sprintf("Content-Type:", headerContentType))

	fmt.Println(headerContentType)
	// 其他分析 Header 的逻辑...
}
