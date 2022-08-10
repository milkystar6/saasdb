package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
)

type DomainSearch struct {
	saasdb.Domain
	request.PageInfo
}

type DomainJoinSearch struct {
	saasdb.Domain
	request.PageInfo
	ProjName string `json:"projName" form:"projName" gorm:"column:proj_name;comment:项目名称;"`
}
