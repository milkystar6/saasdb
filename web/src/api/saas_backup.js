import service from '@/utils/request'

// @Tags BackLog
// @Summary 创建BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.BackLog true "创建BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /BackupLog/createBackLog [post]
export const createBackLog = (data) => {
  return service({
    url: '/BackupLog/createBackLog',
    method: 'post',
    data
  })
}

// @Tags BackLog
// @Summary 删除BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.BackLog true "删除BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /BackupLog/deleteBackLog [delete]
export const deleteBackLog = (data) => {
  return service({
    url: '/BackupLog/deleteBackLog',
    method: 'delete',
    data
  })
}

// @Tags BackLog
// @Summary 删除BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /BackupLog/deleteBackLog [delete]
export const deleteBackLogByIds = (data) => {
  return service({
    url: '/BackupLog/deleteBackLogByIds',
    method: 'delete',
    data
  })
}

// @Tags BackLog
// @Summary 更新BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.BackLog true "更新BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /BackupLog/updateBackLog [put]
export const updateBackLog = (data) => {
  return service({
    url: '/BackupLog/updateBackLog',
    method: 'put',
    data
  })
}

// @Tags BackLog
// @Summary 用id查询BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query model.BackLog true "用id查询BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /BackupLog/findBackLog [get]
export const findBackLog = (params) => {
  return service({
    url: '/BackupLog/findBackLog',
    method: 'get',
    params
  })
}

// @Tags BackLog
// @Summary 分页获取BackLog列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query request.PageInfo true "分页获取BackLog列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /BackupLog/getBackLogList [get]
export const getBackLogList = (params) => {
  return service({
    url: '/BackupLog/getBackLogList',
    method: 'get',
    params
  })
}
