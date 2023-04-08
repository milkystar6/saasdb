package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

const OrchestratorClusterInfoTableName = "saas_orch_info"

type OrchClusterInfo struct {
	global.GVA_MODEL
	OrchClusterId        int    `json:"orch_cluster_id" form:"orch_cluster_id" gorm:"column:orch_cluster_id;comment:orch集群id"`
	OrchAddr             string `json:"orch_addr" form:"orch_addr" gorm:"column:orch_addr;comment:orch地址"`
	OrchPort             int    `json:"orch_port" form:"orch_port" gorm:"column:orch_port;comment:orch端口"`
	InternetDataCenterId int    `json:"internet_data_center_id" form:"internet_data_center_id" gorm:"column:internet_data_center_id;comment:idc数据中心id"`
}

func (o *OrchClusterInfo) TableName() string {
	return OrchestratorClusterInfoTableName
}

/* func 提供基本的CURD */

func (o *OrchClusterInfo) GetOrchClusterInfoList() {
	// todo
}
