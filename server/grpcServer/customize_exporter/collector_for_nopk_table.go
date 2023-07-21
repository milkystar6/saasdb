package customize_exporter

import "C"
import (
	"fmt"
	"strings"
)

var collectorSQL string

const (
	hasPk     = "Primary Key"
	noPk      = "no primary key"
	typeIntPk = "int"
)

// 查询主键不是INT类型的表
type tb struct {
	TableSchema string `gorm:"column:TABLE_SCHEMA"`
	TableName   string `gorm:"column:TABLE_NAME"`
	PrimaryKey  string `gorm:"column:PRIMARY_KEY"`
}

var tbs []tb

func (c *CustomizeCollector) functionPkTable(cfg dbConnCfg) ([]interface{}, []interface{}, error) {

	db := c.connLocalMySQL(cfg)
	collectorSQL = `SELECT 
  T.TABLE_SCHEMA,
  T.TABLE_NAME,
  CASE
    WHEN PK.CONSTRAINT_NAME IS NULL THEN 'No Primary Key'
    ELSE CONCAT(PK.COLUMN_NAME, ' (', PK.DATA_TYPE, ')')
  END AS PRIMARY_KEY
FROM INFORMATION_SCHEMA.TABLES AS T
LEFT JOIN (
  SELECT 
    KCU.CONSTRAINT_NAME,
    KCU.TABLE_SCHEMA,
    KCU.TABLE_NAME,
    KCU.COLUMN_NAME,
    C.DATA_TYPE
  FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU
  JOIN INFORMATION_SCHEMA.COLUMNS AS C 
    ON KCU.TABLE_SCHEMA = C.TABLE_SCHEMA 
    AND KCU.TABLE_NAME = C.TABLE_NAME 
    AND KCU.COLUMN_NAME = C.COLUMN_NAME
  WHERE 
    KCU.CONSTRAINT_NAME = 'PRIMARY'
    AND C.DATA_TYPE != 'INT'
) AS PK ON 
  PK.TABLE_SCHEMA = T.TABLE_SCHEMA
  AND PK.TABLE_NAME = T.TABLE_NAME
WHERE 
  T.TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema', 'sys')
  AND T.TABLE_TYPE = 'BASE TABLE'
ORDER BY T.TABLE_SCHEMA, T.TABLE_NAME;`

	db.Debug().Raw(collectorSQL).Scan(&tbs)

	noIntPkTbs := make([]interface{}, 0)
	noPkTbs := make([]interface{}, 0)
	for _, table := range tbs {
		//fmt.Printf("表名：%s.%s\t主键：%s\n", table.TableSchema, table.TableName, table.PrimaryKey)

		// 检查主键是否不是INT类型 ==> 有主键，主键不为int
		if !strings.Contains(strings.ToLower(table.PrimaryKey), typeIntPk) && !strings.Contains(strings.ToLower(table.PrimaryKey), noPk) {
			//fmt.Printf("发现不包含INT类型的主键：%s.%s\n", table.TableSchema, table.TableName)
			noIntPkTbs = append(noIntPkTbs, table)
			// 检查主键是否存在 ==> 无主键
		} else if strings.Contains(strings.ToLower(table.PrimaryKey), noPk) {
			noPkTbs = append(noPkTbs, table)
		}

	}

	a, _ := db.DB()
	return noPkTbs, noIntPkTbs, fmt.Errorf("%v", a.Close())
}
