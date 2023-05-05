package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type ClusterService struct {
}

// CreateCluster 创建Cluster记录
// Author [piexlmax](https://github.com/piexlmax)
func (clusterService *ClusterService) CreateCluster(cluster saasdb.Cluster) (err error) {
	err = global.GVA_DB.Create(&cluster).Error
	return err
}

// DeleteCluster 删除Cluster记录
// Author [piexlmax](https://github.com/piexlmax)
func (clusterService *ClusterService) DeleteCluster(cluster saasdb.Cluster) (err error) {
	err = global.GVA_DB.Delete(&cluster).Error
	return err
}

// DeleteClusterByIds 批量删除Cluster记录
// Author [piexlmax](https://github.com/piexlmax)
func (clusterService *ClusterService) DeleteClusterByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.Cluster{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateCluster 更新Cluster记录
// Author [piexlmax](https://github.com/piexlmax)
func (clusterService *ClusterService) UpdateCluster(cluster saasdb.Cluster) (err error) {
	err = global.GVA_DB.Save(&cluster).Error
	return err
}

// GetCluster 根据id获取Cluster记录
// Author [piexlmax](https://github.com/piexlmax)
func (clusterService *ClusterService) GetCluster(id uint) (cluster saasdb.Cluster, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&cluster).Error
	return
}

// GetClusterInfoList 分页获取Cluster记录
// Author [piexlmax](https://github.com/piexlmax)
func (clusterService *ClusterService) GetClusterInfoList(info saasdbReq.ClusterSearch) (list []saasdb.Cluster, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&saasdb.Cluster{})
	var clusters []saasdb.Cluster
	// 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&clusters).Error
	return clusters, total, err
}
