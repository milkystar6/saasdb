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

type SaasOracleIpApi struct {
}

var saas_oracle_ipService = service.ServiceGroupApp.SaasdbServiceGroup.SaasOracleIpService


// CreateSaasOracleIp 创建SaasOracleIp
// @Tags SaasOracleIp
// @Summary 创建SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleIp true "创建SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_ip/createSaasOracleIp [post]
func (saas_oracle_ipApi *SaasOracleIpApi) CreateSaasOracleIp(c *gin.Context) {
	var saas_oracle_ip saasdb.SaasOracleIp
	_ = c.ShouldBindJSON(&saas_oracle_ip)
	if err := saas_oracle_ipService.CreateSaasOracleIp(saas_oracle_ip); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteSaasOracleIp 删除SaasOracleIp
// @Tags SaasOracleIp
// @Summary 删除SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleIp true "删除SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_ip/deleteSaasOracleIp [delete]
func (saas_oracle_ipApi *SaasOracleIpApi) DeleteSaasOracleIp(c *gin.Context) {
	var saas_oracle_ip saasdb.SaasOracleIp
	_ = c.ShouldBindJSON(&saas_oracle_ip)
	if err := saas_oracle_ipService.DeleteSaasOracleIp(saas_oracle_ip); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteSaasOracleIpByIds 批量删除SaasOracleIp
// @Tags SaasOracleIp
// @Summary 批量删除SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /saas_oracle_ip/deleteSaasOracleIpByIds [delete]
func (saas_oracle_ipApi *SaasOracleIpApi) DeleteSaasOracleIpByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := saas_oracle_ipService.DeleteSaasOracleIpByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateSaasOracleIp 更新SaasOracleIp
// @Tags SaasOracleIp
// @Summary 更新SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleIp true "更新SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_ip/updateSaasOracleIp [put]
func (saas_oracle_ipApi *SaasOracleIpApi) UpdateSaasOracleIp(c *gin.Context) {
	var saas_oracle_ip saasdb.SaasOracleIp
	_ = c.ShouldBindJSON(&saas_oracle_ip)
	if err := saas_oracle_ipService.UpdateSaasOracleIp(saas_oracle_ip); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindSaasOracleIp 用id查询SaasOracleIp
// @Tags SaasOracleIp
// @Summary 用id查询SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.SaasOracleIp true "用id查询SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_ip/findSaasOracleIp [get]
func (saas_oracle_ipApi *SaasOracleIpApi) FindSaasOracleIp(c *gin.Context) {
	var saas_oracle_ip saasdb.SaasOracleIp
	_ = c.ShouldBindQuery(&saas_oracle_ip)
	if resaas_oracle_ip, err := saas_oracle_ipService.GetSaasOracleIp(saas_oracle_ip.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"resaas_oracle_ip": resaas_oracle_ip}, c)
	}
}

// GetSaasOracleIpList 分页获取SaasOracleIp列表
// @Tags SaasOracleIp
// @Summary 分页获取SaasOracleIp列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.SaasOracleIpSearch true "分页获取SaasOracleIp列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_ip/getSaasOracleIpList [get]
func (saas_oracle_ipApi *SaasOracleIpApi) GetSaasOracleIpList(c *gin.Context) {
	var pageInfo saasdbReq.SaasOracleIpSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := saas_oracle_ipService.GetSaasOracleIpInfoList(pageInfo); err != nil {
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
