package main

import (
	"MySQLInstanceInfoCollect/collect"
	"MySQLInstanceInfoCollect/nodeinfo"
	report2 "MySQLInstanceInfoCollect/report"
	"log"
	"sync"
)

var waitGroup sync.WaitGroup

//为了限制并发量，避免too many open file这样的错误
var ch = make(chan struct{}, 255)

func main() {
	var collector collect.Collecter
	info, err := collector.Start()
	if err != nil {
		log.Fatalf("收集统计信息错误:%v", err)
	}
	var nodecollector nodeinfo.NodeCollecter

	// write to saasdb
	var report report2.Reporter
	report.Start(info.Version, nodecollector.Start(info.Datadir))
	//datadir := "/Users/haochen/docker/mysql/data/saasdb/"
	//opsbase.Analyze(datadir)

}
