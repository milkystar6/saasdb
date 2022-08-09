import service from '@/utils/request'

// @Tags Domain
// @Summary 创建Domain
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Domain true "创建Domain"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /domain/createDomain [post]

// 函数表达式的方式 箭头函数 const fn =(参数) => {}
// 参数只有一个的时候可以省略() 规范带()
// service ==> axios.create()得到的
export const createDomain = (data) => {
  return service({
    url: '/domain/createDomain',
    method: 'post',
    data,
  })
}

// @Tags Domain
// @Summary 删除Domain
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Domain true "删除Domain"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /domain/deleteDomain [delete]
export const deleteDomain = (data) => {
  return service({
    url: '/domain/deleteDomain',
    method: 'delete',
    data,
  })
}

// @Tags Domain
// @Summary 删除Domain
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Domain"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /domain/deleteDomain [delete]
export const deleteDomainByIds = (data) => {
  return service({
    url: '/domain/deleteDomainByIds',
    method: 'delete',
    data,
  })
}

// @Tags Domain
// @Summary 更新Domain
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.Domain true "更新Domain"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /domain/updateDomain [put]
export const updateDomain = (data) => {
  return service({
    url: '/domain/updateDomain',
    method: 'put',
    data,
  })
}

// @Tags Domain
// @Summary 用id查询Domain
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.Domain true "用id查询Domain"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /domain/findDomain [get]
export const findDomain = (params) => {
  return service({
    url: '/domain/findDomain',
    method: 'get',
    params,
  })
}

// @Tags Domain
// @Summary 分页获取Domain列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取Domain列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /domain/getDomainList [get]
export const getDomainList = (params) => {
  return service({
    url: '/domain/getDomainList',
    method: 'get',
    params,
  })
}
