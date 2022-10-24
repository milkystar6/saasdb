package taskclient

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
)

type SlowLogTaskApi struct {
}

var SlowLogQueryService = service.ServiceGroupApp.SaasdbServiceGroup.SlowLogTaskClientService

// GetSlowLog Get slow log
// ls : log slow
func (ls *SlowLogTaskApi) GetSlowLog(c *gin.Context) {
	var search request.GetSlowLogSearch
	_ = c.ShouldBindJSON(&search)
	verify := utils.Rules{
		"vm":            {utils.NotEmpty()},
		"vm_mysql_host": {utils.NotEmpty()},
		"vm_mysql_port": {utils.NotEmpty()},
	}
	if err := utils.Verify(search, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}

	req := request.GetSlowLogSearch{
		Vm:          search.Vm,
		VmMySQLHost: search.VmMySQLHost,
		VmMySQLPort: search.VmMySQLPort,
		StartTime:   search.StartTime,
		EndTime:     search.EndTime,
	}
	SlowLogInfo, err := SlowLogQueryService.GetSlowLogEntry(req)
	if err!=nil{
		response.FailWithMessage(fmt.Sprintf("创建失败 error: %v",err), c)
	}else {
		msg:=string(SlowLogInfo)
		response.OkWithMessage(msg,c)
	}


}
