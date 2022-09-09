package taskclient

import (
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"strconv"
)

type ProcessTaskApi struct {
}

var ShowPorcessListService = service.ServiceGroupApp.SaasdbServiceGroup.ProcessTaskClientService

// 查询MySQL的会话列表
func (server *ProcessTaskApi) ShowProcesslist(c *gin.Context) {
	// search info Model里声明一个查询结构体
	var search request.SearchProcessList
	_ = c.ShouldBindJSON(&search)
	verify := utils.Rules{
		"vm":          {utils.NotEmpty()},
		"vm_mysql_host": {utils.NotEmpty()},
		"vm_mysql_port": {utils.NotEmpty()},
	}
	if err := utils.Verify(search, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	port,_:=strconv.Atoi(search.VmMySQLPort)

	if processlist, err := ShowPorcessListService.ShowProcessList(search.Vm, search.VmMySQLHost,port ); err != nil {
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
func (server *ProcessTaskApi) ManageProcesslist(c *gin.Context) {
	var theworker request.StopProcessById
	_ = c.ShouldBind(&theworker)
	verify := utils.Rules{
		"vm":            {utils.NotEmpty()},
		"vm_mysql_host": {utils.NotEmpty()},
		"vm_mysql_port": {utils.NotEmpty()},
		"ID":            {utils.NotEmpty()},
	}
	if err := utils.Verify(theworker, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	//port, _ := strconv.Atoi(theworker.VmMySQLPort)
	//err := ProcessManagerService.StopProcessById(theworker.Vm, theworker.VmMySQLHost, port, theworker.ID)
	err := ShowPorcessListService.StopProcessById("127.0.0.1", "127.0.0.1", 3307, theworker.ID)
	if err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	} else {
		response.OkWithMessage("STOP SESSION SCUCCESS", c)
	}

}
