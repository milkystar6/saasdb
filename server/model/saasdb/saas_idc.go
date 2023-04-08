package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

const IdcTableName = "saas_idc_info"

type IdcInfo struct {
	global.GVA_MODEL
	InternetDataCenter string `json:"internet_data_center" form:"internet_data_center" gorm:"column:internet_data_center;type:enum('qingdao','huangdao');comment:idc数据中心"`
}

func (o *IdcInfo) TableName() string {
	return IdcTableName
}
