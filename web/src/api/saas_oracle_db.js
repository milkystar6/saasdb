import service from '@/utils/request'

// @Tags SaasOracleDb
// @Summary 创建SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleDb true "创建SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_db/createSaasOracleDb [post]
export const createSaasOracleDb = (data) => {
  return service({
    url: '/saas_oracle_db/createSaasOracleDb',
    method: 'post',
    data
  })
}

// @Tags SaasOracleDb
// @Summary 删除SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleDb true "删除SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_db/deleteSaasOracleDb [delete]
export const deleteSaasOracleDb = (data) => {
  return service({
    url: '/saas_oracle_db/deleteSaasOracleDb',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleDb
// @Summary 删除SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_db/deleteSaasOracleDb [delete]
export const deleteSaasOracleDbByIds = (data) => {
  return service({
    url: '/saas_oracle_db/deleteSaasOracleDbByIds',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleDb
// @Summary 更新SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleDb true "更新SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_db/updateSaasOracleDb [put]
export const updateSaasOracleDb = (data) => {
  return service({
    url: '/saas_oracle_db/updateSaasOracleDb',
    method: 'put',
    data
  })
}

// @Tags SaasOracleDb
// @Summary 用id查询SaasOracleDb
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.SaasOracleDb true "用id查询SaasOracleDb"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_db/findSaasOracleDb [get]
export const findSaasOracleDb = (params) => {
  return service({
    url: '/saas_oracle_db/findSaasOracleDb',
    method: 'get',
    params
  })
}

// @Tags SaasOracleDb
// @Summary 分页获取SaasOracleDb列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取SaasOracleDb列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_db/getSaasOracleDbList [get]
export const getSaasOracleDbList = (params) => {
  return service({
    url: '/saas_oracle_db/getSaasOracleDbList',
    method: 'get',
    params
  })
}
