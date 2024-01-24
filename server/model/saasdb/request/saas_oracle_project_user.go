package request

import (
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
)

type SaasOracleProjectUserSearch struct{
    saasdb.SaasOracleProjectUser
    request.PageInfo
}
