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

type OggInfoApi struct {
}

var oggInfoService = service.ServiceGroupApp.SaasdbServiceGroup.OggInfoService


// CreateOggInfo 创建OggInfo
// @Tags OggInfo
// @Summary 创建OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.OggInfo true "创建OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /oggInfo/createOggInfo [post]
func (oggInfoApi *OggInfoApi) CreateOggInfo(c *gin.Context) {
	var oggInfo saasdb.OggInfo
	_ = c.ShouldBindJSON(&oggInfo)
	if err := oggInfoService.CreateOggInfo(oggInfo); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteOggInfo 删除OggInfo
// @Tags OggInfo
// @Summary 删除OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.OggInfo true "删除OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /oggInfo/deleteOggInfo [delete]
func (oggInfoApi *OggInfoApi) DeleteOggInfo(c *gin.Context) {
	var oggInfo saasdb.OggInfo
	_ = c.ShouldBindJSON(&oggInfo)
	if err := oggInfoService.DeleteOggInfo(oggInfo); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteOggInfoByIds 批量删除OggInfo
// @Tags OggInfo
// @Summary 批量删除OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /oggInfo/deleteOggInfoByIds [delete]
func (oggInfoApi *OggInfoApi) DeleteOggInfoByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := oggInfoService.DeleteOggInfoByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateOggInfo 更新OggInfo
// @Tags OggInfo
// @Summary 更新OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.OggInfo true "更新OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /oggInfo/updateOggInfo [put]
func (oggInfoApi *OggInfoApi) UpdateOggInfo(c *gin.Context) {
	var oggInfo saasdb.OggInfo
	_ = c.ShouldBindJSON(&oggInfo)
	if err := oggInfoService.UpdateOggInfo(oggInfo); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindOggInfo 用id查询OggInfo
// @Tags OggInfo
// @Summary 用id查询OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.OggInfo true "用id查询OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /oggInfo/findOggInfo [get]
func (oggInfoApi *OggInfoApi) FindOggInfo(c *gin.Context) {
	var oggInfo saasdb.OggInfo
	_ = c.ShouldBindQuery(&oggInfo)
	if reoggInfo, err := oggInfoService.GetOggInfo(oggInfo.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"reoggInfo": reoggInfo}, c)
	}
}

// GetOggInfoList 分页获取OggInfo列表
// @Tags OggInfo
// @Summary 分页获取OggInfo列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.OggInfoSearch true "分页获取OggInfo列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /oggInfo/getOggInfoList [get]
func (oggInfoApi *OggInfoApi) GetOggInfoList(c *gin.Context) {
	var pageInfo saasdbReq.OggInfoSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := oggInfoService.GetOggInfoInfoList(pageInfo); err != nil {
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
