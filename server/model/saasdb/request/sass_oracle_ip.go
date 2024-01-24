package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
)

type SassOracleIpSearch struct {
	saasdb.SaasOracleIp
	request.PageInfo
}
