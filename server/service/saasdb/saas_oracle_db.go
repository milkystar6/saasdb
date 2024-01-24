package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type SaasOracleDbService struct {
}

// CreateSaasOracleDb 创建SaasOracleDb记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_dbService *SaasOracleDbService) CreateSaasOracleDb(saas_oracle_db saasdb.SaasOracleDb) (err error) {
	err = global.GVA_DB.Create(&saas_oracle_db).Error
	return err
}

// DeleteSaasOracleDb 删除SaasOracleDb记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_dbService *SaasOracleDbService)DeleteSaasOracleDb(saas_oracle_db saasdb.SaasOracleDb) (err error) {
	err = global.GVA_DB.Delete(&saas_oracle_db).Error
	return err
}

// DeleteSaasOracleDbByIds 批量删除SaasOracleDb记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_dbService *SaasOracleDbService)DeleteSaasOracleDbByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.SaasOracleDb{},"id in ?",ids.Ids).Error
	return err
}

// UpdateSaasOracleDb 更新SaasOracleDb记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_dbService *SaasOracleDbService)UpdateSaasOracleDb(saas_oracle_db saasdb.SaasOracleDb) (err error) {
	err = global.GVA_DB.Save(&saas_oracle_db).Error
	return err
}

// GetSaasOracleDb 根据id获取SaasOracleDb记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_dbService *SaasOracleDbService)GetSaasOracleDb(id uint) (saas_oracle_db saasdb.SaasOracleDb, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&saas_oracle_db).Error
	return
}

// GetSaasOracleDbInfoList 分页获取SaasOracleDb记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_dbService *SaasOracleDbService)GetSaasOracleDbInfoList(info saasdbReq.SaasOracleDbSearch) (list []saasdb.SaasOracleDb, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.SaasOracleDb{})
    var saas_oracle_dbs []saasdb.SaasOracleDb
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&saas_oracle_dbs).Error
	return  saas_oracle_dbs, total, err
}
