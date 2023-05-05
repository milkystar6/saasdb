package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type ClusterRouter struct {
}

// InitClusterRouter 初始化 Cluster 路由信息
func (s *ClusterRouter) InitClusterRouter(Router *gin.RouterGroup) {
	clusterRouter := Router.Group("cluster").Use(middleware.OperationRecord())
	clusterRouterWithoutRecord := Router.Group("cluster")
	var clusterApi = v1.ApiGroupApp.SaasdbApiGroup.ClusterApi
	{
		clusterRouter.POST("createCluster", clusterApi.CreateCluster)   // 新建Cluster
		clusterRouter.DELETE("deleteCluster", clusterApi.DeleteCluster) // 删除Cluster
		clusterRouter.DELETE("deleteClusterByIds", clusterApi.DeleteClusterByIds) // 批量删除Cluster
		clusterRouter.PUT("updateCluster", clusterApi.UpdateCluster)    // 更新Cluster
	}
	{
		clusterRouterWithoutRecord.GET("findCluster", clusterApi.FindCluster)        // 根据ID获取Cluster
		clusterRouterWithoutRecord.GET("getClusterList", clusterApi.GetClusterList)  // 获取Cluster列表
	}
}
