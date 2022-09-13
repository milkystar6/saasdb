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

type InstanceApi struct {
}

var saas_instanceService = service.ServiceGroupApp.SaasdbServiceGroup.InstanceService

// CreateInstance 创建Instance
// @Tags Instance
// @Summary 创建Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Instance true "创建Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_instance/createInstance [post]
func (saas_instanceApi *InstanceApi) CreateInstance(c *gin.Context) {
	var saas_instance saasdb.Instance
	_ = c.ShouldBindJSON(&saas_instance)
	verify := utils.Rules{
		"InsId":       {utils.NotEmpty()},
		"Ip":          {utils.NotEmpty()},
		"Port":        {utils.NotEmpty()},
		"Application": {utils.NotEmpty()},
	}
	if err := utils.Verify(saas_instance, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := saas_instanceService.CreateInstance(saas_instance); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage(fmt.Sprintf("创建失败 %v", err.Error()), c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteInstance 删除Instance
// @Tags Instance
// @Summary 删除Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Instance true "删除Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_instance/deleteInstance [delete]
func (saas_instanceApi *InstanceApi) DeleteInstance(c *gin.Context) {
	var saas_instance saasdb.Instance
	_ = c.ShouldBindJSON(&saas_instance)
	if err := saas_instanceService.DeleteInstance(saas_instance); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteInstanceByIds 批量删除Instance
// @Tags Instance
// @Summary 批量删除Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /saas_instance/deleteInstanceByIds [delete]
func (saas_instanceApi *InstanceApi) DeleteInstanceByIds(c *gin.Context) {
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)
	if err := saas_instanceService.DeleteInstanceByIds(IDS); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateInstance 更新Instance
// @Tags Instance
// @Summary 更新Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Instance true "更新Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_instance/updateInstance [put]
func (saas_instanceApi *InstanceApi) UpdateInstance(c *gin.Context) {
	var saas_instance saasdb.Instance
	_ = c.ShouldBindJSON(&saas_instance)
	verify := utils.Rules{
		"ip":          {utils.NotEmpty()},
		"port":        {utils.NotEmpty()},
		"application": {utils.NotEmpty()},
	}
	if err := utils.Verify(saas_instance, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := saas_instanceService.UpdateInstance(saas_instance); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindInstance 用id查询Instance
// @Tags Instance
// @Summary 用id查询Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.Instance true "用id查询Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_instance/findInstance [get]
func (saas_instanceApi *InstanceApi) FindInstance(c *gin.Context) {
	var saas_instance saasdb.Instance
	_ = c.ShouldBindQuery(&saas_instance)
	if resaas_instance, err := saas_instanceService.GetInstance(saas_instance.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"resaas_instance": resaas_instance}, c)
	}
}

// GetInstanceList 分页获取Instance列表
// @Tags Instance
// @Summary 分页获取Instance列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.InstanceSearch true "分页获取Instance列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_instance/getInstanceList [get]
func (saas_instanceApi *InstanceApi) GetInstanceList(c *gin.Context) {
	var pageInfo saasdbReq.InstanceSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := saas_instanceService.GetInstanceInfoList(pageInfo); err != nil {
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

func (saas_instanceApi *InstanceApi) GetInstanceByDomainID(c *gin.Context) {
	var saas_instance saasdb.Instance
	_ = c.ShouldBindQuery(&saas_instance)
	verify := utils.Rules{
		"domainId": {utils.NotEmpty()},
	}
	if err := utils.Verify(saas_instance, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if list, total, err := saas_instanceService.GetInstanceInfoByDomainID(saas_instance.DomainId); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:  list,
			Total: total,
		}, "获取成功", c)
	}
}
