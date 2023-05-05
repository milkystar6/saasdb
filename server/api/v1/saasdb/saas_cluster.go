package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/flipped-aurora/gin-vue-admin/server/utils"
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

type ClusterApi struct {
}

var clusterService = service.ServiceGroupApp.SaasdbServiceGroup.ClusterService

// CreateCluster 创建Cluster
// @Tags Cluster
// @Summary 创建Cluster
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Cluster true "创建Cluster"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /cluster/createCluster [post]
func (clusterApi *ClusterApi) CreateCluster(c *gin.Context) {
	var cluster saasdb.Cluster
	_ = c.ShouldBindJSON(&cluster)
	verify := utils.Rules{
		"DomainIds":   {utils.NotEmpty()},
		"ClusterName": {utils.NotEmpty()},
	}
	if err := utils.Verify(cluster, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := clusterService.CreateCluster(cluster); err != nil {
		global.GVA_LOG.Error("创建失败!", zap.Error(err))
		response.FailWithMessage("创建失败", c)
	} else {
		response.OkWithMessage("创建成功", c)
	}
}

// DeleteCluster 删除Cluster
// @Tags Cluster
// @Summary 删除Cluster
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Cluster true "删除Cluster"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"删除成功"}"
// @Router /cluster/deleteCluster [delete]
func (clusterApi *ClusterApi) DeleteCluster(c *gin.Context) {
	var cluster saasdb.Cluster
	_ = c.ShouldBindJSON(&cluster)
	if err := clusterService.DeleteCluster(cluster); err != nil {
		global.GVA_LOG.Error("删除失败!", zap.Error(err))
		response.FailWithMessage("删除失败", c)
	} else {
		response.OkWithMessage("删除成功", c)
	}
}

// DeleteClusterByIds 批量删除Cluster
// @Tags Cluster
// @Summary 批量删除Cluster
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body request.IdsReq true "批量删除Cluster"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"批量删除成功"}"
// @Router /cluster/deleteClusterByIds [delete]
func (clusterApi *ClusterApi) DeleteClusterByIds(c *gin.Context) {
	var IDS request.IdsReq
	_ = c.ShouldBindJSON(&IDS)
	if err := clusterService.DeleteClusterByIds(IDS); err != nil {
		global.GVA_LOG.Error("批量删除失败!", zap.Error(err))
		response.FailWithMessage("批量删除失败", c)
	} else {
		response.OkWithMessage("批量删除成功", c)
	}
}

// UpdateCluster 更新Cluster
// @Tags Cluster
// @Summary 更新Cluster
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data body saasdb.Cluster true "更新Cluster"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"更新成功"}"
// @Router /cluster/updateCluster [put]
func (clusterApi *ClusterApi) UpdateCluster(c *gin.Context) {
	var cluster saasdb.Cluster
	_ = c.ShouldBindJSON(&cluster)
	verify := utils.Rules{
		"DomainIds":   {utils.NotEmpty()},
		"ClusterName": {utils.NotEmpty()},
	}
	if err := utils.Verify(cluster, verify); err != nil {
		response.FailWithMessage(err.Error(), c)
		return
	}
	if err := clusterService.UpdateCluster(cluster); err != nil {
		global.GVA_LOG.Error("更新失败!", zap.Error(err))
		response.FailWithMessage("更新失败", c)
	} else {
		response.OkWithMessage("更新成功", c)
	}
}

// FindCluster 用id查询Cluster
// @Tags Cluster
// @Summary 用id查询Cluster
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdb.Cluster true "用id查询Cluster"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"查询成功"}"
// @Router /cluster/findCluster [get]
func (clusterApi *ClusterApi) FindCluster(c *gin.Context) {
	var cluster saasdb.Cluster
	_ = c.ShouldBindQuery(&cluster)
	if recluster, err := clusterService.GetCluster(cluster.ID); err != nil {
		global.GVA_LOG.Error("查询失败!", zap.Error(err))
		response.FailWithMessage("查询失败", c)
	} else {
		response.OkWithData(gin.H{"recluster": recluster}, c)
	}
}

// GetClusterList 分页获取Cluster列表
// @Tags Cluster
// @Summary 分页获取Cluster列表
// @Security ApiKeyAuth
// @accept application/json
// @Produce application/json
// @Param data query saasdbReq.ClusterSearch true "分页获取Cluster列表"
// @Success 200 {string} string "{"success":true,"data":{},"msg":"获取成功"}"
// @Router /cluster/getClusterList [get]
func (clusterApi *ClusterApi) GetClusterList(c *gin.Context) {
	var pageInfo saasdbReq.ClusterSearch
	_ = c.ShouldBindQuery(&pageInfo)
	if list, total, err := clusterService.GetClusterInfoList(pageInfo); err != nil {
		global.GVA_LOG.Error("获取失败!", zap.Error(err))
		response.FailWithMessage("获取失败", c)
	} else {
		response.OkWithDetailed(response.PageResult{
			List:     list,
			Total:    total,
			Page:     pageInfo.Page,
			PageSize: pageInfo.PageSize,
		}, "获取成功", c)
	}
}
