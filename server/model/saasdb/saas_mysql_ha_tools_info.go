package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

const OrchestratorClusterInfoTableName = "saas_orch_cluster_info"

type OrchClusterInfo struct {
	global.GVA_MODEL
}

func (o *OrchClusterInfo) TableName() string {
	return OrchestratorClusterInfoTableName
}
