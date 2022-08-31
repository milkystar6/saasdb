package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type OggInfoRouter struct {
}

// InitOggInfoRouter 初始化 OggInfo 路由信息
func (s *OggInfoRouter) InitOggInfoRouter(Router *gin.RouterGroup) {
	oggInfoRouter := Router.Group("oggInfo").Use(middleware.OperationRecord())
	oggInfoRouterWithoutRecord := Router.Group("oggInfo")
	var oggInfoApi = v1.ApiGroupApp.SaasdbApiGroup.OggInfoApi
	{
		oggInfoRouter.POST("createOggInfo", oggInfoApi.CreateOggInfo)   // 新建OggInfo
		oggInfoRouter.DELETE("deleteOggInfo", oggInfoApi.DeleteOggInfo) // 删除OggInfo
		oggInfoRouter.DELETE("deleteOggInfoByIds", oggInfoApi.DeleteOggInfoByIds) // 批量删除OggInfo
		oggInfoRouter.PUT("updateOggInfo", oggInfoApi.UpdateOggInfo)    // 更新OggInfo
	}
	{
		oggInfoRouterWithoutRecord.GET("findOggInfo", oggInfoApi.FindOggInfo)        // 根据ID获取OggInfo
		oggInfoRouterWithoutRecord.GET("getOggInfoList", oggInfoApi.GetOggInfoList)  // 获取OggInfo列表
	}
}
