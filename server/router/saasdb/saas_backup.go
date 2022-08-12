package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type BackLogRouter struct {
}

// InitBackLogRouter 初始化 BackLog 路由信息
func (s *BackLogRouter) InitBackLogRouter(Router *gin.RouterGroup) {
	BackupLogRouter := Router.Group("BackupLog").Use(middleware.OperationRecord())
	BackupLogRouterWithoutRecord := Router.Group("BackupLog")
	var BackupLogApi = v1.ApiGroupApp.SaasdbApiGroup.BackLogApi
	{
		BackupLogRouter.POST("createBackLog", BackupLogApi.CreateBackLog)   // 新建BackLog
		BackupLogRouter.DELETE("deleteBackLog", BackupLogApi.DeleteBackLog) // 删除BackLog
		BackupLogRouter.DELETE("deleteBackLogByIds", BackupLogApi.DeleteBackLogByIds) // 批量删除BackLog
		BackupLogRouter.PUT("updateBackLog", BackupLogApi.UpdateBackLog)    // 更新BackLog
	}
	{
		BackupLogRouterWithoutRecord.GET("findBackLog", BackupLogApi.FindBackLog)        // 根据ID获取BackLog
		BackupLogRouterWithoutRecord.GET("getBackLogList", BackupLogApi.GetBackLogList)  // 获取BackLog列表
	}
}
