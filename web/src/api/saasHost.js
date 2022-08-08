import service from '@/utils/request'

// @Tags Host
// @Summary 创建Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Host true "创建Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /host/createHost [post]
export const createHost = (data) => {
  return service({
    url: '/host/createHost',
    method: 'post',
    data
  })
}

// @Tags Host
// @Summary 删除Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Host true "删除Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /host/deleteHost [delete]
export const deleteHost = (data) => {
  return service({
    url: '/host/deleteHost',
    method: 'delete',
    data
  })
}

// @Tags Host
// @Summary 删除Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /host/deleteHost [delete]
export const deleteHostByIds = (data) => {
  return service({
    url: '/host/deleteHostByIds',
    method: 'delete',
    data
  })
}

// @Tags Host
// @Summary 更新Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Host true "更新Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /host/updateHost [put]
export const updateHost = (data) => {
  return service({
    url: '/host/updateHost',
    method: 'put',
    data
  })
}

// @Tags Host
// @Summary 用id查询Host
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Host true "用id查询Host"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /host/findHost [get]
export const findHost = (params) => {
  return service({
    url: '/host/findHost',
    method: 'get',
    params
  })
}

// @Tags Host
// @Summary 分页获取Host列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Host列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /host/getHostList [get]
export const getHostList = (params) => {
  return service({
    url: '/host/getHostList',
    method: 'get',
    params
  })
}
