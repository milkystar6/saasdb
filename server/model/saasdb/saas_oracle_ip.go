// 自动生成模板SaasOracleIp
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
)

// SaasOracleIp 结构体
type SaasOracleIp struct {
      global.GVA_MODEL
      IpId  *int `json:"ipId" form:"ipId" gorm:"column:ip_id;comment:;"`
      IpAddr  string `json:"ipAddr" form:"ipAddr" gorm:"column:IpAddr;comment:;"`
      IpType  *int `json:"ipType" form:"ipType" gorm:"column:ip_type;comment:;"`
}


// TableName SaasOracleIp 表名
func (SaasOracleIp) TableName() string {
  return "saas_oracle_ip"
}

