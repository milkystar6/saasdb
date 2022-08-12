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

type BackLogApi struct {
}

var BackupLogService = service.ServiceGroupApp.SaasdbServiceGroup.BackLogService


// CreateBackLog 创建BackLog
// @Tags BackLog
// @Summary 创建BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.BackLog true "创建BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /BackupLog/createBackLog [post]
func (BackupLogApi *BackLogApi) CreateBackLog(c *gin.Context) {
	var BackupLog saasdb.BackLog
	_ = c.ShouldBindJSON(&BackupLog)
    verify := utils.Rules{
        "DomainId":{utils.NotEmpty()},
        "BackupType":{utils.NotEmpty()},
    }
	if err := utils.Verify(BackupLog, verify); err != nil {
    		response.FailWithMessage(err.Error(), c)
    		return
    	}
	if err := BackupLogService.CreateBackLog(BackupLog); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteBackLog 删除BackLog
// @Tags BackLog
// @Summary 删除BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.BackLog true "删除BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /BackupLog/deleteBackLog [delete]
func (BackupLogApi *BackLogApi) DeleteBackLog(c *gin.Context) {
	var BackupLog saasdb.BackLog
	_ = c.ShouldBindJSON(&BackupLog)
	if err := BackupLogService.DeleteBackLog(BackupLog); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteBackLogByIds 批量删除BackLog
// @Tags BackLog
// @Summary 批量删除BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /BackupLog/deleteBackLogByIds [delete]
func (BackupLogApi *BackLogApi) DeleteBackLogByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := BackupLogService.DeleteBackLogByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateBackLog 更新BackLog
// @Tags BackLog
// @Summary 更新BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.BackLog true "更新BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /BackupLog/updateBackLog [put]
func (BackupLogApi *BackLogApi) UpdateBackLog(c *gin.Context) {
	var BackupLog saasdb.BackLog
	_ = c.ShouldBindJSON(&BackupLog)
      verify := utils.Rules{
          "DomainId":{utils.NotEmpty()},
          "BackupType":{utils.NotEmpty()},
      }
    if err := utils.Verify(BackupLog, verify); err != nil {
      	response.FailWithMessage(err.Error(), c)
      	return
     }
	if err := BackupLogService.UpdateBackLog(BackupLog); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindBackLog 用id查询BackLog
// @Tags BackLog
// @Summary 用id查询BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.BackLog true "用id查询BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /BackupLog/findBackLog [get]
func (BackupLogApi *BackLogApi) FindBackLog(c *gin.Context) {
	var BackupLog saasdb.BackLog
	_ = c.ShouldBindQuery(&BackupLog)
	if reBackupLog, err := BackupLogService.GetBackLog(BackupLog.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"reBackupLog": reBackupLog}, c)
	}
}

// GetBackLogList 分页获取BackLog列表
// @Tags BackLog
// @Summary 分页获取BackLog列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.BackLogSearch true "分页获取BackLog列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /BackupLog/getBackLogList [get]
func (BackupLogApi *BackLogApi) GetBackLogList(c *gin.Context) {
	var pageInfo saasdbReq.BackLogSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := BackupLogService.GetBackLogInfoList(pageInfo); err != nil {
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
