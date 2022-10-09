package main

import (
	"MySQLInstanceInfoCollect/collect"
	"MySQLInstanceInfoCollect/nodeinfo"
	report2 "MySQLInstanceInfoCollect/report"
	"log"
)

func main() {
	var collector collect.Collecter
	info, err := collector.Start()
	if err != nil {
		log.Fatalf("收集统计信息错误:%v", err)
	}
	var nodecollector nodeinfo.NodeCollecter

	// write to saasdb
	var report report2.Reporter
	report.Start(info.Version,nodecollector.Start(info.Datadir))
}
