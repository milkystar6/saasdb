package customize_exporter

import (
	"bufio"
	"encoding/json"
	"fmt"
	al "github.com/flipped-aurora/gin-vue-admin/server/grpcServer/agent_logger"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"gorm.io/gorm"
	"os"
	"reflect"
	"regexp"
	"strings"
	"time"
)

const (
	bufferSize       = 4096
	readFileInterval = 1 * time.Second
	dbNamePattern    = "\\buse\\b"
)

var slowQueryEntry []string
var slowQueryInfo InsSlowQueryLog

// SlowQueryLog 用于分析和获取slow log
func (c *CustomizeCollector) SlowQueryLog() {
	cfg := config.LoadConfig
	localAddr := cfg.MyHostAddrInfo.MyIP

	csaas := c.connSaasdb()
	var ins mo.Instance
	portSlice, _ := ins.QueryPortsByIP(csaas, localAddr, keyForMySQL)

	for _, v := range portSlice {
		dbInformationSchema := dbConnCfg{
			Host: localAddr,
			Port: v,
			Db:   informationSchema,
		}
		go c.getSlowQueryLog(dbInformationSchema, csaas)
	}
}

func (c *CustomizeCollector) getSlowQueryLog(dbInformationSchema dbConnCfg, csaasdb *gorm.DB) {
	db := c.connLocalMySQL(dbInformationSchema)
	isSwitchOn := c.GetVariables(db, "slow_query_log", 0)
	slowQueryLogDir := c.GetVariables(db, "slow_query_log_file", 0)

	// 关闭db连接
	c.CloseDB(db)
	defer c.CloseDB(csaasdb)
	if strings.ToLower(isSwitchOn) == "off" {
		al.Info("未打开日志，协程结束")
		// 协程结束
	} else {
		al.Info("开始输出慢日志")
		slowQueryLogDir = "testfile.log"
		c.tailfSlowLog(slowQueryLogDir, dbInformationSchema, csaasdb)
	}
}

func (c *CustomizeCollector) tailfSlowLog(logFilePath string, dbInformationSchema dbConnCfg, csaasdb *gorm.DB) {

	/* 直接采集slow query log ==> 放弃
	复用show processlist
	1、获取slow query log 阈值 ，获取超过阈值session的sql文本内容 获取ID DB USER COMMAND TIME
	推送到webhook
	2、根据ID作为唯一标识，基于字段写入redis key ，使用redis hash类型
	key名称为 slow_query_log_{ip}_{port}_{process_id}
	收到重复的Key，则直接把key更新，并更新到clickhouse
	3、做一个消息抑制，统一设置slow log消息抑制时间

	把复杂的代码功能放到webhook去操作




	======================================
	推翻之前的，以上先留着




	还得继续使用tailfSlowLog
	*/
	for {
		watcher, err := NewSlowLogWatcher(logFilePath)
		if err != nil {
			al.Error(fmt.Sprintf("%v", err))
		}

		if watcher.TailSlowLog(dbInformationSchema, csaasdb) {
			// 需要重新加载文件
			// 1、关闭旧文件
			watcher.Close()

			// 2、创建新的 SlowLogWatcher 对象，以打开新文件
			newWatcher, err := NewSlowLogWatcher(logFilePath)
			if err != nil {
				al.Error(fmt.Sprintf("%v", err))
			}
			watcher = newWatcher

			continue
		}

		time.Sleep(readFileInterval)
	}

}

type SlowLogWatcher struct {
	filePath string
	file     *os.File
	offset   int64
}

func NewSlowLogWatcher(filePath string) (*SlowLogWatcher, error) {
	al.Info(fmt.Sprintf("分析文件%v", filePath))
	watcher := &SlowLogWatcher{
		filePath: filePath,
	}

	err := watcher.openFile()
	if err != nil {
		return nil, err
	}

	return watcher, nil
}

func (w *SlowLogWatcher) openFile() error {
	file, err := os.Open(w.filePath)
	if err != nil {
		return err
	}

	stat, err := file.Stat()
	if err != nil {
		return err
	}

	w.file = file
	w.offset = stat.Size()

	return nil
}

func (w *SlowLogWatcher) Close() {
	err := w.file.Close()
	if err != nil {
		return
	}
}

// TailSlowLog 持续监控 MySQL 慢查询日志文件的变化并处理新内容。
// 当文件发生“慢转储”时，返回 true，表示需要读取新的文件。
func (w *SlowLogWatcher) TailSlowLog(dbInformationSchema dbConnCfg, csaasdb *gorm.DB) bool {

	for {
		// init slow query info
		var nilSlowQueryInfo InsSlowQueryLog
		slowQueryInfo = nilSlowQueryInfo

		stat, err := os.Stat(w.filePath)
		if err != nil {
			al.Error(fmt.Sprintf("获取文件信息错误,most likely file has rotated , err: %v", err))
			time.Sleep(readFileInterval)
			continue
		}

		fmt.Println(stat.Size(), w.offset)
		time.Sleep(readFileInterval)

		// 如果当前 size > offset，说明文件有新的内容写入
		if stat.Size() > w.offset {
			// 文件有新内容，读取并处理新的行
			reader := bufio.NewReaderSize(w.file, bufferSize)
			_, err := w.file.Seek(w.offset, 0)
			if err != nil {
				al.Error(fmt.Sprintf("获取文件信息错误,err: %v", err))
				time.Sleep(readFileInterval)
				continue
			}

			for {
				line, err := reader.ReadString('\n')
				if err != nil {
					break
				}
				w.getSlowLogOutPut(line) // 这里是新增的slow log输出 最好是写到一个chan中，放结构体中。这里只是打印
				w.offset += int64(len(line))

			}

			if !IsEmptyStruct(slowQueryInfo) {
				//fmt.Println("获取到slow query log", slowQueryInfo)
				// 使用 encoding/json 包将结构体转换为 JSON 格式的字节数组
				slowQueryInfo.InsHost = dbInformationSchema.Host
				slowQueryInfo.InsPort = dbInformationSchema.Port
				jsonData, err := json.Marshal(slowQueryInfo)
				if err != nil {
					fmt.Println("转换为 JSON 时出错：", err)
				}

				// 将 JSON 数据打印出来
				fmt.Println(string(jsonData))
				SendMsg2WebHookWithApiUseJson(csaasdb, jsonData, "api/mysql_slow_query_log")
			}

		} else if stat.Size() == w.offset {
			// 文件未有追加内容
			time.Sleep(readFileInterval)
		} else if stat.Size() < w.offset {
			// 正常情况下只能是慢转储（文件旋转）
			// 标记文件已旋转，需要读取新的文件
			return true
		}

	}
}

