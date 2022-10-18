package taskclientroute

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type SlowLogQueryRouter struct {
}

func (router SlowLogQueryRouter) InitSlowLogQueryRouter(Router *gin.RouterGroup) {
	getSlowLog := Router.Group("slow_log_query").Use(middleware.OperationRecord())
	var SlowLogQueryApi = v1.ApiGroupApp.SaasdbApiGroup.SlowLogTaskApi
	{
		getSlowLog.POST("get_slow_log_query", SlowLogQueryApi.GetSlowLog)
	}
}
