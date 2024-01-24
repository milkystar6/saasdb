package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type SaasDictumService struct {
}

// CreateSaasDictum 创建SaasDictum记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_dictumService *SaasDictumService) CreateSaasDictum(saas_dictum saasdb.SaasDictum) (err error) {
	err = global.GVA_DB.Create(&saas_dictum).Error
	return err
}

// DeleteSaasDictum 删除SaasDictum记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_dictumService *SaasDictumService)DeleteSaasDictum(saas_dictum saasdb.SaasDictum) (err error) {
	err = global.GVA_DB.Delete(&saas_dictum).Error
	return err
}

// DeleteSaasDictumByIds 批量删除SaasDictum记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_dictumService *SaasDictumService)DeleteSaasDictumByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.SaasDictum{},"id in ?",ids.Ids).Error
	return err
}

// UpdateSaasDictum 更新SaasDictum记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_dictumService *SaasDictumService)UpdateSaasDictum(saas_dictum saasdb.SaasDictum) (err error) {
	err = global.GVA_DB.Save(&saas_dictum).Error
	return err
}

// GetSaasDictum 根据id获取SaasDictum记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_dictumService *SaasDictumService)GetSaasDictum(id uint) (saas_dictum saasdb.SaasDictum, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&saas_dictum).Error
	return
}

// GetSaasDictumInfoList 分页获取SaasDictum记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_dictumService *SaasDictumService)GetSaasDictumInfoList(info saasdbReq.SaasDictumSearch) (list []saasdb.SaasDictum, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.SaasDictum{})
    var saas_dictums []saasdb.SaasDictum
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&saas_dictums).Error
	return  saas_dictums, total, err
}
