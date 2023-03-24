package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type BackUpCenter struct {
	global.GVA_MODEL
	CenterAddr string `json:"center_addr" form:"center_addr" gorm:"column:center_addr;comment:备份服务器地址"`
	CenterPort *int   `json:"center_port" form:"center_prt" gorm:"column:center_port;comment:备份服务器远程访问地址"`
	BackUpType string `json:"backup_type" form:"backup_type" gorm:"column:backup_type;comment:类型"`
	// backup root directory
	BackUpRootDir string `json:"backup_root_dir" form:"backup_root_dir" gorm:"column:backup_root_dir;comment:备份根目录"`
}

// TableName Instance 表名
func (BackUpCenter) TableName() string {
	return "saas_backup_center"
}
