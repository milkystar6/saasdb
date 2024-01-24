package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type SaasDictumRouter struct {
}

// InitSaasDictumRouter 初始化 SaasDictum 路由信息
func (s *SaasDictumRouter) InitSaasDictumRouter(Router *gin.RouterGroup) {
	saas_dictumRouter := Router.Group("saas_dictum").Use(middleware.OperationRecord())
	saas_dictumRouterWithoutRecord := Router.Group("saas_dictum")
	var saas_dictumApi = v1.ApiGroupApp.SaasdbApiGroup.SaasDictumApi
	{
		saas_dictumRouter.POST("createSaasDictum", saas_dictumApi.CreateSaasDictum)             // 新建SaasDictum
		saas_dictumRouter.DELETE("deleteSaasDictum", saas_dictumApi.DeleteSaasDictum)           // 删除SaasDictum
		saas_dictumRouter.DELETE("deleteSaasDictumByIds", saas_dictumApi.DeleteSaasDictumByIds) // 批量删除SaasDictum
		saas_dictumRouter.PUT("updateSaasDictum", saas_dictumApi.UpdateSaasDictum)              // 更新SaasDictum
	}
	{
		saas_dictumRouterWithoutRecord.GET("findSaasDictum", saas_dictumApi.FindSaasDictum)       // 根据ID获取SaasDictum
		saas_dictumRouterWithoutRecord.GET("getSaasDictumList", saas_dictumApi.GetSaasDictumList) // 获取SaasDictum列表
	}
}
