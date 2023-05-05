// 自动生成模板Cluster
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Cluster 结构体
type Cluster struct {
	global.GVA_MODEL
	DomainIds   string `json:"domain_ids" form:"domain_ids" gorm:"column:domain_ids;comment:各个domain ids;size:1000;"`
	ClusterName string `json:"cluste_name" form:"cluste_name" gorm:"column:cluster_name;comment:;"`
	ProjId      *int   `json:"proj_id" form:"proj_id" gorm:"column:proj_id;comment:;"`
}

// TableName Cluster 表名
func (Cluster) TableName() string {
	return "saas_cluster"
}
