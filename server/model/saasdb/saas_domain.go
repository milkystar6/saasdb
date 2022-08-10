// 自动生成模板Domain
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Domain 结构体
type Domain struct {
	global.GVA_MODEL
	DomainId *int `json:"domainId" form:"domainId" gorm:"column:domain_id;comment:;uniqueIndex:domain_id;"`
	//InsId  *int `json:"insId" form:"insId" gorm:"column:ins_id;comment:;"`
	DomainName string `json:"domainName" form:"domainName" gorm:"column:domain_name;comment:;"`
	ProjId     *int   `json:"projId" form:"projId" gorm:"column:proj_id;comment:;"`
}

// TableName Domain 表名
func (Domain) TableName() string {
	return "saas_domain"
}
