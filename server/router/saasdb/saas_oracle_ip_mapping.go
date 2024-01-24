package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type SaasOracleIpMappingRouter struct {
}

// InitSaasOracleIpMappingRouter 初始化 SaasOracleIpMapping 路由信息
func (s *SaasOracleIpMappingRouter) InitSaasOracleIpMappingRouter(Router *gin.RouterGroup) {
	saas_oracle_ip_mappingRouter := Router.Group("saas_oracle_ip_mapping").Use(middleware.OperationRecord())
	saas_oracle_ip_mappingRouterWithoutRecord := Router.Group("saas_oracle_ip_mapping")
	var saas_oracle_ip_mappingApi = v1.ApiGroupApp.SaasdbApiGroup.SaasOracleIpMappingApi
	{
		saas_oracle_ip_mappingRouter.POST("createSaasOracleIpMapping", saas_oracle_ip_mappingApi.CreateSaasOracleIpMapping)   // 新建SaasOracleIpMapping
		saas_oracle_ip_mappingRouter.DELETE("deleteSaasOracleIpMapping", saas_oracle_ip_mappingApi.DeleteSaasOracleIpMapping) // 删除SaasOracleIpMapping
		saas_oracle_ip_mappingRouter.DELETE("deleteSaasOracleIpMappingByIds", saas_oracle_ip_mappingApi.DeleteSaasOracleIpMappingByIds) // 批量删除SaasOracleIpMapping
		saas_oracle_ip_mappingRouter.PUT("updateSaasOracleIpMapping", saas_oracle_ip_mappingApi.UpdateSaasOracleIpMapping)    // 更新SaasOracleIpMapping
	}
	{
		saas_oracle_ip_mappingRouterWithoutRecord.GET("findSaasOracleIpMapping", saas_oracle_ip_mappingApi.FindSaasOracleIpMapping)        // 根据ID获取SaasOracleIpMapping
		saas_oracle_ip_mappingRouterWithoutRecord.GET("getSaasOracleIpMappingList", saas_oracle_ip_mappingApi.GetSaasOracleIpMappingList)  // 获取SaasOracleIpMapping列表
	}
}
