package taskclientroute

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/gin-gonic/gin"
)

type ShowProcessListRouter struct {
}

func (s *ShowProcessListRouter) InitShowProcessListRouter(Router *gin.RouterGroup) {
	// 定义路由组
	//splRouter:=Router.Group("insshowprocesslist").Use(middleware.OperationRecord())
	splRouterWithoutRecord := Router.Group("insprocesslist")
	// TODO 这里可以集成session管理的功能
	var showprocesslistApi = v1.ApiGroupApp.SaasdbApiGroup.ShowProcessListTaskApi
	{
		splRouterWithoutRecord.GET("showinsprocesslist", showprocesslistApi.ShowProcesslist)
	}
}
