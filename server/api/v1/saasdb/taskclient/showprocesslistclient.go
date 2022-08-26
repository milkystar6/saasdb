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

type ShowProcessListTaskApi struct {
}

var ShowPorcessListService = service.ServiceGroupApp.SaasdbServiceGroup.ShowProcessListTaskClientService

// 查询MySQL的会话列表
func (server *ShowProcessListTaskApi) ShowProcesslist(c *gin.Context) {
	// search info Model里声明一个查询结构体
	var search request.SearchProcessList
	_ = c.ShouldBindJSON(&search)
	verify := utils.Rules{
		//"Vm":          {utils.NotEmpty()},
		//"VmMySQLHost": {utils.NotEmpty()},
		//"VmMySQLPort": {utils.NotEmpty()},
	}
	if err := utils.Verify(search, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if processlist, err := ShowPorcessListService.ShowProcessList(search.Vm, search.VmMySQLHost, search.VmMySQLPort); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	} else {

		spl := request.DecodeProcessListJSON{}
		if err = json.Unmarshal(processlist, &spl); err != nil {
			response.FailWithMessage(fmt.Sprintf("unmarshal data to json failed ,err: %v", err), c)
		}
		response.OkWithData(gin.H{
			"processlist": spl,
		}, c)
	}
}

// session 管理
func (server *ShowProcessListTaskApi) ManageProcesslist(c *gin.Context) {}
