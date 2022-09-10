import service from '@/utils/request'

// @Tags Instance
// @Summary 创建Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Instance true "创建Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_instance/createInstance [post]
export const createInstance = (data) => {
  return service({
    url: '/saas_instance/createInstance',
    method: 'post',
    data
  })
}

// @Tags Instance
// @Summary 删除Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Instance true "删除Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_instance/deleteInstance [delete]
export const deleteInstance = (data) => {
  return service({
    url: '/saas_instance/deleteInstance',
    method: 'delete',
    data
  })
}

// @Tags Instance
// @Summary 删除Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_instance/deleteInstance [delete]
export const deleteInstanceByIds = (data) => {
  return service({
    url: '/saas_instance/deleteInstanceByIds',
    method: 'delete',
    data
  })
}

// @Tags Instance
// @Summary 更新Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Instance true "更新Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_instance/updateInstance [put]
export const updateInstance = (data) => {
  return service({
    url: '/saas_instance/updateInstance',
    method: 'put',
    data
  })
}

// @Tags Instance
// @Summary 用id查询Instance
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Instance true "用id查询Instance"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_instance/findInstance [get]
export const findInstance = (params) => {
  return service({
    url: '/saas_instance/findInstance',
    method: 'get',
    params
  })
}

// @Tags Instance
// @Summary 分页获取Instance列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Instance列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_instance/getInstanceList [get]
export const getInstanceList = (params) => {
  return service({
    url: '/saas_instance/getInstanceList',
    method: 'get',
    params
  })
}

export const findInstanceOfOneDomain = (params) => {
  return service({
    url: '/saas_instance/findInstanceOfOneDomain',
    method: 'get',
    params
  })
}
