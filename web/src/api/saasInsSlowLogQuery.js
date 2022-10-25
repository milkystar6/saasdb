import service from '@/utils/request'

// @Tags InsSlowLogQuery
// @Summary 分析实例的慢日志
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body model.BackLog true "获取实例的运行参数列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /variables/get_variable_running_value_fuzzy_matching, [get]

export const showSlowlogQuery = (data) => {
    return service({
        url: '/slow_log_query/get_slow_log_query',
        method: 'post',
        data
    })
}
