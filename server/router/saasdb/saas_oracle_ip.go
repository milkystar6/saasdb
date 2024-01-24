package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type SaasOracleIpRouter struct {
}

// InitSaasOracleIpRouter 初始化 SaasOracleIp 路由信息
func (s *SaasOracleIpRouter) InitSaasOracleIpRouter(Router *gin.RouterGroup) {
	saas_oracle_ipRouter := Router.Group("saas_oracle_ip").Use(middleware.OperationRecord())
	saas_oracle_ipRouterWithoutRecord := Router.Group("saas_oracle_ip")
	var saas_oracle_ipApi = v1.ApiGroupApp.SaasdbApiGroup.SaasOracleIpApi
	{
		saas_oracle_ipRouter.POST("createSaasOracleIp", saas_oracle_ipApi.CreateSaasOracleIp)   // 新建SaasOracleIp
		saas_oracle_ipRouter.DELETE("deleteSaasOracleIp", saas_oracle_ipApi.DeleteSaasOracleIp) // 删除SaasOracleIp
		saas_oracle_ipRouter.DELETE("deleteSaasOracleIpByIds", saas_oracle_ipApi.DeleteSaasOracleIpByIds) // 批量删除SaasOracleIp
		saas_oracle_ipRouter.PUT("updateSaasOracleIp", saas_oracle_ipApi.UpdateSaasOracleIp)    // 更新SaasOracleIp
	}
	{
		saas_oracle_ipRouterWithoutRecord.GET("findSaasOracleIp", saas_oracle_ipApi.FindSaasOracleIp)        // 根据ID获取SaasOracleIp
		saas_oracle_ipRouterWithoutRecord.GET("getSaasOracleIpList", saas_oracle_ipApi.GetSaasOracleIpList)  // 获取SaasOracleIp列表
	}
}
