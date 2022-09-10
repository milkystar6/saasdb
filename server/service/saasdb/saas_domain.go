package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type DomainService struct {
}

// CreateDomain 创建Domain记录
// Author [piexlmax](https://github.com/piexlmax)
func (domainService *DomainService) CreateDomain(domain saasdb.Domain) (err error) {
	// TODO 运行之前 先检查projid对应的项目是否已经创建 或者是前端直接展示出来 可以选的有哪些项目
	err = global.GVA_DB.Create(&domain).Error
	return err
}

// DeleteDomain 删除Domain记录
// Author [piexlmax](https://github.com/piexlmax)
func (domainService *DomainService) DeleteDomain(domain saasdb.Domain) (err error) {
	err = global.GVA_DB.Delete(&domain).Error
	return err
}

// DeleteDomainByIds 批量删除Domain记录
// Author [piexlmax](https://github.com/piexlmax)
func (domainService *DomainService) DeleteDomainByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.Domain{}, "id in ?", ids.Ids).Error
	return err
}

// UpdateDomain 更新Domain记录
// Author [piexlmax](https://github.com/piexlmax)
func (domainService *DomainService) UpdateDomain(domain saasdb.Domain) (err error) {
	err = global.GVA_DB.Save(&domain).Error
	return err
}

// GetDomain 根据id获取Domain记录
// Author [piexlmax](https://github.com/piexlmax)
func (domainService *DomainService) GetDomain(id uint) (domain saasdb.Domain, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&domain).Error
	return
}

// GetDomainInfoList 分页获取Domain记录
// Author [piexlmax](https://github.com/piexlmax)
func (domainService *DomainService) GetDomainInfoList(info saasdbReq.DomainSearch) (list []saasdb.Domain, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&saasdb.Domain{})
	var domains []saasdb.Domain
	// 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	err = db.Limit(limit).Offset(offset).Find(&domains).Error
	return domains, total, err
}

// GetDomainInfoList join `saasdb`.`saas_project`表,根据proj_id字段关联,分页获取Domain记录
func (domainService *DomainService) GetDomainInfoListv2(info saasdbReq.DomainJoinSearch) (list []saasdbReq.DomainJoinSearch, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
	// 创建db
	db := global.GVA_DB.Model(&saasdb.Domain{})
	var domains []saasdbReq.DomainJoinSearch
	// 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err != nil {
		return
	}
	//err = db.Limit(limit).Offset(offset).Find(&domains).Error
	joinsql := "SELECT A.id, A.domain_id ,A.domain_name, A.proj_id ,B.proj_name ,A.vip ,A.dns FROM saas_domain A , saas_project B WHERE A.proj_id=B.id AND A.deleted_at IS NULL"
	err = db.Limit(limit).Offset(offset).Raw(joinsql).Scan(&domains).Error
	return domains, total, err
}
