package report

import (
	"MySQLInstanceInfoCollect/collect"
	"MySQLInstanceInfoCollect/config"
	"MySQLInstanceInfoCollect/model"
	"MySQLInstanceInfoCollect/nodeinfo"
	"log"
	"os"
)

var DB model.MyDB

type Reporter struct {
}

func (r *Reporter) Start(version string, collector *nodeinfo.NodeCollecter) {
	err := r.ConnSaasDB(collector, collect.ConnInfo, version)
	if err != nil {
		log.Fatalf("Connect SaasDB failed, err:%v", err)
	}
}
func (r *Reporter) ConnSaasDB(collector *nodeinfo.NodeCollecter, conn *config.MyConnInfo, version string) error {
	Conn, err := DB.NewDBConn(false, conn)
	if err != nil {
		return err
	}
	insInfo := r.Write2SaasDB(Conn, collector)
	hostname, _ := os.Hostname()
	instance := model.Instance{
		GVA_MODEL:    model.GVA_MODEL{},
		InstanceName: hostname,
		HostId:       nil,
		//ProjId:       &collect.ConnInfo.Instance.ProjId,
		DomainId:     &collect.ConnInfo.Instance.DomainId,
		Ip:           collect.ConnInfo.MySQLInstance.MyHost,
		Port:         &collect.ConnInfo.MySQLInstance.MyPort,
		Application:  "mysql",
		Version:      version,
		UseType:      "正式",
		Health:       "available",
		Level:        "3",
		Role:         collect.ConnInfo.Instance.Role,
		//CpuNum:       &insInfo.Cpu.CoresLogical,
		//Memory:       &insInfo.Mem.VirtualMemory,
		//DataDirSize:  &insInfo.DataDisk.DatadirSize,
		Feature: &model.Feature{NodeCollecter: struct {
			Cpu      *nodeinfo.Cpu
			Mem      *nodeinfo.Mem
			DataDisk *nodeinfo.DataDisk
		}{Cpu: &insInfo.Cpu, Mem: &insInfo.Mem, DataDisk: &insInfo.DataDisk}},
		Auth: nil,
	}
	return instance.CreateInstance(Conn.DB)
}

func (r *Reporter) Write2SaasDB(c *model.MyDB, collector *nodeinfo.NodeCollecter) *model.MysqlInstanceInfo {
	return c.OrganizeDatabaseInformation(collector)
}
