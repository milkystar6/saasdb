package taskclientroute

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type ShowProcessListRouter struct {
}

func (s *ShowProcessListRouter) InitShowProcessListRouter(Router *gin.RouterGroup) {
	// 定义路由组
	splRouter := Router.Group("insprocesslist").Use(middleware.OperationRecord())
	splRouterWithoutRecord := Router.Group("insprocesslist")
	// TODO 这里可以集成session管理的功能
	var processManagerApi = v1.ApiGroupApp.SaasdbApiGroup.ProcessTaskApi
	{
		splRouterWithoutRecord.POST("showinsprocesslist", processManagerApi.ShowProcesslist)
	}
	{
		splRouter.PUT("StopInsProcesslistById", processManagerApi.ManageProcesslist)
	}
}
