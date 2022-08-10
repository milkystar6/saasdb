package saasdb

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type ProjectApi struct {
}

var prijectService = service.ServiceGroupApp.SaasdbServiceGroup.ProjectService

// CreateProject 创建Project
// @Tags Project
// @Summary 创建Project
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Project true "创建Project"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /priject/createProject [post]
func (prijectApi *ProjectApi) CreateProject(c *gin.Context) {
	var priject saasdb.Project
	_ = c.ShouldBindJSON(&priject)
	verify := utils.Rules{
		"ProjId":   {utils.NotEmpty()},
		"ProjName": {utils.NotEmpty()},
	}
	if err := utils.Verify(priject, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := prijectService.CreateProject(priject); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage(fmt.Sprintf("创建失败 %v", err.Error()), c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteProject 删除Project
// @Tags Project
// @Summary 删除Project
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Project true "删除Project"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /priject/deleteProject [delete]
func (prijectApi *ProjectApi) DeleteProject(c *gin.Context) {
	var priject saasdb.Project
	_ = c.ShouldBindJSON(&priject)
	if err := prijectService.DeleteProject(priject); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteProjectByIds 批量删除Project
// @Tags Project
// @Summary 批量删除Project
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Project"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /priject/deleteProjectByIds [delete]
func (prijectApi *ProjectApi) DeleteProjectByIds(c *gin.Context) {
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)
	if err := prijectService.DeleteProjectByIds(IDS); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateProject 更新Project
// @Tags Project
// @Summary 更新Project
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Project true "更新Project"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /priject/updateProject [put]
func (prijectApi *ProjectApi) UpdateProject(c *gin.Context) {
	var priject saasdb.Project
	_ = c.ShouldBindJSON(&priject)
	verify := utils.Rules{
		"ProjId":   {utils.NotEmpty()},
		"ProjName": {utils.NotEmpty()},
	}
	if err := utils.Verify(priject, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := prijectService.UpdateProject(priject); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindProject 用id查询Project
// @Tags Project
// @Summary 用id查询Project
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.Project true "用id查询Project"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /priject/findProject [get]
func (prijectApi *ProjectApi) FindProject(c *gin.Context) {
	var priject saasdb.Project
	_ = c.ShouldBindQuery(&priject)
	if repriject, err := prijectService.GetProject(priject.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"repriject": repriject}, c)
	}
}

// GetProjectList 分页获取Project列表
// @Tags Project
// @Summary 分页获取Project列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.ProjectSearch true "分页获取Project列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /priject/getProjectList [get]
func (prijectApi *ProjectApi) GetProjectList(c *gin.Context) {
	var pageInfo saasdbReq.ProjectSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := prijectService.GetProjectInfoList(pageInfo); err != nil {
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
