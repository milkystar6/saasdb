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

type SaasOracleDbApi struct {
}

var saas_oracle_dbService = service.ServiceGroupApp.SaasdbServiceGroup.SaasOracleDbService


// CreateSaasOracleDb 创建SaasOracleDb
// @Tags SaasOracleDb
// @Summary 创建SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleDb true "创建SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_db/createSaasOracleDb [post]
func (saas_oracle_dbApi *SaasOracleDbApi) CreateSaasOracleDb(c *gin.Context) {
	var saas_oracle_db saasdb.SaasOracleDb
	_ = c.ShouldBindJSON(&saas_oracle_db)
	if err := saas_oracle_dbService.CreateSaasOracleDb(saas_oracle_db); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteSaasOracleDb 删除SaasOracleDb
// @Tags SaasOracleDb
// @Summary 删除SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleDb true "删除SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_db/deleteSaasOracleDb [delete]
func (saas_oracle_dbApi *SaasOracleDbApi) DeleteSaasOracleDb(c *gin.Context) {
	var saas_oracle_db saasdb.SaasOracleDb
	_ = c.ShouldBindJSON(&saas_oracle_db)
	if err := saas_oracle_dbService.DeleteSaasOracleDb(saas_oracle_db); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteSaasOracleDbByIds 批量删除SaasOracleDb
// @Tags SaasOracleDb
// @Summary 批量删除SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /saas_oracle_db/deleteSaasOracleDbByIds [delete]
func (saas_oracle_dbApi *SaasOracleDbApi) DeleteSaasOracleDbByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := saas_oracle_dbService.DeleteSaasOracleDbByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateSaasOracleDb 更新SaasOracleDb
// @Tags SaasOracleDb
// @Summary 更新SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleDb true "更新SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_db/updateSaasOracleDb [put]
func (saas_oracle_dbApi *SaasOracleDbApi) UpdateSaasOracleDb(c *gin.Context) {
	var saas_oracle_db saasdb.SaasOracleDb
	_ = c.ShouldBindJSON(&saas_oracle_db)
	if err := saas_oracle_dbService.UpdateSaasOracleDb(saas_oracle_db); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindSaasOracleDb 用id查询SaasOracleDb
// @Tags SaasOracleDb
// @Summary 用id查询SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.SaasOracleDb true "用id查询SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_db/findSaasOracleDb [get]
func (saas_oracle_dbApi *SaasOracleDbApi) FindSaasOracleDb(c *gin.Context) {
	var saas_oracle_db saasdb.SaasOracleDb
	_ = c.ShouldBindQuery(&saas_oracle_db)
	if resaas_oracle_db, err := saas_oracle_dbService.GetSaasOracleDb(saas_oracle_db.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"resaas_oracle_db": resaas_oracle_db}, c)
	}
}

// GetSaasOracleDbList 分页获取SaasOracleDb列表
// @Tags SaasOracleDb
// @Summary 分页获取SaasOracleDb列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.SaasOracleDbSearch true "分页获取SaasOracleDb列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_db/getSaasOracleDbList [get]
func (saas_oracle_dbApi *SaasOracleDbApi) GetSaasOracleDbList(c *gin.Context) {
	var pageInfo saasdbReq.SaasOracleDbSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := saas_oracle_dbService.GetSaasOracleDbInfoList(pageInfo); err != nil {
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
