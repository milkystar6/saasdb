package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type InstanceService struct {
}

// CreateInstance 创建Instance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_instanceService *InstanceService) CreateInstance(saas_instance saasdb.Instance) (err error) {
	err = global.GVA_DB.Create(&saas_instance).Error
	return err
}

// DeleteInstance 删除Instance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_instanceService *InstanceService) DeleteInstance(saas_instance saasdb.Instance) (err error) {
	err = global.GVA_DB.Delete(&saas_instance).Error
	return err
}

// DeleteInstanceByIds 批量删除Instance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_instanceService *InstanceService) DeleteInstanceByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.Instance{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateInstance 更新Instance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_instanceService *InstanceService) UpdateInstance(saas_instance saasdb.Instance) (err error) {
	err = global.GVA_DB.Save(&saas_instance).Error
	return err
}

// GetInstance 根据id获取Instance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_instanceService *InstanceService) GetInstance(id uint) (saas_instance saasdb.Instance, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&saas_instance).Error
	return
}

// GetInstanceInfoList 分页获取Instance记录
// Author [piexlmax](https://github.com/piexlmax)
func (saas_instanceService *InstanceService) GetInstanceInfoList(info saasdbReq.InstanceSearch) (list []saasdb.Instance, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&saasdb.Instance{})
	var saas_instances []saasdb.Instance
	// 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&saas_instances).Error
	return saas_instances, total, err
}

// GetInstanceInfoByDomainID 分页获取某个集群的所有Instance记录
func (saas_instanceService *InstanceService) GetInstanceInfoByDomainID(domainId *int) (list []saasdb.Instance, total int64, err error) {
	// 创建db
	db := global.GVA_DB.Model(&saasdb.Instance{})
	var saas_instances []saasdb.Instance

	err = db.Where("domain_id=?", &domainId).Find(&saas_instances).Count(&total).Error

	return saas_instances, total, err
}
