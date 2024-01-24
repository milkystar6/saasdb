package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type SaasOracleProjectUserRouter struct {
}

// InitSaasOracleProjectUserRouter 初始化 SaasOracleProjectUser 路由信息
func (s *SaasOracleProjectUserRouter) InitSaasOracleProjectUserRouter(Router *gin.RouterGroup) {
	saas_oracle_project_userRouter := Router.Group("saas_oracle_project_user").Use(middleware.OperationRecord())
	saas_oracle_project_userRouterWithoutRecord := Router.Group("saas_oracle_project_user")
	var saas_oracle_project_userApi = v1.ApiGroupApp.SaasdbApiGroup.SaasOracleProjectUserApi
	{
		saas_oracle_project_userRouter.POST("createSaasOracleProjectUser", saas_oracle_project_userApi.CreateSaasOracleProjectUser)   // 新建SaasOracleProjectUser
		saas_oracle_project_userRouter.DELETE("deleteSaasOracleProjectUser", saas_oracle_project_userApi.DeleteSaasOracleProjectUser) // 删除SaasOracleProjectUser
		saas_oracle_project_userRouter.DELETE("deleteSaasOracleProjectUserByIds", saas_oracle_project_userApi.DeleteSaasOracleProjectUserByIds) // 批量删除SaasOracleProjectUser
		saas_oracle_project_userRouter.PUT("updateSaasOracleProjectUser", saas_oracle_project_userApi.UpdateSaasOracleProjectUser)    // 更新SaasOracleProjectUser
	}
	{
		saas_oracle_project_userRouterWithoutRecord.GET("findSaasOracleProjectUser", saas_oracle_project_userApi.FindSaasOracleProjectUser)        // 根据ID获取SaasOracleProjectUser
		saas_oracle_project_userRouterWithoutRecord.GET("getSaasOracleProjectUserList", saas_oracle_project_userApi.GetSaasOracleProjectUserList)  // 获取SaasOracleProjectUser列表
	}
}
