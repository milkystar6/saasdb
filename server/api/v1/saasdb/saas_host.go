package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
    "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
    "github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
    "github.com/flipped-aurora/gin-vue-admin/server/service"
    "github.com/gin-gonic/gin"
    "go.uber.org/zap"
    "github.com/flipped-aurora/gin-vue-admin/server/utils"
)

type HostApi struct {
}

var hostService = service.ServiceGroupApp.SaasdbServiceGroup.HostService


// CreateHost 创建Host
// @Tags Host
// @Summary 创建Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Host true "创建Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /host/createHost [post]
func (hostApi *HostApi) CreateHost(c *gin.Context) {
	var host saasdb.Host
	_ = c.ShouldBindJSON(&host)
    verify := utils.Rules{
        "Hostname":{utils.NotEmpty()},
        "Ip":{utils.NotEmpty()},
    }
	if err := utils.Verify(host, verify); err != nil {
    		response.FailWithMessage(err.Error(), c)
    		return
    	}
	if err := hostService.CreateHost(host); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteHost 删除Host
// @Tags Host
// @Summary 删除Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Host true "删除Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /host/deleteHost [delete]
func (hostApi *HostApi) DeleteHost(c *gin.Context) {
	var host saasdb.Host
	_ = c.ShouldBindJSON(&host)
	if err := hostService.DeleteHost(host); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteHostByIds 批量删除Host
// @Tags Host
// @Summary 批量删除Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /host/deleteHostByIds [delete]
func (hostApi *HostApi) DeleteHostByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := hostService.DeleteHostByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateHost 更新Host
// @Tags Host
// @Summary 更新Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Host true "更新Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /host/updateHost [put]
func (hostApi *HostApi) UpdateHost(c *gin.Context) {
	var host saasdb.Host
	_ = c.ShouldBindJSON(&host)
      verify := utils.Rules{
          "Hostname":{utils.NotEmpty()},
          "Ip":{utils.NotEmpty()},
      }
    if err := utils.Verify(host, verify); err != nil {
      	response.FailWithMessage(err.Error(), c)
      	return
     }
	if err := hostService.UpdateHost(host); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindHost 用id查询Host
// @Tags Host
// @Summary 用id查询Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.Host true "用id查询Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /host/findHost [get]
func (hostApi *HostApi) FindHost(c *gin.Context) {
	var host saasdb.Host
	_ = c.ShouldBindQuery(&host)
	if rehost, err := hostService.GetHost(host.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"rehost": rehost}, c)
	}
}

// GetHostList 分页获取Host列表
// @Tags Host
// @Summary 分页获取Host列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.HostSearch true "分页获取Host列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /host/getHostList [get]
func (hostApi *HostApi) GetHostList(c *gin.Context) {
	var pageInfo saasdbReq.HostSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := hostService.GetHostInfoList(pageInfo); err != nil {
	    global.GVA_LOG.Error("获取失败!", zap.Error(err))
        response.FailWithMessage("获取失败", c)
    } else {
        response.OkWithDetailed(response.PageResult{
            List:     list,
            Total:    total,
            Page:     pageInfo.Page,
            PageSize: pageInfo.PageSize,
        }, "获取成功", c)
    }
}
