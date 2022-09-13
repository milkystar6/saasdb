package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type InstanceSearch struct{
    saasdb.Instance
    request.PageInfo
}

type SearchInstanceByDomainID struct {
	DomainId     int     `json:"domainId" form:"domainId" gorm:"column:domain_id;comment:;"`
}