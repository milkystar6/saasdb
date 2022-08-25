package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type BackLogService struct {
}

// CreateBackLog 创建BackLog记录
// Author [piexlmax](https://github.com/piexlmax)
func (BackupLogService *BackLogService) CreateBackLog(BackupLog saasdb.BackLog) (err error) {
	err = global.GVA_DB.Create(&BackupLog).Error
	return err
}

// DeleteBackLog 删除BackLog记录
// Author [piexlmax](https://github.com/piexlmax)
func (BackupLogService *BackLogService)DeleteBackLog(BackupLog saasdb.BackLog) (err error) {
	err = global.GVA_DB.Delete(&BackupLog).Error
	return err
}

// DeleteBackLogByIds 批量删除BackLog记录
// Author [piexlmax](https://github.com/piexlmax)
func (BackupLogService *BackLogService)DeleteBackLogByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.BackLog{},"id in ?",ids.Ids).Error
	return err
}

// UpdateBackLog 更新BackLog记录
// Author [piexlmax](https://github.com/piexlmax)
func (BackupLogService *BackLogService)UpdateBackLog(BackupLog saasdb.BackLog) (err error) {
	err = global.GVA_DB.Save(&BackupLog).Error
	return err
}

// GetBackLog 根据id获取BackLog记录
// Author [piexlmax](https://github.com/piexlmax)
func (BackupLogService *BackLogService)GetBackLog(id uint) (BackupLog saasdb.BackLog, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&BackupLog).Error
	return
}

// GetBackLogInfoList 分页获取BackLog记录
// Author [piexlmax](https://github.com/piexlmax)
func (BackupLogService *BackLogService)GetBackLogInfoList(info saasdbReq.BackLogSearch) (list []saasdb.BackLog, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.BackLog{})
    var BackupLogs []saasdb.BackLog
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&BackupLogs).Error
	return  BackupLogs, total, err
}
