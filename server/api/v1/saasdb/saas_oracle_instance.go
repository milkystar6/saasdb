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

type SaasOracleInstanceApi struct {
}

var saas_oracle_instanceService = service.ServiceGroupApp.SaasdbServiceGroup.SaasOracleInstanceService


// CreateSaasOracleInstance 创建SaasOracleInstance
// @Tags SaasOracleInstance
// @Summary 创建SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleInstance true "创建SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_instance/createSaasOracleInstance [post]
func (saas_oracle_instanceApi *SaasOracleInstanceApi) CreateSaasOracleInstance(c *gin.Context) {
	var saas_oracle_instance saasdb.SaasOracleInstance
	_ = c.ShouldBindJSON(&saas_oracle_instance)
	if err := saas_oracle_instanceService.CreateSaasOracleInstance(saas_oracle_instance); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteSaasOracleInstance 删除SaasOracleInstance
// @Tags SaasOracleInstance
// @Summary 删除SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleInstance true "删除SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_instance/deleteSaasOracleInstance [delete]
func (saas_oracle_instanceApi *SaasOracleInstanceApi) DeleteSaasOracleInstance(c *gin.Context) {
	var saas_oracle_instance saasdb.SaasOracleInstance
	_ = c.ShouldBindJSON(&saas_oracle_instance)
	if err := saas_oracle_instanceService.DeleteSaasOracleInstance(saas_oracle_instance); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteSaasOracleInstanceByIds 批量删除SaasOracleInstance
// @Tags SaasOracleInstance
// @Summary 批量删除SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /saas_oracle_instance/deleteSaasOracleInstanceByIds [delete]
func (saas_oracle_instanceApi *SaasOracleInstanceApi) DeleteSaasOracleInstanceByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := saas_oracle_instanceService.DeleteSaasOracleInstanceByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateSaasOracleInstance 更新SaasOracleInstance
// @Tags SaasOracleInstance
// @Summary 更新SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleInstance true "更新SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_instance/updateSaasOracleInstance [put]
func (saas_oracle_instanceApi *SaasOracleInstanceApi) UpdateSaasOracleInstance(c *gin.Context) {
	var saas_oracle_instance saasdb.SaasOracleInstance
	_ = c.ShouldBindJSON(&saas_oracle_instance)
	if err := saas_oracle_instanceService.UpdateSaasOracleInstance(saas_oracle_instance); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindSaasOracleInstance 用id查询SaasOracleInstance
// @Tags SaasOracleInstance
// @Summary 用id查询SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.SaasOracleInstance true "用id查询SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_instance/findSaasOracleInstance [get]
func (saas_oracle_instanceApi *SaasOracleInstanceApi) FindSaasOracleInstance(c *gin.Context) {
	var saas_oracle_instance saasdb.SaasOracleInstance
	_ = c.ShouldBindQuery(&saas_oracle_instance)
	if resaas_oracle_instance, err := saas_oracle_instanceService.GetSaasOracleInstance(saas_oracle_instance.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"resaas_oracle_instance": resaas_oracle_instance}, c)
	}
}

// GetSaasOracleInstanceList 分页获取SaasOracleInstance列表
// @Tags SaasOracleInstance
// @Summary 分页获取SaasOracleInstance列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.SaasOracleInstanceSearch true "分页获取SaasOracleInstance列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_instance/getSaasOracleInstanceList [get]
func (saas_oracle_instanceApi *SaasOracleInstanceApi) GetSaasOracleInstanceList(c *gin.Context) {
	var pageInfo saasdbReq.SaasOracleInstanceSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := saas_oracle_instanceService.GetSaasOracleInstanceInfoList(pageInfo); err != nil {
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
