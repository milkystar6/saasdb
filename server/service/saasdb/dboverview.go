package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type DBOverViewService struct {
}
type DBOverView struct {
	// 用于存储数据库返回数据
	DBApplication         string `json:"db_application" gorm:"column:db_application"`
	TotalDomainCount      int    `json:"total_domain_count" gorm:"column:total_domain_count"`
	TotalInstanceCount    int    `json:"total_instance_count" gorm:"column:total_instance_count"`
	NormalInstanceCount   int    `json:"normal_instance_count" gorm:"column:normal_instance_count"`
	AbnormalInstanceCount int    `json:"abnormal_instance_count" gorm:"column:abnormal_instance_count"`
}

func (s *DBOverViewService) GetDBOverView() (DBOverView, error) {
	sql := `
SELECT
  si.application,
  COUNT(DISTINCT sd.id) AS total_domain_count,
  COUNT(*) AS total_instance_count,
  COUNT(CASE WHEN si.health IN ('available', 'standby') THEN 1 END) AS normal_instance_count,
  COUNT(CASE WHEN si.health NOT IN ('available', 'standby') THEN 1 END) AS abnormal_instance_count
FROM
  saas_domain sd
JOIN
  saas_instance si ON sd.id = si.domain_id
GROUP BY
  si.application;

`
	var d DBOverView
	err := global.GVA_DB.Raw(sql).Scan(&d).Error
	return d, err
}
