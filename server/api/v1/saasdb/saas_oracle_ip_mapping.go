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

type SaasOracleIpMappingApi struct {
}

var saas_oracle_ip_mappingService = service.ServiceGroupApp.SaasdbServiceGroup.SaasOracleIpMappingService


// CreateSaasOracleIpMapping 创建SaasOracleIpMapping
// @Tags SaasOracleIpMapping
// @Summary 创建SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleIpMapping true "创建SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_ip_mapping/createSaasOracleIpMapping [post]
func (saas_oracle_ip_mappingApi *SaasOracleIpMappingApi) CreateSaasOracleIpMapping(c *gin.Context) {
	var saas_oracle_ip_mapping saasdb.SaasOracleIpMapping
	_ = c.ShouldBindJSON(&saas_oracle_ip_mapping)
	if err := saas_oracle_ip_mappingService.CreateSaasOracleIpMapping(saas_oracle_ip_mapping); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteSaasOracleIpMapping 删除SaasOracleIpMapping
// @Tags SaasOracleIpMapping
// @Summary 删除SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleIpMapping true "删除SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_ip_mapping/deleteSaasOracleIpMapping [delete]
func (saas_oracle_ip_mappingApi *SaasOracleIpMappingApi) DeleteSaasOracleIpMapping(c *gin.Context) {
	var saas_oracle_ip_mapping saasdb.SaasOracleIpMapping
	_ = c.ShouldBindJSON(&saas_oracle_ip_mapping)
	if err := saas_oracle_ip_mappingService.DeleteSaasOracleIpMapping(saas_oracle_ip_mapping); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteSaasOracleIpMappingByIds 批量删除SaasOracleIpMapping
// @Tags SaasOracleIpMapping
// @Summary 批量删除SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /saas_oracle_ip_mapping/deleteSaasOracleIpMappingByIds [delete]
func (saas_oracle_ip_mappingApi *SaasOracleIpMappingApi) DeleteSaasOracleIpMappingByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := saas_oracle_ip_mappingService.DeleteSaasOracleIpMappingByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateSaasOracleIpMapping 更新SaasOracleIpMapping
// @Tags SaasOracleIpMapping
// @Summary 更新SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleIpMapping true "更新SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_ip_mapping/updateSaasOracleIpMapping [put]
func (saas_oracle_ip_mappingApi *SaasOracleIpMappingApi) UpdateSaasOracleIpMapping(c *gin.Context) {
	var saas_oracle_ip_mapping saasdb.SaasOracleIpMapping
	_ = c.ShouldBindJSON(&saas_oracle_ip_mapping)
	if err := saas_oracle_ip_mappingService.UpdateSaasOracleIpMapping(saas_oracle_ip_mapping); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindSaasOracleIpMapping 用id查询SaasOracleIpMapping
// @Tags SaasOracleIpMapping
// @Summary 用id查询SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.SaasOracleIpMapping true "用id查询SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_ip_mapping/findSaasOracleIpMapping [get]
func (saas_oracle_ip_mappingApi *SaasOracleIpMappingApi) FindSaasOracleIpMapping(c *gin.Context) {
	var saas_oracle_ip_mapping saasdb.SaasOracleIpMapping
	_ = c.ShouldBindQuery(&saas_oracle_ip_mapping)
	if resaas_oracle_ip_mapping, err := saas_oracle_ip_mappingService.GetSaasOracleIpMapping(saas_oracle_ip_mapping.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"resaas_oracle_ip_mapping": resaas_oracle_ip_mapping}, c)
	}
}

// GetSaasOracleIpMappingList 分页获取SaasOracleIpMapping列表
// @Tags SaasOracleIpMapping
// @Summary 分页获取SaasOracleIpMapping列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.SaasOracleIpMappingSearch true "分页获取SaasOracleIpMapping列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_ip_mapping/getSaasOracleIpMappingList [get]
func (saas_oracle_ip_mappingApi *SaasOracleIpMappingApi) GetSaasOracleIpMappingList(c *gin.Context) {
	var pageInfo saasdbReq.SaasOracleIpMappingSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := saas_oracle_ip_mappingService.GetSaasOracleIpMappingInfoList(pageInfo); err != nil {
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
