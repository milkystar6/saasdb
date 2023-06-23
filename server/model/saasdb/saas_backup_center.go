package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type BackUpCenter struct {
	global.GVA_MODEL
	StorageName string `json:"storage_name,omitempty" form:"storage_name" gorm:"column:storage_name;type:varchar(50)"`
	CenterAddr  string `json:"center_addr" form:"center_addr" gorm:"column:center_addr;comment:备份服务器地址"`
	CenterPort  *int   `json:"center_port" form:"center_prt" gorm:"column:center_port;comment:备份服务器远程访问地址"`
	BackUpType  string `json:"backup_type" form:"backup_type" gorm:"column:backup_type;comment:类型"`
	// backup root directory
	BackUpRootDir string `json:"backup_root_dir" form:"backup_root_dir" gorm:"column:backup_root_dir;comment:备份根目录"`
	OnWorking     *int   `json:"on_working,omitempty" form:"on_working" gorm:"column:on_working;type:int(1);comment:是否继续使用，比如某些场景下，空间满了，先不向这里备份数据"`
	LoginUser     string `json:"login_user,omitempty" form:"login_user" gorm:"column:login_user;type:varchar(255) not null default 'root';comment:登录用户"`
	LoginPassword string `json:"login_password,omitempty" form:"login_password" gorm:"column:login_password;type:varchar(255) default null"`
	//SshPort       *int   `json:"ssh_port,omitempty" form:"ssh_port" gorm:"column:ssh_port;type:int(10) not null default 22"`
	IdcId *int `json:"idc_id,omitempty" form:"idc_id" gorm:"column:idc_id;type:int(10) not null default 2;comment:idc id"`
}

// TableName Instance 表名
func (BackUpCenter) TableName() string {
	return "saas_backup_center"
}