func (w *SlowLogWatcher) getSlowLogOutPut(line string) {
	// 初始化 slowQueryEntry
	if slowQueryEntry == nil {
		slowQueryEntry = make([]string, 0)
	}
	// 以 "# Time: 为分隔符，把第一个匹配的行和下面的不匹配的行作为一个SQL"
	if strings.HasPrefix(line, "# Time:") {
		// 开始新的查询条目
		if len(slowQueryEntry) > 0 {
			// 处理上一个查询条目
			//processQueryEntry(slowQueryEntry)
			slowQueryEntry = append(slowQueryEntry, line)
		}
		// 初始化新的查询条目
		slowQueryEntry = []string{line}
	} else if slowQueryEntry != nil {
		// 继续累积查询条目的内容
		slowQueryEntry = append(slowQueryEntry, line)
	}

	// 处理最后一个查询条目
	if len(slowQueryEntry) > 0 {
		processQueryEntry(slowQueryEntry)
	}
}

func IsEmptyStruct(s interface{}) bool {
	// 使用反射获取结构体的值
	val := reflect.ValueOf(s)

	// 如果不是结构体类型，返回false
	if val.Kind() != reflect.Struct {
		return false
	}

	// 遍历结构体的字段，检查是否有非零值
	for i := 0; i < val.NumField(); i++ {
		field := val.Field(i)
		zeroValue := reflect.Zero(field.Type())

		// 如果字段的值不等于零值，表示结构体不为空
		if !reflect.DeepEqual(field.Interface(), zeroValue.Interface()) {
			return false
		}
	}

	// 结构体为空
	return true
}

func processQueryEntry(entry []string) {

	for _, line := range entry {

		if strings.HasPrefix(line, "# Time:") {
			slowQueryInfo.LogSlowEndTime = line
		}
		if strings.HasPrefix(line, "# User@Host:") {
			slowQueryInfo.UserHost = line
		}
		if strings.HasPrefix(line, "# Query_time:") {
			slowQueryInfo.QueryTime = line
		}
		if strings.HasPrefix(line, "use") {
			// 编译正则表达式
			re, err := regexp.Compile(dbNamePattern)
			if err != nil {
				fmt.Println("正则表达式编译失败:", err)
				return
			}
			if matchString(re, line) {
				slowQueryInfo.Db = strings.Split(line, "use ")[1]
			} else {
				slowQueryInfo.Db = "null"
			}
		}

	}

	// 提取实际的SQL查询语句
	sqlStatement := extractSQL(entry)
	slowQueryInfo.SqlTxt = sqlStatement

}

func matchString(re *regexp.Regexp, input string) bool {
	// 在输入字符串中查找匹配项
	if re.MatchString(input) {
		return true
	}
	return false
}

func extractSQL(entry []string) string {
	var sqlLines []string
	isSQLSection := false

	for _, line := range entry {
		if isSQLSection {
			// 如果已经进入SQL部分，累积SQL语句的行
			sqlLines = append(sqlLines, line)
		} else if strings.HasPrefix(strings.ToLower(line), "select") || strings.HasPrefix(strings.ToLower(line), "insert") || strings.HasPrefix(strings.ToLower(line), "update") || strings.HasPrefix(strings.ToLower(line), "delete") || strings.HasPrefix(strings.ToLower(line), "alter") || strings.HasPrefix(strings.ToLower(line), "commit") {
			// 如果行以常见的SQL关键字开头，标记为SQL部分的开始
			isSQLSection = true
			sqlLines = append(sqlLines, line)
			//} else if isSQLSection && strings.TrimSpace(line) == "" {
			//	// 如果已经进入SQL部分，遇到空行，表示SQL部分结束
			//	break
		}
	}

	// 将累积的SQL语句行连接起来
	sqlStatement := strings.Join(sqlLines, " ")
	return sqlStatement
}

// InsSlowQueryLog 用于传递slow query log信息 == > send to chan
type InsSlowQueryLog struct {
	InsHost        string `json:"ins_host,omitempty"`
	InsPort        int    `json:"ins_port,omitempty"`
	LogSlowEndTime string `json:"log_slow_end_time,omitempty"`
	UserHost       string `json:"user_host,omitempty"`
	QueryTime      string `json:"query_time,omitempty"`
	LockTime       string `json:"lock_time,omitempty"`
	RowsSent       string `json:"rows_sent,omitempty"`
	RowsExamined   string `json:"rows_examined,omitempty"`
	Db             string `json:"db,omitempty"`
	SqlTxt         string `json:"sql_txt,omitempty"`
}
