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
)

type SaasDictumApi struct {
}

var saas_dictumService = service.ServiceGroupApp.SaasdbServiceGroup.SaasDictumService


// CreateSaasDictum 创建SaasDictum
// @Tags SaasDictum
// @Summary 创建SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasDictum true "创建SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_dictum/createSaasDictum [post]
func (saas_dictumApi *SaasDictumApi) CreateSaasDictum(c *gin.Context) {
	var saas_dictum saasdb.SaasDictum
	_ = c.ShouldBindJSON(&saas_dictum)
	if err := saas_dictumService.CreateSaasDictum(saas_dictum); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteSaasDictum 删除SaasDictum
// @Tags SaasDictum
// @Summary 删除SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasDictum true "删除SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_dictum/deleteSaasDictum [delete]
func (saas_dictumApi *SaasDictumApi) DeleteSaasDictum(c *gin.Context) {
	var saas_dictum saasdb.SaasDictum
	_ = c.ShouldBindJSON(&saas_dictum)
	if err := saas_dictumService.DeleteSaasDictum(saas_dictum); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteSaasDictumByIds 批量删除SaasDictum
// @Tags SaasDictum
// @Summary 批量删除SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /saas_dictum/deleteSaasDictumByIds [delete]
func (saas_dictumApi *SaasDictumApi) DeleteSaasDictumByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := saas_dictumService.DeleteSaasDictumByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateSaasDictum 更新SaasDictum
// @Tags SaasDictum
// @Summary 更新SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasDictum true "更新SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_dictum/updateSaasDictum [put]
func (saas_dictumApi *SaasDictumApi) UpdateSaasDictum(c *gin.Context) {
	var saas_dictum saasdb.SaasDictum
	_ = c.ShouldBindJSON(&saas_dictum)
	if err := saas_dictumService.UpdateSaasDictum(saas_dictum); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindSaasDictum 用id查询SaasDictum
// @Tags SaasDictum
// @Summary 用id查询SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.SaasDictum true "用id查询SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_dictum/findSaasDictum [get]
func (saas_dictumApi *SaasDictumApi) FindSaasDictum(c *gin.Context) {
	var saas_dictum saasdb.SaasDictum
	_ = c.ShouldBindQuery(&saas_dictum)
	if resaas_dictum, err := saas_dictumService.GetSaasDictum(saas_dictum.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"resaas_dictum": resaas_dictum}, c)
	}
}

// GetSaasDictumList 分页获取SaasDictum列表
// @Tags SaasDictum
// @Summary 分页获取SaasDictum列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.SaasDictumSearch true "分页获取SaasDictum列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_dictum/getSaasDictumList [get]
func (saas_dictumApi *SaasDictumApi) GetSaasDictumList(c *gin.Context) {
	var pageInfo saasdbReq.SaasDictumSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := saas_dictumService.GetSaasDictumInfoList(pageInfo); err != nil {
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
