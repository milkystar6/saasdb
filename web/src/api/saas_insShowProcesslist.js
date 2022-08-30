import service from '@/utils/request'

// @Tags InsProcesslist
// @Summary 获取实例的会话列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.BackLog true "获取实例的会话列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /insprocesslist/showinsprocesslist [post]
export const showinsprocesslist = (data) => {
  return service({
    url: '/insprocesslist/showinsprocesslist',
    method: 'post',
    data,
  })
}
