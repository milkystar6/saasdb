package model

import (
	"MySQLInstanceInfoCollect/nodeinfo"
	"bytes"
	"encoding/json"
	"fmt"
)
type MysqlInstanceInfo struct {
	Cpu      nodeinfo.Cpu
	Mem      nodeinfo.Mem
	DataDisk nodeinfo.DataDisk
}
// OrganizeDatabaseInformation Organize database information
func (c *MyDB) OrganizeDatabaseInformation(collector *nodeinfo.NodeCollecter,) *MysqlInstanceInfo {

	msg := MysqlInstanceInfo{
		Cpu:      *collector.Cpu,
		Mem:      *collector.Mem,
		DataDisk: *collector.DataDisk,
	}
	res, err := json.Marshal(msg)
	dst := bytes.Buffer{}
	err = json.Indent(&dst, res, "", "  ")
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(string(dst.Bytes()))
	return &msg
}
