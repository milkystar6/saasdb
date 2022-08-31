package taskclient

import (
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
)

type VariablesTaskApi struct {
}

var HandleVariablesService = service.ServiceGroupApp.SaasdbServiceGroup.VariablesTaskClientService

func (api *VariablesTaskApi) ShowVariables(c *gin.Context) {

}
func (api *VariablesTaskApi) SetVariable(c *gin.Context) {
}
func (api *VariablesTaskApi) ShowVariablesFuzzyMatching(c *gin.Context) {
	var search request.ReqVariables
	_ = c.ShouldBindJSON(&search)
	verify := utils.Rules{
		"vm":             {utils.NotEmpty()},
		"vm_mysql_host":  {utils.NotEmpty()},
		"vm_mysql_port1": {utils.NotEmpty()},
		//"variable_slice":{utils.NotEmpty()}, 可以为空
	}
	if err := utils.Verify(search, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	req := request.ReqVariables{
		Vm:             search.Vm,
		VmMySQLHost:    search.VmMySQLHost,
		VmMySQLPort:    search.VmMySQLPort,
		VariablesSlice: search.VariablesSlice,
	}
	if variables, err := HandleVariablesService.ShowVariablesEntry(req); err != nil {
		response.FailWithMessage(err.Error(), c)
	} else {
		varshow := request.DecodeVariablesJson{}
		if err = json.Unmarshal(variables, &varshow); err != nil {
			response.FailWithMessage(fmt.Sprintf("unmarshal data to json failed ,err: %v", err), c)
		}
		response.OkWithData(gin.H{
			"variables_value": varshow.VariableName,
		}, c)
	}
}
