package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type HostService struct {
}

// CreateHost 创建Host记录
// Author [piexlmax](https://github.com/piexlmax)
func (hostService *HostService) CreateHost(host saasdb.Host) (err error) {
	err = global.GVA_DB.Create(&host).Error
	return err
}

// DeleteHost 删除Host记录
// Author [piexlmax](https://github.com/piexlmax)
func (hostService *HostService)DeleteHost(host saasdb.Host) (err error) {
	err = global.GVA_DB.Delete(&host).Error
	return err
}

// DeleteHostByIds 批量删除Host记录
// Author [piexlmax](https://github.com/piexlmax)
func (hostService *HostService)DeleteHostByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.Host{},"id in ?",ids.Ids).Error
	return err
}

// UpdateHost 更新Host记录
// Author [piexlmax](https://github.com/piexlmax)
func (hostService *HostService)UpdateHost(host saasdb.Host) (err error) {
	err = global.GVA_DB.Save(&host).Error
	return err
}

// GetHost 根据id获取Host记录
// Author [piexlmax](https://github.com/piexlmax)
func (hostService *HostService)GetHost(id uint) (host saasdb.Host, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&host).Error
	return
}

// GetHostInfoList 分页获取Host记录
// Author [piexlmax](https://github.com/piexlmax)
func (hostService *HostService)GetHostInfoList(info saasdbReq.HostSearch) (list []saasdb.Host, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.Host{})
    var hosts []saasdb.Host
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&hosts).Error
	return  hosts, total, err
}
