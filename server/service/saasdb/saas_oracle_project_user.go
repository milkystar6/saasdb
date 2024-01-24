package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type SaasOracleProjectUserService struct {
}

// CreateSaasOracleProjectUser 创建SaasOracleProjectUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_project_userService *SaasOracleProjectUserService) CreateSaasOracleProjectUser(saas_oracle_project_user saasdb.SaasOracleProjectUser) (err error) {
	err = global.GVA_DB.Create(&saas_oracle_project_user).Error
	return err
}

// DeleteSaasOracleProjectUser 删除SaasOracleProjectUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_project_userService *SaasOracleProjectUserService)DeleteSaasOracleProjectUser(saas_oracle_project_user saasdb.SaasOracleProjectUser) (err error) {
	err = global.GVA_DB.Delete(&saas_oracle_project_user).Error
	return err
}

// DeleteSaasOracleProjectUserByIds 批量删除SaasOracleProjectUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_project_userService *SaasOracleProjectUserService)DeleteSaasOracleProjectUserByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.SaasOracleProjectUser{},"id in ?",ids.Ids).Error
	return err
}

// UpdateSaasOracleProjectUser 更新SaasOracleProjectUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_project_userService *SaasOracleProjectUserService)UpdateSaasOracleProjectUser(saas_oracle_project_user saasdb.SaasOracleProjectUser) (err error) {
	err = global.GVA_DB.Save(&saas_oracle_project_user).Error
	return err
}

// GetSaasOracleProjectUser 根据id获取SaasOracleProjectUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_project_userService *SaasOracleProjectUserService)GetSaasOracleProjectUser(id uint) (saas_oracle_project_user saasdb.SaasOracleProjectUser, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&saas_oracle_project_user).Error
	return
}

// GetSaasOracleProjectUserInfoList 分页获取SaasOracleProjectUser记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_oracle_project_userService *SaasOracleProjectUserService)GetSaasOracleProjectUserInfoList(info saasdbReq.SaasOracleProjectUserSearch) (list []saasdb.SaasOracleProjectUser, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.SaasOracleProjectUser{})
    var saas_oracle_project_users []saasdb.SaasOracleProjectUser
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&saas_oracle_project_users).Error
	return  saas_oracle_project_users, total, err
}
