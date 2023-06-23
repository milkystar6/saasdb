// 自动生成模板Instance
package saasdb

import (
	"database/sql/driver"
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"gorm.io/gorm"
)

// const instance health
const (
	Avaiabel    = "available"
	Unavailable = "unavailable"
	Restarting  = "restarting"
	Starting    = "starting"
	Stoping     = "stoping"
	Migrating   = "migrating"
	Creating    = "creating"
	Standby     = "standby"
)

// const instance roles
const (
	RoleMaster     = "master"
	RoleSlaveForHa = "slaveforha"
	RoleSlaveOnly  = "slaveonly"
)

// Instance 结构体
type Instance struct {
	global.GVA_MODEL
	InstanceName string   `json:"instance_name" form:"instance_name" gorm:"column:instance_name;comment:实例名称"`
	HostId       *int     `json:"hostId" form:"hostId" gorm:"column:host_id;comment:hostId;"`
	ProjId       *int     `json:"projId" form:"projId" gorm:"column:proj_id;comment:项目id;"`
	DomainId     *int     `json:"domainId" form:"domainId" gorm:"column:domain_id;comment:;"`
	Ip           string   `json:"ip" form:"ip" gorm:"column:ip;comment:ip;uniqueIndex:ip_port;"`
	Port         *int     `json:"port" form:"port" gorm:"column:port;comment:port;uniqueIndex:ip_port;"`
	Application  string   `json:"application" form:"application" gorm:"column:application;type:enum('oracle','mysql','redis','mongodb','tidb');comment:application应用类型;"`
	Version      string   `json:"version" form:"version" gorm:"column:version;comment:;"`
	UseType      string   `json:"useType" form:"useType" gorm:"column:use_type;type:enum('正式','线上测试','预发布');comment:;"`
	Health       string   `json:"health" form:"health" gorm:"column:health;type:enum('available','unavailable','restarting','starting','stoping','migrating','creating','standby');comment:数据库状态;"`
	Role         string   `json:"role" form:"role" gorm:"column:role;type:enum('master','slaveforha','slaveonly');comment:数据库实例在集群中的角色，master节点只能有一个;"`
	Feature      *Feature `json:"feature" gorm:"TYPE:json"`
	Auth         *Auth    `json:"auth" gorm:"TYPE:json"`
	//Feature      *Feature `json:"feature" gorm:"TYPE:json;default:{}"`
	//Auth         *Auth    `json:"auth" gorm:"TYPE:json;default:{}"`
	IdcId *int `json:"idc_id,omitempty" form:"idc_id" gorm:"column:idc_id;type:int(10) not null default 2;comment:idc id"`
}

// TableName Instance 表名
func (Instance) TableName() string {
	return "saas_instance"
}

// InstanceDontUpdateFeature 结构体
type InstanceDontUpdateFeature struct {
	global.GVA_MODEL
	InstanceName string `json:"instance_name,omitempty" form:"instance_name" gorm:"column:instance_name;comment:实例名称"`
	HostId       *int   `json:"hostId,omitempty" form:"hostId" gorm:"column:host_id;comment:hostId;"`
	ProjId       *int   `json:"projId,omitempty" form:"projId" gorm:"column:proj_id;comment:项目id;"`
	DomainId     *int   `json:"domainId,omitempty" form:"domainId" gorm:"column:domain_id;comment:;"`
	Ip           string `json:"ip" form:"ip" gorm:"column:ip;comment:ip;uniqueIndex:ip_port;"`
	Port         *int   `json:"port" form:"port" gorm:"column:port;comment:port;uniqueIndex:ip_port;"`
	Application  string `json:"application,omitempty" form:"application" gorm:"column:application;type:enum('oracle','mysql','redis','mongodb','tidb');comment:application应用类型;"`
	Version      string `json:"version,omitempty" form:"version" gorm:"column:version;comment:;"`
	UseType      string `json:"useType,omitempty" form:"useType" gorm:"column:use_type;type:enum('正式','线上测试','预发布');comment:;"`
	Health       string `json:"health,omitempty" form:"health" gorm:"column:health;type:enum('available','unavailable','restarting','starting','stoping','migrating','standby');comment:;"`
	//Level        string   `json:"level" form:"level" gorm:"column:level;type:enum('1','2','3','4');comment:;"`
	Role string `json:"role,omitempty" form:"role" gorm:"column:role;type:enum('master','slaveforha','slaveonly');comment:数据库实例在集群中的角色，master节点只能有一个;"`
	//Feature      *Feature `json:"feature" gorm:"TYPE:json"`  # 更新的时候不更新feature字段
	Auth *Auth `json:"auth,omitempty" gorm:"TYPE:json"`
}

// TableName InstanceDontUpdateFeature
func (InstanceDontUpdateFeature) TableName() string {
	return "saas_instance"
}

type Feature struct {
	*Cpu      `json:"Cpu,omitempty" gorm:"TYPE:json" `
	*Mem      `json:"Mem,omitempty" gorm:"TYPE:json"`
	*DataDisk `json:"DataDisk,omitempty" gorm:"TYPE:json"`
}
type Cpu struct {
	CoresLogical  *int    `json:"cores_logical,omitempty"`
	CoresPhysical *int    `json:"cores_physical,omitempty"`
	IsHT          bool    `json:"is_ht,omitempty"`
	ModelName     string  `json:"model_name,omitempty"`
	MHZ           float64 `json:"mhz,omitempty"`
}
type Mem struct {
	VirtualMemory      *int64 `json:"virtual_memory"`
	VirtualMemoryHuman string `json:"virtual_memory_human"`
}

type DataDisk struct {
	DatadirName      string `json:"datadir_name"`
	DatadirSize      *int64 `json:"datadir_size"`
	DatadirSizeHuman string `json:"datadir_size_human"`
	FsType           string `json:"fs_type"`
}

type Auth struct {
}

func (c Feature) Value() (driver.Value, error) {
	b, err := json.Marshal(c)
	return string(b), err
}

func (c *Feature) Scan(input interface{}) error {
	return json.Unmarshal(input.([]byte), c)
}

func (c Auth) Value() (driver.Value, error) {
	b, err := json.Marshal(c)
	return string(b), err
}

func (c *Auth) Scan(input interface{}) error {
	return json.Unmarshal(input.([]byte), c)
}

func (c Cpu) Value() (driver.Value, error) {
	b, err := json.Marshal(c)
	return string(b), err
}

func (c *Cpu) Scan(input interface{}) error {
	return json.Unmarshal(input.([]byte), c)
}
func (c Mem) Value() (driver.Value, error) {
	b, err := json.Marshal(c)
	return string(b), err
}

func (c *Mem) Scan(input interface{}) error {
	return json.Unmarshal(input.([]byte), c)
}
func (c DataDisk) Value() (driver.Value, error) {
	b, err := json.Marshal(c)
	return string(b), err
}

func (c *DataDisk) Scan(input interface{}) error {
	return json.Unmarshal(input.([]byte), c)
}

// GetDomainIdByIpPort 根据ip 端口获取Doaminid
func (i *Instance) GetDomainIdByIpPort(db *gorm.DB, ip string, port int) (domainId *int, total int64, err error) {
	// 创建db
	var saas_instances []Instance
	err = db.Model(Instance{}).Where("ip=? and port=?", ip, port).Find(&saas_instances).Count(&total).Error
	if total > 1 {
		err = fmt.Errorf(fmt.Sprintf("存在单个ip port含有多个domainId的逻辑错误，请检查错误的逻辑关系, debug ip:%v,port:%v", ip, port))
	}
	return saas_instances[0].DomainId, total, err
}
