package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type DomainRouter struct {
}

// InitDomainRouter 初始化 Domain 路由信息
func (s *DomainRouter) InitDomainRouter(Router *gin.RouterGroup) {
	domainRouter := Router.Group("domain").Use(middleware.OperationRecord())
	domainRouterWithoutRecord := Router.Group("domain")
	var domainApi = v1.ApiGroupApp.SaasdbApiGroup.DomainApi
	{
		domainRouter.POST("createDomain", domainApi.CreateDomain)   // 新建Domain
		domainRouter.DELETE("deleteDomain", domainApi.DeleteDomain) // 删除Domain
		domainRouter.DELETE("deleteDomainByIds", domainApi.DeleteDomainByIds) // 批量删除Domain
		domainRouter.PUT("updateDomain", domainApi.UpdateDomain)    // 更新Domain
	}
	{
		domainRouterWithoutRecord.GET("findDomain", domainApi.FindDomain)        // 根据ID获取Domain
		domainRouterWithoutRecord.GET("getDomainList", domainApi.GetDomainList)  // 获取Domain列表
	}
}
