package global

import (
	"time"

	"gorm.io/gorm"
)

type GVA_MODEL struct {
	ID        uint           `gorm:"primary_key"`                                                                                                // 主键ID
	CreatedAt time.Time      `gorm:"column:create_at;type:datetime NOT NULL DEFAULT CURRENT_TIMESTAMP;comment:插入时间"`                             // 创建时间
	UpdatedAt time.Time      `gorm:"column:update_at;type:datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;comment:插入时间"` // 更新时间
	DeletedAt gorm.DeletedAt `gorm:"index" json:"-"`                                                                                             // 删除时间
}
