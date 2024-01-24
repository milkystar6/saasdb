package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type SaasOracleDbRouter struct {
}

// InitSaasOracleDbRouter 初始化 SaasOracleDb 路由信息
func (s *SaasOracleDbRouter) InitSaasOracleDbRouter(Router *gin.RouterGroup) {
	saas_oracle_dbRouter := Router.Group("saas_oracle_db").Use(middleware.OperationRecord())
	saas_oracle_dbRouterWithoutRecord := Router.Group("saas_oracle_db")
	var saas_oracle_dbApi = v1.ApiGroupApp.SaasdbApiGroup.SaasOracleDbApi
	{
		saas_oracle_dbRouter.POST("createSaasOracleDb", saas_oracle_dbApi.CreateSaasOracleDb)   // 新建SaasOracleDb
		saas_oracle_dbRouter.DELETE("deleteSaasOracleDb", saas_oracle_dbApi.DeleteSaasOracleDb) // 删除SaasOracleDb
		saas_oracle_dbRouter.DELETE("deleteSaasOracleDbByIds", saas_oracle_dbApi.DeleteSaasOracleDbByIds) // 批量删除SaasOracleDb
		saas_oracle_dbRouter.PUT("updateSaasOracleDb", saas_oracle_dbApi.UpdateSaasOracleDb)    // 更新SaasOracleDb
	}
	{
		saas_oracle_dbRouterWithoutRecord.GET("findSaasOracleDb", saas_oracle_dbApi.FindSaasOracleDb)        // 根据ID获取SaasOracleDb
		saas_oracle_dbRouterWithoutRecord.GET("getSaasOracleDbList", saas_oracle_dbApi.GetSaasOracleDbList)  // 获取SaasOracleDb列表
	}
}
