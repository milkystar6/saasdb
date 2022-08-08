// 自动生成模板Instance
package saasdb

import (
	"database/sql/driver"
	"encoding/json"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Instance 结构体
type Instance struct {
	global.GVA_MODEL
	InsId       *int     `json:"insId" form:"insId" gorm:"column:ins_id;comment:insId;index"`
	HostId      *int     `json:"hostId" form:"hostId" gorm:"column:host_id;comment:hostId;"`
	ProjId      *int     `json:"projId" form:"projId" gorm:"column:proj_id;comment:项目id;"`
	Ip          string   `json:"ip" form:"ip" gorm:"column:ip;comment:ip;"`
	Port        *int     `json:"port" form:"port" gorm:"column:port;comment:port;"`
	Application string   `json:"application" form:"application" gorm:"column:application;type:enum('oracle','mysql','redis','mongodb','tidb');comment:application应用类型;"`
	Version     string   `json:"version" form:"version" gorm:"column:version;comment:;"`
	UseType     string   `json:"useType" form:"useType" gorm:"column:use_type;type:enum('正式','线上测试','预发布');comment:;"`
	Health      string   `json:"health" form:"health" gorm:"column:health;type:enum('available','unavailable','restarting','starting','stoping','migrating');comment:;"`
	Level       string   `json:"level" form:"level" gorm:"column:level;type:enum('1','2','3','4');comment:;"`
	role        string   `json:"role" form:"role" gorm:"column:role;type:enum('master','slaveforha','slaveonly');comment:数据库实例在集群中的角色，master节点只能有一个;"`
	Feature     *Feature `json:"feature" gorm:"TYPE:json"`
	Auth        *Auth    `json:"auth" gorm:"TYPE:json"`
}

// TableName Instance 表名
func (Instance) TableName() string {
	return "saas_instance"
}

type Feature struct {
	Ip   string `json:"ip"`
	Port int    `json:"port"`
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
