// 自动生成模板SaasOracleIpMapping
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
)

// SaasOracleIpMapping 结构体
type SaasOracleIpMapping struct {
      global.GVA_MODEL
      InstanceId  *int `json:"instanceId" form:"instanceId" gorm:"column:instance_id;comment:;"`
      IpId  *int `json:"ipId" form:"ipId" gorm:"column:ip_id;comment:;"`
}


// TableName SaasOracleIpMapping 表名
func (SaasOracleIpMapping) TableName() string {
  return "saas_oracle_ip_mapping"
}

