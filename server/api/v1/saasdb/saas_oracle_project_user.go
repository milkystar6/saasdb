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

type SaasOracleProjectUserApi struct {
}

var saas_oracle_project_userService = service.ServiceGroupApp.SaasdbServiceGroup.SaasOracleProjectUserService


// CreateSaasOracleProjectUser 创建SaasOracleProjectUser
// @Tags SaasOracleProjectUser
// @Summary 创建SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleProjectUser true "创建SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_project_user/createSaasOracleProjectUser [post]
func (saas_oracle_project_userApi *SaasOracleProjectUserApi) CreateSaasOracleProjectUser(c *gin.Context) {
	var saas_oracle_project_user saasdb.SaasOracleProjectUser
	_ = c.ShouldBindJSON(&saas_oracle_project_user)
    verify := utils.Rules{
        "UserName":{utils.NotEmpty()},
    }
	if err := utils.Verify(saas_oracle_project_user, verify); err != nil {
    		response.FailWithMessage(err.Error(), c)
    		return
    	}
	if err := saas_oracle_project_userService.CreateSaasOracleProjectUser(saas_oracle_project_user); err != nil {
        global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteSaasOracleProjectUser 删除SaasOracleProjectUser
// @Tags SaasOracleProjectUser
// @Summary 删除SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleProjectUser true "删除SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_project_user/deleteSaasOracleProjectUser [delete]
func (saas_oracle_project_userApi *SaasOracleProjectUserApi) DeleteSaasOracleProjectUser(c *gin.Context) {
	var saas_oracle_project_user saasdb.SaasOracleProjectUser
	_ = c.ShouldBindJSON(&saas_oracle_project_user)
	if err := saas_oracle_project_userService.DeleteSaasOracleProjectUser(saas_oracle_project_user); err != nil {
        global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteSaasOracleProjectUserByIds 批量删除SaasOracleProjectUser
// @Tags SaasOracleProjectUser
// @Summary 批量删除SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /saas_oracle_project_user/deleteSaasOracleProjectUserByIds [delete]
func (saas_oracle_project_userApi *SaasOracleProjectUserApi) DeleteSaasOracleProjectUserByIds(c *gin.Context) {
	var IDS request.IdsReq
    _ = c.ShouldBindJSON(&IDS)
	if err := saas_oracle_project_userService.DeleteSaasOracleProjectUserByIds(IDS); err != nil {
        global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateSaasOracleProjectUser 更新SaasOracleProjectUser
// @Tags SaasOracleProjectUser
// @Summary 更新SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.SaasOracleProjectUser true "更新SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_project_user/updateSaasOracleProjectUser [put]
func (saas_oracle_project_userApi *SaasOracleProjectUserApi) UpdateSaasOracleProjectUser(c *gin.Context) {
	var saas_oracle_project_user saasdb.SaasOracleProjectUser
	_ = c.ShouldBindJSON(&saas_oracle_project_user)
      verify := utils.Rules{
          "UserName":{utils.NotEmpty()},
      }
    if err := utils.Verify(saas_oracle_project_user, verify); err != nil {
      	response.FailWithMessage(err.Error(), c)
      	return
     }
	if err := saas_oracle_project_userService.UpdateSaasOracleProjectUser(saas_oracle_project_user); err != nil {
        global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindSaasOracleProjectUser 用id查询SaasOracleProjectUser
// @Tags SaasOracleProjectUser
// @Summary 用id查询SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.SaasOracleProjectUser true "用id查询SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_project_user/findSaasOracleProjectUser [get]
func (saas_oracle_project_userApi *SaasOracleProjectUserApi) FindSaasOracleProjectUser(c *gin.Context) {
	var saas_oracle_project_user saasdb.SaasOracleProjectUser
	_ = c.ShouldBindQuery(&saas_oracle_project_user)
	if resaas_oracle_project_user, err := saas_oracle_project_userService.GetSaasOracleProjectUser(saas_oracle_project_user.ID); err != nil {
        global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"resaas_oracle_project_user": resaas_oracle_project_user}, c)
	}
}

// GetSaasOracleProjectUserList 分页获取SaasOracleProjectUser列表
// @Tags SaasOracleProjectUser
// @Summary 分页获取SaasOracleProjectUser列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.SaasOracleProjectUserSearch true "分页获取SaasOracleProjectUser列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_project_user/getSaasOracleProjectUserList [get]
func (saas_oracle_project_userApi *SaasOracleProjectUserApi) GetSaasOracleProjectUserList(c *gin.Context) {
	var pageInfo saasdbReq.SaasOracleProjectUserSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := saas_oracle_project_userService.GetSaasOracleProjectUserInfoList(pageInfo); err != nil {
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
