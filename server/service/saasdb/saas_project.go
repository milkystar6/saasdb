package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/model/common/request"
    saasdbReq "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"
)

type ProjectService struct {
}

// CreateProject 创建Project记录
// Author [piexlmax](https://github.com/piexlmax)
func (prijectService *ProjectService) CreateProject(priject saasdb.Project) (err error) {
	err = global.GVA_DB.Create(&priject).Error
	return err
}

// DeleteProject 删除Project记录
// Author [piexlmax](https://github.com/piexlmax)
func (prijectService *ProjectService)DeleteProject(priject saasdb.Project) (err error) {
	err = global.GVA_DB.Delete(&priject).Error
	return err
}

// DeleteProjectByIds 批量删除Project记录
// Author [piexlmax](https://github.com/piexlmax)
func (prijectService *ProjectService)DeleteProjectByIds(ids request.IdsReq) (err error) {
	err = global.GVA_DB.Delete(&[]saasdb.Project{},"id in ?",ids.Ids).Error
	return err
}

// UpdateProject 更新Project记录
// Author [piexlmax](https://github.com/piexlmax)
func (prijectService *ProjectService)UpdateProject(priject saasdb.Project) (err error) {
	err = global.GVA_DB.Save(&priject).Error
	return err
}

// GetProject 根据id获取Project记录
// Author [piexlmax](https://github.com/piexlmax)
func (prijectService *ProjectService)GetProject(id uint) (priject saasdb.Project, err error) {
	err = global.GVA_DB.Where("id = ?", id).First(&priject).Error
	return
}

// GetProjectInfoList 分页获取Project记录
// Author [piexlmax](https://github.com/piexlmax)
func (prijectService *ProjectService)GetProjectInfoList(info saasdbReq.ProjectSearch) (list []saasdb.Project, total int64, err error) {
	limit := info.PageSize
	offset := info.PageSize * (info.Page - 1)
    // 创建db
	db := global.GVA_DB.Model(&saasdb.Project{})
    var prijects []saasdb.Project
    // 如果有条件搜索 下方会自动创建搜索语句
	err = db.Count(&total).Error
	if err!=nil {
    	return
    }
	err = db.Limit(limit).Offset(offset).Find(&prijects).Error
	return  prijects, total, err
}
