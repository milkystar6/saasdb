package taskclientroute

import (
	v1 "github.com/flipped-aurora/gin-vue-admin/server/api/v1"
	"github.com/flipped-aurora/gin-vue-admin/server/middleware"
	"github.com/gin-gonic/gin"
)

type HandleVariablesRouter struct{}

func (router *HandleVariablesRouter) InitHandleVariablesRouter(Router *gin.RouterGroup) {
	// show variables
	showVariablesWithoutRecord := Router.Group("variables").Use(middleware.OperationRecord())
	// show all variables
	showVariables := Router.Group("variables")
	// set variables
	setVariables := Router.Group("variables").Use(middleware.OperationRecord())
	var HandleVariablesApi = v1.ApiGroupApp.SaasdbApiGroup.VariablesTaskApi
	{
		showVariables.POST("get_variable_running_value", HandleVariablesApi.ShowVariables)
		// primary func
		setVariables.PUT("set_variables", HandleVariablesApi.SetVariable)
	}
	{ // primary func
		showVariablesWithoutRecord.GET("get_variable_running_value_fuzzy_matching", HandleVariablesApi.ShowVariablesFuzzyMatching)
	}
}
