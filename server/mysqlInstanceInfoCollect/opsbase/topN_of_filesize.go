package opsbase

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"
	"sync"
	"time"
)

/* 用于计算给定文件下下的filesize的topN */

var waitGroup sync.WaitGroup

//为了限制并发量，避免too many open file这样的错误
var ch = make(chan struct{}, 255)

// DirFiles 目录下的文件结构体

func Analyze(dir string) map[string]interface{} {
	// 这里用了chan 反而增加了代码复杂度。。。。
	t := time.Now()
	var filesizeslize []int64
	fileinfo := make(chan map[string]int64)
	waitGroup.Add(1)

	go walkDir(dir, fileinfo)
	go func() {
		defer close(fileinfo)
		waitGroup.Wait()
	}()
	// topN 文件大小和文件名称
	topNMap := make(map[string]interface{})
	allfileMap := make(map[string]interface{})
	// 处理 fileinfo chan里的数据  只要filesize
	for info := range fileinfo {
		for _, v := range info {
			filesizeslize = append(filesizeslize, v)
		}
		for fn, fs := range info {
			if fs == fs {
				allfileMap[fn] = fs
			}
		}
	}

	// 取 topN
	n := 5
	// 调用最小堆算法 取得最小值
	miniHeapslize ,ncr:= TopN(filesizeslize, n)
	if !ncr{
		// 如果需要计算topN的值 通过返回的filesize去找文件信息 实际使用 出现相同的值几乎不可能
		for _, v := range miniHeapslize {
				for fn, fs := range allfileMap {
					if fs == v {
						topNMap[fn] = fs // TODO fs单位为bytes 即 Bit ,后续转Humansize
					}
				}
		}
		fmt.Println("花费的时间为 " + time.Since(t).String(),topNMap,len(topNMap))
	}
	return topNMap
}

//递归计算目录下所有文件
func walkDir(dir string, returninfo chan<- map[string]int64) {
	defer waitGroup.Done()
	ch <- struct{}{} //限制并发量
	entries, ok := dirents(dir)
	<-ch
	if !ok {
		log.Fatal("can not find this dir path!!")
		return
	}
	// 递归
	for _, e := range entries {
		if e.IsDir() {
			waitGroup.Add(1)
			go walkDir(filepath.Join(dir, e.Name()), returninfo)
		} else if !strings.Contains(e.Name(), ".frm") { // 不统计 .frm 文件
			info := make(map[string]int64)
			info[e.Name()] = e.Size()
			returninfo <- info
		}
	}
}

// dirents
// input: dirname
// output: []os.FileInfo
func dirents(path string) ([]os.FileInfo, bool) {
	entries, err := ioutil.ReadDir(path)
	if err != nil {
		log.Fatal(err)
		return nil, false
	}
	return entries, true
}
