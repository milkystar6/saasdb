package main

import (
	"MySQLInstanceInfoCollect/collect"
	"MySQLInstanceInfoCollect/nodeinfo"
	"MySQLInstanceInfoCollect/opsbase"
	report2 "MySQLInstanceInfoCollect/report"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"sync"
	"time"
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
	datadir := "/Users/haochen/docker/mysql/data/saasdb/"
	opsbase.Analyze(datadir)
}

func newtest(TestDirPath string) {
	// TODO 统计DATADIR下各个文件大小
	//文件大小chennel
	fileSize := make(chan int64)
	//文件总大小
	var sizeCount int64
	//文件数目
	var fileCount uint
	waitGroup.Add(1)
	go walkDir(TestDirPath, fileSize)

	go func() {
		defer close(fileSize)
		waitGroup.Wait()
	}()

	t := time.Now()
	for size := range fileSize {
		fileCount++
		sizeCount += size
	}
	fmt.Println("花费的时间为 " + time.Since(t).String())
	fmt.Printf("该目录大小为 %.1fGB\n文件总数为 %d\n", float64(sizeCount)/1e9, fileCount)
}

/*
*   计算整个目录所占磁盘大小
 */

func dirents(path string) ([]os.FileInfo, bool) {
	entries, err := ioutil.ReadDir(path)
	if err != nil {
		log.Fatal(err)
		return nil, false
	}
	return entries, true
}

//递归计算目录下所有文件
func walkDir(path string, fileSize chan<- int64) {
	defer waitGroup.Done()
	fmt.Printf("\rwalk ... %s\n", path)
	ch <- struct{}{} //限制并发量
	entries, ok := dirents(path)
	<-ch
	if !ok {
		log.Fatal("can not find this dir path!!")
		return
	}
	for _, e := range entries {
		if e.IsDir() {
			waitGroup.Add(1)
			go walkDir(filepath.Join(path, e.Name()), fileSize)
		} else {
			fileSize <- e.Size()
		}
	}
}
