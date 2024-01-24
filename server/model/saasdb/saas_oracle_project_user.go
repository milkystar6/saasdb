// 自动生成模板SaasOracleProjectUser
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// SaasOracleProjectUser 结构体
type SaasOracleProjectUser struct {
	global.GVA_MODEL
	UserName   string `json:"user_name" form:"user_name" gorm:"column:user_name;comment:;"`
	DbId       *int   `json:"db_id" form:"db_id" gorm:"column:db_id;type:bigint;default:null;comment:对应saas_oracle_db的domain_id;"`
	ProjId     *int   `json:"projId" form:"projId" gorm:"column:proj_id;comment:;"`
	UserID     *int   `json:"user_id" form:"user_id" gorm:"column:user_id;comment:;"`
	UserStatus *int   `json:"user_status" form:"user_status" gorm:"column:user_status;type:int;default:null;comment:0-offline,1-online"`
}

// TableName SaasOracleProjectUser 表名
func (SaasOracleProjectUser) TableName() string {
	return "saas_oracle_proj_user"
}
