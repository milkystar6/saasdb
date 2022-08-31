import service from '@/utils/request'

// @Tags OggInfo
// @Summary 创建OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.OggInfo true "创建OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /oggInfo/createOggInfo [post]
export const createOggInfo = (data) => {
  return service({
    url: '/oggInfo/createOggInfo',
    method: 'post',
    data
  })
}

// @Tags OggInfo
// @Summary 删除OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.OggInfo true "删除OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /oggInfo/deleteOggInfo [delete]
export const deleteOggInfo = (data) => {
  return service({
    url: '/oggInfo/deleteOggInfo',
    method: 'delete',
    data
  })
}

// @Tags OggInfo
// @Summary 删除OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /oggInfo/deleteOggInfo [delete]
export const deleteOggInfoByIds = (data) => {
  return service({
    url: '/oggInfo/deleteOggInfoByIds',
    method: 'delete',
    data
  })
}

// @Tags OggInfo
// @Summary 更新OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.OggInfo true "更新OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /oggInfo/updateOggInfo [put]
export const updateOggInfo = (data) => {
  return service({
    url: '/oggInfo/updateOggInfo',
    method: 'put',
    data
  })
}

// @Tags OggInfo
// @Summary 用id查询OggInfo
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.OggInfo true "用id查询OggInfo"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /oggInfo/findOggInfo [get]
export const findOggInfo = (params) => {
  return service({
    url: '/oggInfo/findOggInfo',
    method: 'get',
    params
  })
}

// @Tags OggInfo
// @Summary 分页获取OggInfo列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取OggInfo列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /oggInfo/getOggInfoList [get]
export const getOggInfoList = (params) => {
  return service({
    url: '/oggInfo/getOggInfoList',
    method: 'get',
    params
  })
}
