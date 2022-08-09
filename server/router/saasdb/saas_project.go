package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type ProjectRouter struct {
}

// InitProjectRouter 初始化 Project 路由信息
func (s *ProjectRouter) InitProjectRouter(Router *gin.RouterGroup) {
	prijectRouter := Router.Group("priject").Use(middleware.OperationRecord())
	prijectRouterWithoutRecord := Router.Group("priject")
	var prijectApi = v1.ApiGroupApp.SaasdbApiGroup.ProjectApi
	{
		prijectRouter.POST("createProject", prijectApi.CreateProject)   // 新建Project
		prijectRouter.DELETE("deleteProject", prijectApi.DeleteProject) // 删除Project
		prijectRouter.DELETE("deleteProjectByIds", prijectApi.DeleteProjectByIds) // 批量删除Project
		prijectRouter.PUT("updateProject", prijectApi.UpdateProject)    // 更新Project
	}
	{
		prijectRouterWithoutRecord.GET("findProject", prijectApi.FindProject)        // 根据ID获取Project
		prijectRouterWithoutRecord.GET("getProjectList", prijectApi.GetProjectList)  // 获取Project列表
	}
}
