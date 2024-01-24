package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type SaasOracleInstanceService struct {
}

// CreateSaasOracleInstance 创建SaasOracleInstance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_instanceService *SaasOracleInstanceService) CreateSaasOracleInstance(saas_oracle_instance saasdb.SaasOracleInstance) (err error) {
	err = global.GVA_DB.Create(&saas_oracle_instance).Error
	return err
}

// DeleteSaasOracleInstance 删除SaasOracleInstance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_instanceService *SaasOracleInstanceService)DeleteSaasOracleInstance(saas_oracle_instance saasdb.SaasOracleInstance) (err error) {
	err = global.GVA_DB.Delete(&saas_oracle_instance).Error
	return err
}

// DeleteSaasOracleInstanceByIds 批量删除SaasOracleInstance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_instanceService *SaasOracleInstanceService)DeleteSaasOracleInstanceByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.SaasOracleInstance{},"id in ?",ids.Ids).Error
	return err
}

// UpdateSaasOracleInstance 更新SaasOracleInstance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_instanceService *SaasOracleInstanceService)UpdateSaasOracleInstance(saas_oracle_instance saasdb.SaasOracleInstance) (err error) {
	err = global.GVA_DB.Save(&saas_oracle_instance).Error
	return err
}

// GetSaasOracleInstance 根据id获取SaasOracleInstance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_instanceService *SaasOracleInstanceService)GetSaasOracleInstance(id uint) (saas_oracle_instance saasdb.SaasOracleInstance, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&saas_oracle_instance).Error
	return
}

// GetSaasOracleInstanceInfoList 分页获取SaasOracleInstance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_instanceService *SaasOracleInstanceService)GetSaasOracleInstanceInfoList(info saasdbReq.SaasOracleInstanceSearch) (list []saasdb.SaasOracleInstance, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.SaasOracleInstance{})
    var saas_oracle_instances []saasdb.SaasOracleInstance
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&saas_oracle_instances).Error
	return  saas_oracle_instances, total, err
}
