package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type SaasOracleIpService struct {
}

// CreateSaasOracleIp 创建SaasOracleIp记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ipService *SaasOracleIpService) CreateSaasOracleIp(saas_oracle_ip saasdb.SaasOracleIp) (err error) {
	err = global.GVA_DB.Create(&saas_oracle_ip).Error
	return err
}

// DeleteSaasOracleIp 删除SaasOracleIp记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ipService *SaasOracleIpService) DeleteSaasOracleIp(saas_oracle_ip saasdb.SaasOracleIp) (err error) {
	err = global.GVA_DB.Delete(&saas_oracle_ip).Error
	return err
}

// DeleteSaasOracleIpByIds 批量删除SaasOracleIp记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ipService *SaasOracleIpService) DeleteSaasOracleIpByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.SaasOracleIp{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateSaasOracleIp 更新SaasOracleIp记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ipService *SaasOracleIpService) UpdateSaasOracleIp(saas_oracle_ip saasdb.SaasOracleIp) (err error) {
	err = global.GVA_DB.Save(&saas_oracle_ip).Error
	return err
}

// GetSaasOracleIp 根据id获取SaasOracleIp记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ipService *SaasOracleIpService) GetSaasOracleIp(id uint) (saas_oracle_ip saasdb.SaasOracleIp, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&saas_oracle_ip).Error
	return
}

// GetSaasOracleIpInfoList 分页获取SaasOracleIp记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ipService *SaasOracleIpService) GetSaasOracleIpInfoList(info saasdbReq.SaasOracleIpSearch) (list []saasdb.SaasOracleIp, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&saasdb.SaasOracleIp{})
	var saas_oracle_ips []saasdb.SaasOracleIp
	// 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&saas_oracle_ips).Error
	return saas_oracle_ips, total, err
}
