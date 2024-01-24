package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type SaasOracleIpSearch struct{
    saasdb.SaasOracleIp
    request.PageInfo
}
