package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/response"
	"github.com/flipped-aurora/gin-vue-admin/server/service"
	"github.com/gin-gonic/gin"
)

type DBOverViewApi struct{}

var DBOverViewApiService = service.ServiceGroupApp.SaasdbServiceGroup.DBOverViewService

func (d DBOverViewApi) GetDBOverViewA(c *gin.Context) {
	if info, err := DBOverViewApiService.GetDBOverView(); err != nil {
		response.FailWithMessage(err.Error(), c)
	} else {
		response.OkWithData(gin.H{"dboverview": info}, c)
	}
}
