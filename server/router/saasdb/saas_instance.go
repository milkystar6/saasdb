package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type InstanceRouter struct {
}

// InitInstanceRouter 初始化 Instance 路由信息
func (s *InstanceRouter) InitInstanceRouter(Router *gin.RouterGroup) {
	saas_instanceRouter := Router.Group("saas_instance").Use(middleware.OperationRecord())
	saas_instanceRouterWithoutRecord := Router.Group("saas_instance")
	var saas_instanceApi = v1.ApiGroupApp.SaasdbApiGroup.InstanceApi
	{
		saas_instanceRouter.POST("createInstance", saas_instanceApi.CreateInstance)   // 新建Instance
		saas_instanceRouter.DELETE("deleteInstance", saas_instanceApi.DeleteInstance) // 删除Instance
		saas_instanceRouter.DELETE("deleteInstanceByIds", saas_instanceApi.DeleteInstanceByIds) // 批量删除Instance
		saas_instanceRouter.PUT("updateInstance", saas_instanceApi.UpdateInstance)    // 更新Instance
	}
	{
		saas_instanceRouterWithoutRecord.GET("findInstance", saas_instanceApi.FindInstance)        // 根据ID获取Instance
		saas_instanceRouterWithoutRecord.GET("getInstanceList", saas_instanceApi.GetInstanceList)  // 获取Instance列表
	}
}
