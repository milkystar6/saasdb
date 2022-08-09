// 自动生成模板Project
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
)

// Project 结构体
type Project struct {
      global.GVA_MODEL
      ProjId  *int `json:"projId" form:"projId" gorm:"column:proj_id;comment:项目代号;"`
      ProjName  string `json:"projName" form:"projName" gorm:"column:proj_name;comment:项目名称;"`
      NotifyUsers  string `json:"notifyUsers" form:"notifyUsers" gorm:"column:notify_users;comment:项目操作通知的用户列表，如无设置则仅通知给操作人;"`
      AlarmGroupId  *int `json:"alarmGroupId" form:"alarmGroupId" gorm:"column:alarm_group_id;comment:关联AlarmGroup表;"`
}


// TableName Project 表名
func (Project) TableName() string {
  return "project"
}

