package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type SaasOracleInstanceSearch struct{
    saasdb.SaasOracleInstance
    request.PageInfo
}
