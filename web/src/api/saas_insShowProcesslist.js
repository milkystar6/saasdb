import service from '@/utils/request'

// @Tags BackLog
// @Summary 创建BackLog
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.BackLog true "创建BackLog"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /BackupLog/createBackLog [post]
export const showinsprocesslist = (data) => {
  return service({
    url: '/insprocesslist/showinsprocesslist',
    method: 'post',
    data
  })
}
