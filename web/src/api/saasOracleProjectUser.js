import service from '@/utils/request'

// @Tags SaasOracleProjectUser
// @Summary 创建SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleProjectUser true "创建SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_project_user/createSaasOracleProjectUser [post]
export const createSaasOracleProjectUser = (data) => {
  return service({
    url: '/saas_oracle_project_user/createSaasOracleProjectUser',
    method: 'post',
    data
  })
}

// @Tags SaasOracleProjectUser
// @Summary 删除SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleProjectUser true "删除SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_project_user/deleteSaasOracleProjectUser [delete]
export const deleteSaasOracleProjectUser = (data) => {
  return service({
    url: '/saas_oracle_project_user/deleteSaasOracleProjectUser',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleProjectUser
// @Summary 删除SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_project_user/deleteSaasOracleProjectUser [delete]
export const deleteSaasOracleProjectUserByIds = (data) => {
  return service({
    url: '/saas_oracle_project_user/deleteSaasOracleProjectUserByIds',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleProjectUser
// @Summary 更新SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleProjectUser true "更新SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_project_user/updateSaasOracleProjectUser [put]
export const updateSaasOracleProjectUser = (data) => {
  return service({
    url: '/saas_oracle_project_user/updateSaasOracleProjectUser',
    method: 'put',
    data
  })
}

// @Tags SaasOracleProjectUser
// @Summary 用id查询SaasOracleProjectUser
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.SaasOracleProjectUser true "用id查询SaasOracleProjectUser"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_project_user/findSaasOracleProjectUser [get]
export const findSaasOracleProjectUser = (params) => {
  return service({
    url: '/saas_oracle_project_user/findSaasOracleProjectUser',
    method: 'get',
    params
  })
}

// @Tags SaasOracleProjectUser
// @Summary 分页获取SaasOracleProjectUser列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取SaasOracleProjectUser列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_project_user/getSaasOracleProjectUserList [get]
export const getSaasOracleProjectUserList = (params) => {
  return service({
    url: '/saas_oracle_project_user/getSaasOracleProjectUserList',
    method: 'get',
    params
  })
}
