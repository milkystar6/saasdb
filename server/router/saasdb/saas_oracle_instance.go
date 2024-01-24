package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type SaasOracleInstanceRouter struct {
}

// InitSaasOracleInstanceRouter 初始化 SaasOracleInstance 路由信息
func (s *SaasOracleInstanceRouter) InitSaasOracleInstanceRouter(Router *gin.RouterGroup) {
	saas_oracle_instanceRouter := Router.Group("saas_oracle_instance").Use(middleware.OperationRecord())
	saas_oracle_instanceRouterWithoutRecord := Router.Group("saas_oracle_instance")
	var saas_oracle_instanceApi = v1.ApiGroupApp.SaasdbApiGroup.SaasOracleInstanceApi
	{
		saas_oracle_instanceRouter.POST("createSaasOracleInstance", saas_oracle_instanceApi.CreateSaasOracleInstance)   // 新建SaasOracleInstance
		saas_oracle_instanceRouter.DELETE("deleteSaasOracleInstance", saas_oracle_instanceApi.DeleteSaasOracleInstance) // 删除SaasOracleInstance
		saas_oracle_instanceRouter.DELETE("deleteSaasOracleInstanceByIds", saas_oracle_instanceApi.DeleteSaasOracleInstanceByIds) // 批量删除SaasOracleInstance
		saas_oracle_instanceRouter.PUT("updateSaasOracleInstance", saas_oracle_instanceApi.UpdateSaasOracleInstance)    // 更新SaasOracleInstance
	}
	{
		saas_oracle_instanceRouterWithoutRecord.GET("findSaasOracleInstance", saas_oracle_instanceApi.FindSaasOracleInstance)        // 根据ID获取SaasOracleInstance
		saas_oracle_instanceRouterWithoutRecord.GET("getSaasOracleInstanceList", saas_oracle_instanceApi.GetSaasOracleInstanceList)  // 获取SaasOracleInstance列表
	}
}
