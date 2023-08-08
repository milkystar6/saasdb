package customize_exporter

/* 统计 variables 或者 status*/
import (
	"fmt"
	"gorm.io/gorm"
)

const nilValue = ""

type searchVar struct {
	VariableName string `json:"variable_name,omitempty" gorm:"column:Variable_name"`
	Value        string `json:"value,omitempty" gorm:"column:Value"`
}

func (c *CustomizeCollector) GetVariables(db *gorm.DB, v string, mode int) string {

	var sql string
	if mode == 0 {
		sql = fmt.Sprintf("SHOW VARIABLES LIKE '%v'", v)
	} else if mode == 1 {
		sql = fmt.Sprintf("SHOW GLOBAL VARIABLES LIKE '%v'", v)
	}

	var variables searchVar
	err := db.Debug().Raw(sql).Scan(&variables).Error
	if err == nil {
		return variables.Value
	}
	return nilValue
}

func (c *CustomizeCollector) GetVariablesFuzzyMatching(db *gorm.DB, v string, mode int) []searchVar {

	var sql string
	if mode == 0 {
		sql = fmt.Sprintf("SHOW VARIABLES LIKE '%%%s%%'", v)
	} else if mode == 1 {
		sql = fmt.Sprintf("SHOW GLOBAL VARIABLES LIKE '%%%s%%'", v)
	}

	var variables []searchVar
	err := db.Debug().Raw(sql).Scan(&variables).Error
	if err == nil {
		return variables
	}
	return nil
}

func (c *CustomizeCollector) GetStatus(db *gorm.DB, v string, mode int) string {

	var sql string
	if mode == 0 {
		sql = fmt.Sprintf("SHOW STATUS LIKE '%v'", v)
	} else if mode == 1 {
		sql = fmt.Sprintf("SHOW GLOBAL STATUS LIKE '%v'", v)
	}

	var variables searchVar
	err := db.Debug().Raw(sql).Scan(&variables).Error
	if err == nil {
		return variables.Value
	}
	return nilValue
}

func (c *CustomizeCollector) GetStatusFuzzyMatching(db *gorm.DB, v string, mode int) []searchVar {

	var sql string
	if mode == 0 {
		sql = fmt.Sprintf("SHOW STATUS LIKE '%%%s%%'", v)
	} else if mode == 1 {
		sql = fmt.Sprintf("SHOW GLOBAL STATUS LIKE '%%%s%%'", v)
	}

	var variables []searchVar
	err := db.Debug().Raw(sql).Scan(&variables).Error
	if err == nil {
		return variables
	}
	return nil
}
