package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type OggInfoService struct {
}

// CreateOggInfo 创建OggInfo记录
// Author [piexlmax](https://github.com/piexlmax)
func (oggInfoService *OggInfoService) CreateOggInfo(oggInfo saasdb.OggInfo) (err error) {
	err = global.GVA_DB.Create(&oggInfo).Error
	return err
}

// DeleteOggInfo 删除OggInfo记录
// Author [piexlmax](https://github.com/piexlmax)
func (oggInfoService *OggInfoService)DeleteOggInfo(oggInfo saasdb.OggInfo) (err error) {
	err = global.GVA_DB.Delete(&oggInfo).Error
	return err
}

// DeleteOggInfoByIds 批量删除OggInfo记录
// Author [piexlmax](https://github.com/piexlmax)
func (oggInfoService *OggInfoService)DeleteOggInfoByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.OggInfo{},"id in ?",ids.Ids).Error
	return err
}

// UpdateOggInfo 更新OggInfo记录
// Author [piexlmax](https://github.com/piexlmax)
func (oggInfoService *OggInfoService)UpdateOggInfo(oggInfo saasdb.OggInfo) (err error) {
	err = global.GVA_DB.Save(&oggInfo).Error
	return err
}

// GetOggInfo 根据id获取OggInfo记录
// Author [piexlmax](https://github.com/piexlmax)
func (oggInfoService *OggInfoService)GetOggInfo(id uint) (oggInfo saasdb.OggInfo, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&oggInfo).Error
	return
}

// GetOggInfoInfoList 分页获取OggInfo记录
// Author [piexlmax](https://github.com/piexlmax)
func (oggInfoService *OggInfoService)GetOggInfoInfoList(info saasdbReq.OggInfoSearch) (list []saasdb.OggInfo, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.OggInfo{})
    var oggInfos []saasdb.OggInfo
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&oggInfos).Error
	return  oggInfos, total, err
}
