import service from '@/utils/request'

// @Tags SaasDictum
// @Summary 创建SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasDictum true "创建SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_dictum/createSaasDictum [post]
export const createSaasDictum = (data) => {
  return service({
    url: '/saas_dictum/createSaasDictum',
    method: 'post',
    data
  })
}

// @Tags SaasDictum
// @Summary 删除SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasDictum true "删除SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_dictum/deleteSaasDictum [delete]
export const deleteSaasDictum = (data) => {
  return service({
    url: '/saas_dictum/deleteSaasDictum',
    method: 'delete',
    data
  })
}

// @Tags SaasDictum
// @Summary 删除SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /saas_dictum/deleteSaasDictum [delete]
export const deleteSaasDictumByIds = (data) => {
  return service({
    url: '/saas_dictum/deleteSaasDictumByIds',
    method: 'delete',
    data
  })
}

// @Tags SaasDictum
// @Summary 更新SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.SaasDictum true "更新SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /saas_dictum/updateSaasDictum [put]
export const updateSaasDictum = (data) => {
  return service({
    url: '/saas_dictum/updateSaasDictum',
    method: 'put',
    data
  })
}

// @Tags SaasDictum
// @Summary 用id查询SaasDictum
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.SaasDictum true "用id查询SaasDictum"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /saas_dictum/findSaasDictum [get]
export const findSaasDictum = (params) => {
  return service({
    url: '/saas_dictum/findSaasDictum',
    method: 'get',
    params
  })
}

// @Tags SaasDictum
// @Summary 分页获取SaasDictum列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取SaasDictum列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /saas_dictum/getSaasDictumList [get]
export const getSaasDictumList = (params) => {
  return service({
    url: '/saas_dictum/getSaasDictumList',
    method: 'get',
    params
  })
}
