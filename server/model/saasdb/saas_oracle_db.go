// 自动生成模板SaasOracleDb
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// SaasOracleDb 结构体
type SaasOracleDb struct {
	global.GVA_MODEL
	DbId   *int   `json:"dbI_d" form:"dbI_d" gorm:"column:db_id;comment:;"`
	DbName string `json:"db_name" form:"db_name" gorm:"column:db_name;comment:;"`
	//ProjId  *int `json:"projId" form:"projId" gorm:"column:proj_id;comment:;"`
	Role     *int   `json:"role" form:"role" gorm:"column:role;comment:;"`
	IsRac    *int   `json:"isRac" form:"isRac" gorm:"column:is_rac;comment:;"`
	DomainId *int   `json:"domainId" form:"domainId" gorm:"column:domain_id;comment:;"`
	Dns      string `json:"dns" form:"dns" gorm:"column:dns;comment:;"`
}

// TableName SaasOracleDb 表名
func (SaasOracleDb) TableName() string {
	return "saas_oracle_db"
}
