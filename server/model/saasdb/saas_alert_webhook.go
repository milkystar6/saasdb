package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"gorm.io/gorm"
)

type SaasAlertWebhook struct {
	global.GVA_MODEL
	WebhookUrl string `json:"webhook_url,omitempty" form:"webhook_url" gorm:"column:webhook_url;type:varchar(500);comment:webhook url"`
	Secret     string `json:"secret,omitempty" form:"secret" gorm:"column:secret;type:varchar(500);comment:secret if has"`
	Tag        string `json:"tag,omitempty" form:"tag" gorm:"column:tag;comment:tag"`
	Comment    string `json:"comment,omitempty" form:"comment" gorm:"column:comment;comment:备注"`
	ProjId     *int   `json:"projId" form:"projId" gorm:"column:proj_id;comment:;"`
}

func (a *SaasAlertWebhook) TableName() string {
	return "saas_alert_webhook"
}

func (a *SaasAlertWebhook) GetHookInfo(db *gorm.DB) (SaasAlertWebhook, error) {
	//db1 := db.Session(&gorm.Session{DryRun: true}).Table(a.TableName())
	////db1.Debug().Model(a).Where("tag = ?", a.Tag).First(&a)
	//db.Debug()
	//db.AutoMigrate(&a)
	err := db.Model(&a).Table(a.TableName()).Where("tag = ?", a.Tag).First(a).Error
	return *a, err
}
