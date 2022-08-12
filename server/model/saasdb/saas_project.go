// 自动生成模板Project
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

// Project 结构体
type Project struct {
	global.GVA_MODEL
	ProjName     string `json:"projName" form:"projName" gorm:"column:proj_name;comment:项目名称;uniqueIndex:proj_name"`
	NotifyUsers  string `json:"notifyUsers" form:"notifyUsers" gorm:"column:notify_users;comment:项目操作通知的用户列表，如无设置则仅通知给操作人;"`
	AlarmGroupId *int   `json:"alarmGroupId" form:"alarmGroupId" gorm:"column:alarm_group_id;comment:关联AlarmGroup表;"`
	// foreignkey 关联 domain集群表 foreignkey指向外键 references:指向自己到字段
	Domains []Domain `json:"domain_list" gorm:"foreignKey:ProjId;"`
}

// TableName Project 表名
func (Project) TableName() string {
	return "saas_project"
}
