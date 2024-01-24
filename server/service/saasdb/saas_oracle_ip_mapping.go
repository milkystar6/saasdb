package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type SaasOracleIpMappingService struct {
}

// CreateSaasOracleIpMapping 创建SaasOracleIpMapping记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ip_mappingService *SaasOracleIpMappingService) CreateSaasOracleIpMapping(saas_oracle_ip_mapping saasdb.SaasOracleIpMapping) (err error) {
	err = global.GVA_DB.Create(&saas_oracle_ip_mapping).Error
	return err
}

// DeleteSaasOracleIpMapping 删除SaasOracleIpMapping记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ip_mappingService *SaasOracleIpMappingService)DeleteSaasOracleIpMapping(saas_oracle_ip_mapping saasdb.SaasOracleIpMapping) (err error) {
	err = global.GVA_DB.Delete(&saas_oracle_ip_mapping).Error
	return err
}

// DeleteSaasOracleIpMappingByIds 批量删除SaasOracleIpMapping记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ip_mappingService *SaasOracleIpMappingService)DeleteSaasOracleIpMappingByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.SaasOracleIpMapping{},"id in ?",ids.Ids).Error
	return err
}

// UpdateSaasOracleIpMapping 更新SaasOracleIpMapping记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ip_mappingService *SaasOracleIpMappingService)UpdateSaasOracleIpMapping(saas_oracle_ip_mapping saasdb.SaasOracleIpMapping) (err error) {
	err = global.GVA_DB.Save(&saas_oracle_ip_mapping).Error
	return err
}

// GetSaasOracleIpMapping 根据id获取SaasOracleIpMapping记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ip_mappingService *SaasOracleIpMappingService)GetSaasOracleIpMapping(id uint) (saas_oracle_ip_mapping saasdb.SaasOracleIpMapping, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&saas_oracle_ip_mapping).Error
	return
}

// GetSaasOracleIpMappingInfoList 分页获取SaasOracleIpMapping记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_ip_mappingService *SaasOracleIpMappingService)GetSaasOracleIpMappingInfoList(info saasdbReq.SaasOracleIpMappingSearch) (list []saasdb.SaasOracleIpMapping, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.SaasOracleIpMapping{})
    var saas_oracle_ip_mappings []saasdb.SaasOracleIpMapping
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&saas_oracle_ip_mappings).Error
	return  saas_oracle_ip_mappings, total, err
}
