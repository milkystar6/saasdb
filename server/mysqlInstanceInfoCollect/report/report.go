package report

import (
	"MySQLInstanceInfoCollect/collect"
	"MySQLInstanceInfoCollect/config"
	"MySQLInstanceInfoCollect/model"
	"MySQLInstanceInfoCollect/nodeinfo"
	"encoding/json"
	"fmt"
	"log"
	"os"
)

var DB model.MyDB

type Reporter struct {
}

func (r *Reporter) Start(version string, collector *nodeinfo.NodeCollecter) {
	err := r.RportHost(collector, collect.ConnInfo)
	if err != nil {
		log.Fatalf("Connect SaasDB and report the host infomation failed, err:%v", err)
	}
	err = r.ReportInstance(collector, collect.ConnInfo, version)
	if err != nil {
		log.Fatalf("Connect SaasDB and report the instance infomation fialed, err:%v", err)
	}
}

// get host id by ip
func (r Reporter) GetHostIdByIp(db *model.MyDB) (id int, err error) {
	var h model.Host
	tb := h.TableName()
	sql := fmt.Sprintf("SELECT id FROM %v where ip=\"%v\"", tb, collect.ConnInfo.MySQLInstance.MyHost)
	err = db.DB.Debug().Raw(sql).Scan(&id).Error
	if err != nil {
		return 0, err
	}
	return
}
func (r *Reporter) ReportInstance(collector *nodeinfo.NodeCollecter, conn *config.MyConnInfo, version string) error {
	Conn, err := DB.NewDBConn(false, conn)
	if err != nil {
		return err
	}
	insInfo := r.Write2SaasDB(Conn, collector)
	hostname, _ := os.Hostname()
	id, err := r.GetHostIdByIp(Conn)
	if err != nil {
		return err
	}

	instance := model.Instance{
		GVA_MODEL:    model.GVA_MODEL{},
		InstanceName: hostname,
		HostId:       &id,
		DomainId:     &collect.ConnInfo.Instance.DomainId,
		Ip:           collect.ConnInfo.MySQLInstance.MyHost,
		Port:         &collect.ConnInfo.MySQLInstance.MyPort,
		Application:  "mysql",
		Version:      version,
		UseType:      "正式",
		Health:       "available",
		Role:         collect.ConnInfo.Instance.Role,
		Feature: &model.Feature{NodeCollecter: struct {
			Cpu      *nodeinfo.Cpu
			Mem      *nodeinfo.Mem
			DataDisk *nodeinfo.DataDisk
		}{Cpu: &insInfo.Cpu, Mem: &insInfo.Mem, DataDisk: &insInfo.DataDisk}},
		Auth: nil,
	}

	return instance.CreateInstance(Conn.DB)
}

func (r *Reporter) RportHost(collector *nodeinfo.NodeCollecter, conn *config.MyConnInfo, ) error {
	Conn, err := DB.NewDBConn(false, conn)
	if err != nil {
		return err
	}
	insInfo := r.Write2SaasDB(Conn, collector)
	hostname, _ := os.Hostname()
	host := model.Host{
		GVA_MODEL: model.GVA_MODEL{},
		Hostname:  hostname,
		Ip:        collect.ConnInfo.MySQLInstance.MyHost,
		Feature: &model.Feature{NodeCollecter: struct {
			Cpu      *nodeinfo.Cpu
			Mem      *nodeinfo.Mem
			DataDisk *nodeinfo.DataDisk
		}{Cpu: &insInfo.Cpu, Mem: &insInfo.Mem, DataDisk: &insInfo.DataDisk}},
	}
	feature, err := json.Marshal(host.Feature)
	f := string(feature)
	if err != nil {
	}
	// sql using "replace into"
	rplHostSql :=fmt.Sprintf("REPLACE INTO %v (`created_at`,`updated_at`,`hostname`,`ip`,`feature`) ",host.TableName()) +
		"VALUES "+
		fmt.Sprintf("(NOW(),NOW(),'%v','%v','%v')",host.Hostname,host.Ip,f)

	fmt.Println(rplHostSql)
	return Conn.DB.Debug().Exec(rplHostSql).Error
	//return Conn.DB.Debug().Create(&host).Error

	// todo  replace  and saas_host table should have on unque index,because gorm has not got an method using to realize "REPLACE INTO"
}
func (r *Reporter) Write2SaasDB(c *model.MyDB, collector *nodeinfo.NodeCollecter) *model.MysqlInstanceInfo {
	return c.OrganizeDatabaseInformation(collector)
}
