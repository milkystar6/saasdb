// 自动生成模板Domain
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Domain 结构体
type Domain struct {
	global.GVA_MODEL
	DomainName           string `json:"domainName" form:"domainName" gorm:"column:domain_name;comment:;"`
	ProjId               *int   `json:"projId" form:"projId" gorm:"column:proj_id;comment:;"`
	Vip                  string `json:"vip" form:"vip" gorm:"column:vip;comment:数据库连接vip;"`
	Dns                  string `json:"dns" form:"dns" gorm:"column:dns;comment:数据库连接dns;"`
	InternetDataCenterId int    `json:"internet_data_center_id" form:"internet_data_center_id" gorm:"column:internet_data_center_id;comment:idc数据中心id"`
	IsPrimary            bool   `json:"is_primary" form:"is_primary" gorm:"is_primary"`
}

// TableName Domain 表名
func (Domain) TableName() string {
	return "saas_domain"
}
