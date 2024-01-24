// 自动生成模板SaasDictum
package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	
)

// SaasDictum 结构体
type SaasDictum struct {
      global.GVA_MODEL
      Contents  string `json:"contents" form:"contents" gorm:"column:contents;comment:内容;"`
      Status  *int `json:"status" form:"status" gorm:"column:status;comment:状态 0不启用 1启用;"`
}


// TableName SaasDictum 表名
func (SaasDictum) TableName() string {
  return "saas_dictum"
}

