import service from '@/utils/request'

// @Tags SaasOracleIp
// @Summary 创建SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleIp true "创建SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_ip/createSaasOracleIp [post]
export const createSaasOracleIp = (data) => {
  return service({
    url: '/saas_oracle_ip/createSaasOracleIp',
    method: 'post',
    data
  })
}

// @Tags SaasOracleIp
// @Summary 删除SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleIp true "删除SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_ip/deleteSaasOracleIp [delete]
export const deleteSaasOracleIp = (data) => {
  return service({
    url: '/saas_oracle_ip/deleteSaasOracleIp',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleIp
// @Summary 删除SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_oracle_ip/deleteSaasOracleIp [delete]
export const deleteSaasOracleIpByIds = (data) => {
  return service({
    url: '/saas_oracle_ip/deleteSaasOracleIpByIds',
    method: 'delete',
    data
  })
}

// @Tags SaasOracleIp
// @Summary 更新SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasOracleIp true "更新SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_oracle_ip/updateSaasOracleIp [put]
export const updateSaasOracleIp = (data) => {
  return service({
    url: '/saas_oracle_ip/updateSaasOracleIp',
    method: 'put',
    data
  })
}

// @Tags SaasOracleIp
// @Summary 用id查询SaasOracleIp
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.SaasOracleIp true "用id查询SaasOracleIp"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_oracle_ip/findSaasOracleIp [get]
export const findSaasOracleIp = (params) => {
  return service({
    url: '/saas_oracle_ip/findSaasOracleIp',
    method: 'get',
    params
  })
}

// @Tags SaasOracleIp
// @Summary 分页获取SaasOracleIp列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取SaasOracleIp列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_oracle_ip/getSaasOracleIpList [get]
export const getSaasOracleIpList = (params) => {
  return service({
    url: '/saas_oracle_ip/getSaasOracleIpList',
    method: 'get',
    params
  })
}
