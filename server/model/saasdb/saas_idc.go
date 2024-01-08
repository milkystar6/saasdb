package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

const IdcTableName = "saas_idc_info"

type IdcInfo struct {
	global.GVA_MODEL
	IdcName string `json:"idc_name" form:"idc_name" gorm:"column:idc_name;type:varchar(20);comment:idc数据中心"`
}

func (o *IdcInfo) TableName() string {
	return IdcTableName
}
