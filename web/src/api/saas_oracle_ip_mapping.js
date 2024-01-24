import service from '@/utils/request'

// @Tags SaasOracleIpMapping
// @Summary 创建SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleIpMapping true "创建SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_ip_mapping/createSaasOracleIpMapping [post]
export const createSaasOracleIpMapping = (data) => {
  return service({
    url: '/saas_oracle_ip_mapping/createSaasOracleIpMapping',
    method: 'post',
    data
  })
}

// @Tags SaasOracleIpMapping
// @Summary 删除SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleIpMapping true "删除SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_ip_mapping/deleteSaasOracleIpMapping [delete]
export const deleteSaasOracleIpMapping = (data) => {
  return service({
    url: '/saas_oracle_ip_mapping/deleteSaasOracleIpMapping',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleIpMapping
// @Summary 删除SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_ip_mapping/deleteSaasOracleIpMapping [delete]
export const deleteSaasOracleIpMappingByIds = (data) => {
  return service({
    url: '/saas_oracle_ip_mapping/deleteSaasOracleIpMappingByIds',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleIpMapping
// @Summary 更新SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleIpMapping true "更新SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_ip_mapping/updateSaasOracleIpMapping [put]
export const updateSaasOracleIpMapping = (data) => {
  return service({
    url: '/saas_oracle_ip_mapping/updateSaasOracleIpMapping',
    method: 'put',
    data
  })
}

// @Tags SaasOracleIpMapping
// @Summary 用id查询SaasOracleIpMapping
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.SaasOracleIpMapping true "用id查询SaasOracleIpMapping"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_ip_mapping/findSaasOracleIpMapping [get]
export const findSaasOracleIpMapping = (params) => {
  return service({
    url: '/saas_oracle_ip_mapping/findSaasOracleIpMapping',
    method: 'get',
    params
  })
}

// @Tags SaasOracleIpMapping
// @Summary 分页获取SaasOracleIpMapping列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取SaasOracleIpMapping列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_ip_mapping/getSaasOracleIpMappingList [get]
export const getSaasOracleIpMappingList = (params) => {
  return service({
    url: '/saas_oracle_ip_mapping/getSaasOracleIpMappingList',
    method: 'get',
    params
  })
}
