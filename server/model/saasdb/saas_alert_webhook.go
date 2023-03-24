package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type AlertWebhook struct {
	global.GVA_MODEL
	WebhookUrl string `json:"webhook_url,omitempty" form:"webhook_url" gorm:"column:webhook_url;type:varchar(500);comment:webhook url"`
	Secret     string `json:"secret,omitempty" form:"secret" gorm:"column:secret;type:varchar(500);comment:secret if has"`
	Tag        string `json:"tag,omitempty" form:"tag" gorm:"column:tag;comment:tag"`
	Comment    string `json:"comment,omitempty" form:"comment" gorm:"column:comment;comment:备注"`
}

func (AlertWebhook) TableName() string {
	return "saas_alert_webhook"
}
