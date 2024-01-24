package saasdb

import (
	"github.com/flipped-aurora/gin-vue-admin/server/global"
)

type DBOverViewService struct {
}
type DBOverView struct {
	// 用于存储数据库返回数据
	DBApplication         string `json:"dbApplication" gorm:"column:db_application"`
	TotalDomainCount      int    `json:"totalDomainCount" gorm:"column:total_domain_count"`
	TotalInstanceCount    int    `json:"totalInstanceCount" gorm:"column:total_instance_count"`
	NormalInstanceCount   int    `json:"normalInstanceCount" gorm:"column:normal_instance_count"`
	AbnormalInstanceCount int    `json:"abnormalInstanceCount" gorm:"column:abnormal_instance_count"`
}

func (s *DBOverViewService) GetDBOverView() ([]DBOverView, error) {
	sql := `
SELECT
  si.application AS db_application,
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
	var d []DBOverView
	err := global.GVA_DB.Raw(sql).Scan(&d).Error
	//a := fmt.Sprintf("%v", d)
	//global.GVA_LOG.Info(sql + a)
	return d, err
}
