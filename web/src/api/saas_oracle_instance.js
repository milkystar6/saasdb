import service from '@/utils/request'

// @Tags SaasOracleInstance
// @Summary 创建SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleInstance true "创建SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_instance/createSaasOracleInstance [post]
export const createSaasOracleInstance = (data) => {
  return service({
    url: '/saas_oracle_instance/createSaasOracleInstance',
    method: 'post',
    data
  })
}

// @Tags SaasOracleInstance
// @Summary 删除SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleInstance true "删除SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_instance/deleteSaasOracleInstance [delete]
export const deleteSaasOracleInstance = (data) => {
  return service({
    url: '/saas_oracle_instance/deleteSaasOracleInstance',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleInstance
// @Summary 删除SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_instance/deleteSaasOracleInstance [delete]
export const deleteSaasOracleInstanceByIds = (data) => {
  return service({
    url: '/saas_oracle_instance/deleteSaasOracleInstanceByIds',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleInstance
// @Summary 更新SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleInstance true "更新SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_instance/updateSaasOracleInstance [put]
export const updateSaasOracleInstance = (data) => {
  return service({
    url: '/saas_oracle_instance/updateSaasOracleInstance',
    method: 'put',
    data
  })
}

// @Tags SaasOracleInstance
// @Summary 用id查询SaasOracleInstance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.SaasOracleInstance true "用id查询SaasOracleInstance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_instance/findSaasOracleInstance [get]
export const findSaasOracleInstance = (params) => {
  return service({
    url: '/saas_oracle_instance/findSaasOracleInstance',
    method: 'get',
    params
  })
}

// @Tags SaasOracleInstance
// @Summary 分页获取SaasOracleInstance列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取SaasOracleInstance列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_instance/getSaasOracleInstanceList [get]
export const getSaasOracleInstanceList = (params) => {
  return service({
    url: '/saas_oracle_instance/getSaasOracleInstanceList',
    method: 'get',
    params
  })
}
