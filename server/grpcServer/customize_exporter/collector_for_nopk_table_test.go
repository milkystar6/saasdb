package customize_exporter

import (
	"fmt"
	al "github.com/flipped-aurora/gin-vue-admin/server/grpcServer/agent_logger"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"strings"
	"testing"
)

/*
1、巡检是否含有无主键表
2、巡检是否含有主键类型是非int类型的字段
*/
var testCollectorSQL string

const (
	testHasPk     = "Primary Key"
	testNoPk      = "no primary key"
	testTypeIntPk = "int"
)

// 查询主键不是INT类型的表
type testTb struct {
	TableSchema string `gorm:"column:TABLE_SCHEMA"`
	TableName   string `gorm:"column:TABLE_NAME"`
	PrimaryKey  string `gorm:"column:PRIMARY_KEY"`
}

var testTbs []testTb

func testConnLocalMySQL(cfg dbConnCfg) *gorm.DB {
	dbCfg := dbConnCfg{
		User:   cfg.User,
		Passwd: cfg.Passwd,
		Host:   cfg.Host,
		Port:   cfg.Port,
		Db:     cfg.Db,
	}
	fmt.Println(dbCfg)
	return testNewConn(dbCfg)
}

func testNewConn(cfg dbConnCfg) (db *gorm.DB) {
	// 用户名:密码@tcp(ip:port)/数据库?charset=utf8mb4&parseTime=True&loc=Local
	dsn := fmt.Sprintf("%v:%v@tcp(%v:%v)/%v?charset=utf8mb4&parseTime=True&loc=Local&timeout=10s&readTimeout=10s&writeTimeout=10s", cfg.User, cfg.Passwd, cfg.Host, cfg.Port, cfg.Db)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{SkipDefaultTransaction: true})
	// TODO 错误处理 不panic 统计日志记录格式
	if err != nil {
		al.Error(fmt.Sprintf("Conn mysql :%v failed,err:%v\n", dsn, err))
	}

	// 注意要手动关闭db db.DB.close()

	return db
}
func TestFunctionnoPkTable(t *testing.T) {
	testCfg := dbConnCfg{
		User:   "root",
		Passwd: "letsg0",
		Host:   "127.0.0.1",
		Port:   3307,
		Db:     "information_schema",
	}
	db := testConnLocalMySQL(testCfg)
	sql := `
SELECT 
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
ORDER BY T.TABLE_SCHEMA, T.TABLE_NAME;
`
	db.Debug().Raw(sql).Scan(&testTbs)

	noIntPkTbs := make([]interface{}, 0)
	noPkTbs := make([]interface{}, 0)
	for _, table := range testTbs {
		//fmt.Printf("表名：%s.%s\t主键：%s\n", table.TableSchema, table.TableName, table.PrimaryKey)

		// 检查主键是否不是INT类型 ==> 有主键，主键不为int
		if !strings.Contains(strings.ToLower(table.PrimaryKey), testTypeIntPk) && !strings.Contains(strings.ToLower(table.PrimaryKey), testNoPk) {
			//fmt.Printf("发现不包含INT类型的主键：%s.%s\n", table.TableSchema, table.TableName)
			noIntPkTbs = append(noIntPkTbs, table)
			// 检查主键是否存在 ==> 无主键
		} else if strings.Contains(strings.ToLower(table.PrimaryKey), testNoPk) {
			noPkTbs = append(noPkTbs, table)
		}

	}

	printSlice(noIntPkTbs)
	printSlice(noPkTbs)

	// test close db
	a, err := db.DB()
	err = a.Close()
	if err != nil {
		return
	}

	b := 0
	e := db.Raw("select 1").Scan(&b).Error
	fmt.Println(b)
	fmt.Println(e)
}

func printSlice(a []interface{}) {
	for _, v := range a {
		fmt.Println(v)
	}

}
