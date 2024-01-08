package dboverview

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/gin-gonic/gin"
)

type DBOverViewRouter struct {
}

func (receiver *DBOverViewRouter) InitDBOverViewRouter(Router *gin.RouterGroup) {
	//dbOverViewRouter := Router.Group("dboverview").Use(middleware.OperationRecord())
	dbOverViewRouterWithoutRecord := Router.Group("dboverview")
	var dbOverViewRouterApi = v1.ApiGroupApp.SaasdbApiGroup.DBOverViewApi
	{
		//用于dbOverViewRouter接口
	}
	{
		dbOverViewRouterWithoutRecord.GET("dboverview", dbOverViewRouterApi.GetDBOverViewA)
	}
}
