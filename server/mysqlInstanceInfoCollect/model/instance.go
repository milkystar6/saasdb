package model

import (
	"MySQLInstanceInfoCollect/nodeinfo"
	"database/sql/driver"
	"encoding/json"
	"fmt"
	"gorm.io/gorm"
	"time"
)

type GVA_MODEL struct {
	ID        uint           `gorm:"primarykey"` // 主键ID
	CreatedAt time.Time      // 创建时间
	UpdatedAt time.Time      // 更新时间
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"` // 删除时间
}

type Instance struct {
	GVA_MODEL
	//InsId       *int     `json:"insId" form:"insId" gorm:"column:ins_id;comment:insId;uniqueIndex:ins_id;"`
	InstanceName string   `json:"instance_name" form:"instance_name" gorm:"column:instance_name;comment:实例名称"`
	HostId       *int     `json:"hostId" form:"hostId" gorm:"column:host_id;comment:hostId;"`
	ProjId       *int     `json:"projId" form:"projId" gorm:"column:proj_id;comment:项目id;"`
	DomainId     *int     `json:"domainId" form:"domainId" gorm:"column:domain_id;comment:;"`
	Ip           string   `json:"ip" form:"ip" gorm:"column:ip;comment:ip;"`
	Port         *int     `json:"port" form:"port" gorm:"column:port;comment:port;"`
	Application  string   `json:"application" form:"application" gorm:"column:application;type:enum('oracle','mysql','redis','mongodb','tidb');comment:application应用类型;"`
	Version      string   `json:"version" form:"version" gorm:"column:version;comment:;"`
	UseType      string   `json:"useType" form:"useType" gorm:"column:use_type;type:enum('正式','线上测试','预发布');comment:;"`
	Health       string   `json:"health" form:"health" gorm:"column:health;type:enum('available','unavailable','restarting','starting','stoping','migrating');comment:;"`
	Level        string   `json:"level" form:"level" gorm:"column:level;type:enum('1','2','3','4');comment:;"`
	Role         string   `json:"role" form:"role" gorm:"column:role;type:enum('master','slaveforha','slaveonly');comment:数据库实例在集群中的角色，master节点只能有一个;"`
	CpuNum       *int     `json:"cpu_num" form:"cpu_num" gorm:"column:cpu_num;type:int(10);comment:数据库instance的cpu个数"`
	Memory       *uint64  `json:"memory" form:"memory" gorm:"column:memory;comment:数据库内存大小，单位为Bit"`
	DataDirSize  *uint64  `json:"data_dir_size" form:"data_dir_size" gorm:"column:data_dir_size;comment:数据库datadir大小，单位为Bit"`
	Feature      *Feature `json:"feature" gorm:"TYPE:json;default:{}"`
	Auth         *Auth    `json:"auth" gorm:"TYPE:json;default:{}"`
}

// TableName Instance 表名
func (Instance) TableName() string {
	return "saas_instance"
}

type Feature struct {
	nodeinfo.NodeCollecter
}
type Auth struct {
	UserName     string `json:"user_name"`
	UserPassword string `json:"user_password"`
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

func (receiver *Instance) CreateInstance(db *gorm.DB) error {
	//fmt.Println(receiver)
	//return db.Debug().Create(&receiver).Error
	feature, err := json.Marshal(receiver.Feature)
	f := string(feature)
	if err != nil {
	}
	sql := "INSERT INTO `saasdb`.`saas_instance` (created_at,updated_at,instance_name,proj_id,domain_id,ip,port,application,version,use_type,health,role,feature) " +
		"VALUES " +
		fmt.Sprintf("(NOW(),NOW(),'%v','%v','%v','%v','%v','%v','%v','%v','%v','%v','%v')", receiver.InstanceName, *receiver.ProjId, *receiver.DomainId, receiver.Ip, *receiver.Port, receiver.Application, receiver.Version, receiver.UseType, receiver.Health, receiver.Role, f)

	// Tips 如果简单的sql 有nil pointer ，建议把 *gorm 打印出来看看是不是传递的时候 指针就是空的
	// fmt.Println(db)
	return db.Debug().Exec(sql).Error
}
