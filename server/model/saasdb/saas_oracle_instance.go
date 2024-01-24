// 自动生成模板SaasOracleInstance
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
)

// SaasOracleInstance 结构体
type SaasOracleInstance struct {
      global.GVA_MODEL
      InstanceId  *int `json:"instanceId" form:"instanceId" gorm:"column:instance_id;comment:;"`
      DbId  *int `json:"dbId" form:"dbId" gorm:"column:db_id;comment:;"`
      Sid  string `json:"sid" form:"sid" gorm:"column:sid;comment:;"`
      HostId  *int `json:"hostId" form:"hostId" gorm:"column:host_id;comment:;"`
      Version  string `json:"version" form:"version" gorm:"column:version;comment:;"`
      Status  *int `json:"status" form:"status" gorm:"column:status;comment:;"`
      Url  string `json:"url" form:"url" gorm:"column:url;comment:;"`
}


// TableName SaasOracleInstance 表名
func (SaasOracleInstance) TableName() string {
  return "saas_oracle_instance"
}

