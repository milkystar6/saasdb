package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type HostRouter struct {
}

// InitHostRouter 初始化 Host 路由信息
func (s *HostRouter) InitHostRouter(Router *gin.RouterGroup) {
	hostRouter := Router.Group("host").Use(middleware.OperationRecord())
	hostRouterWithoutRecord := Router.Group("host")
	var hostApi = v1.ApiGroupApp.SaasdbApiGroup.HostApi
	{
		hostRouter.POST("createHost", hostApi.CreateHost)   // 新建Host
		hostRouter.DELETE("deleteHost", hostApi.DeleteHost) // 删除Host
		hostRouter.DELETE("deleteHostByIds", hostApi.DeleteHostByIds) // 批量删除Host
		hostRouter.PUT("updateHost", hostApi.UpdateHost)    // 更新Host
	}
	{
		hostRouterWithoutRecord.GET("findHost", hostApi.FindHost)        // 根据ID获取Host
		hostRouterWithoutRecord.GET("getHostList", hostApi.GetHostList)  // 获取Host列表
	}
}
