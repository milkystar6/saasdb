package grpcServer

import (
	"context"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"google.golang.org/protobuf/types/known/timestamppb"
	"io/ioutil"
	"os/exec"
	"strconv"
	"strings"
	"time"
)

const (
	slowLogTmpTablePrefix = "slow_log_query_tmp"
)

type SlowLogQueryServer struct {
	grpc_pb.UnimplementedMySQLSlowLogQueryServiceServer
}

func (server *SlowLogQueryServer) NewGetSlowQuery(ctx context.Context, req *grpc_pb.SlowLogQueryRequest) (*grpc_pb.SlowLogQueryResponse, error) {
	mysqlip := req.GetMySQLIP()
	mysqlport := int(req.GetMySQLPort())
	starttime := req.GetStartTime()
	endtime := req.GetEndTime()
	db, err := model.GormMysql(config.LoadConfig.MySQLManager.MysqlManagerUser, config.LoadConfig.MySQLManager.MysqlManagerPassword, mysqlip, "information_schema", mysqlport)
	if err != nil {
		return nil, err
	}
	defer func() {
		if sqlDB, err := db.DB(); err == nil {
			err = sqlDB.Close()
		}
	}()

	type varslowlog struct {
		VariableName string `gorm:"column:Variable_name"`
		Value        string `gorm:"column:Value"`
	}
	var v varslowlog
	sql := "SHOW VARIABLES LIKE 'slow_query_log'"
	db.Debug().Raw(sql).Scan(&v)
	if strings.EqualFold(v.Value, "OFF") {
		return nil, fmt.Errorf("数据库实例%v:%v未开启slow_query_log参数", mysqlip, mysqlport)
	}

	var vv varslowlog
	sql1 := "SHOW VARIABLES LIKE 'slow_query_log_file'"
	db.Debug().Raw(sql1).Scan(&vv)

	// 关键点解释 :
	// slow log query 一个无缓冲的阻塞channel
	// slow log 通过 `pt-query-digest` 工具分析
	slqChan := make(chan []byte, 1)
	errChan := make(chan error, 1)
	var writesChan chan<- []byte = slqChan

	go func(slowQueryLogFile string, st, et *timestamppb.Timestamp) {

		analyzeErr := server.readSlowFile(mysqlip, mysqlport, slowQueryLogFile, st, et, writesChan)
		if analyzeErr != nil {
			errChan <- analyzeErr
		}
		// 分析完毕后关闭slqChan,解除阻塞
		close(slqChan)

	}(vv.Value, starttime, endtime)

	// 判断分析慢日志是否有错误
	for analyzeSlowErr := range errChan {
		if analyzeSlowErr != nil {
			return nil, analyzeSlowErr
		}
	}
	// 在主进程中读取chan得到的文本数据
	for res := range slqChan {
		fmt.Println(res)
		return nil, err //TODO ... ...
	}
	// 不走如下代码
	return nil, fmt.Errorf("不走如下代码")
}

func (server *SlowLogQueryServer) readSlowFile(ip string, port int, slowQueryLogFile string, st, et *timestamppb.Timestamp, writesChan chan<- []byte) error {
	ptCmd := "pt-query-digest" //TODO 规范一个绝对路径
	checkPtCmd := fmt.Sprintf("%v --version", ptCmd)
	_, checkPtCmdErr := server.runLinuxCmd(checkPtCmd)
	if checkPtCmdErr != nil {
		return fmt.Errorf("run %v got error, error: %v", checkPtCmd, checkPtCmdErr)
	}

	type saasdbConn struct {
		SaasHost     string
		SaasPort     int
		SaasUser     string
		SaasPassword string
	}
	sc := saasdbConn{
		SaasHost:     config.LoadConfig.SaasDB.SaasDBHost,
		SaasUser:     config.LoadConfig.SaasDB.SaasDBUser,
		SaasPort:     config.LoadConfig.SaasDB.SaasPort,
		SaasPassword: config.LoadConfig.SaasDB.SaasPassword,
	}

	// 执行分析慢日志命令
	// TODO 理论上 线上没开日志根据slow log根据日期拆分归档功能 如果线上开启此功能 可以根据日志对应匹配对应的n个文件
	// TODO 慢日志采用写到数据库里存档的模式 -> 记录数据库的节点放到saasdb的表里，表名称可以每次根据时间等创建上 之后把本次的数据存到中间表中，接下来走个任务，把中间表的数据加上ip port放到saasdb的历史query_log中,replace into的方式  replace into tbl_name(col_name, …) (select …)
	t := strings.Split(ip, ".")
	tt := ""
	for _, v := range t {
		tt += v + "_"
	}
	nowStr := strconv.FormatInt(time.Now().Unix(), 10)
	tmpTableName := slowLogTmpTablePrefix + tt + strconv.Itoa(port) + nowStr
	// 连接saasdb数据库
	saasdb, err := model.GormMysql(sc.SaasUser, sc.SaasPassword, sc.SaasHost, "saasdb", sc.SaasPort)
	if err != nil {
		return fmt.Errorf("连接saasdb数据库失败,error: %v", err)
	}
	createTmpTableSql := fmt.Sprintf("CREATE TABLE IF NOT EXISTS %v (\n   checksum     CHAR(32) NOT NULL PRIMARY KEY,\n   fingerprint  TEXT NOT NULL,\n   sample       TEXT NOT NULL,\n   first_seen   DATETIME,\n   last_seen    DATETIME,\n   reviewed_by  VARCHAR(20),\n   reviewed_on  DATETIME,\n   comments     TEXT\n)", tmpTableName)
	if err := saasdb.Exec(createTmpTableSql).Error; err != nil {
		return fmt.Errorf("创建临时记录表失败,error: %v", err)
	}
	layout := "2006-01-02 15:04:05"
	stAt := st.AsTime().Format(layout)
	etAt := et.AsTime().Format(layout)
	fmt.Println("for test ", stAt, etAt)
	analyzeSlowLogQueryCmd := fmt.Sprintf("%v --since \"%v\" --until \"%v\" --limit 95%%:10 %v --create-history-table --create-review-table --host %v --user %v  --password %v --port %v --review D=saasdb,t=%v ", ptCmd, stAt, etAt, slowQueryLogFile, sc.SaasHost, sc.SaasUser, sc.SaasPassword, sc.SaasPort, tmpTableName)
	stdout, err := server.runLinuxCmd(analyzeSlowLogQueryCmd)
	if err != nil {
		return fmt.Errorf("运行pt慢日志分析工具失败, error: %v", err)
	}

	// 在saasdb数据库中create if not exists saasdb_slow_log_query_history
	createSaasDBSlowLogQueryTableSQL := "CREATE TABLE IF NOT EXISTS saasdb_slow_log_query_history (" +
		"	checksum     CHAR(32) NOT NULL PRIMARY KEY," + "ip_port VARCHAR(20) DEFAULT NULL," +
		"	fingerprint  TEXT NOT NULL," +
		"	sample       TEXT NOT NULL," +
		"	first_seen   DATETIME," +
		"	last_seen    DATETIME," +
		"	reviewed_by  VARCHAR(20)," +
		"	reviewed_on  DATETIME," +
		"	comments     TEXT" +
		")"
	if err := saasdb.Exec(createSaasDBSlowLogQueryTableSQL).Error; err != nil {
		return fmt.Errorf("no `saasdb_slow_log_query_history` table in saasdb,so we should create it before insert rows ,but we meet error when create it , error: %v", err)
	}
	ip_port_col := ip + "_" + strconv.Itoa(port)
	// now we should select the rows from tmp table，and fix the col ip_port to show per slow logs belongs to which instance ,then insert new rows into the saasdb_slow_log_query_history table
	transformRowsSQL := fmt.Sprintf("REPLACE INTO saasdb_slow_log_query_history(ip_port,checksum,fingerprint,sample,first_seen,last_seen,reviewed_by,reviewed_on,comments) (SELECT \"%v\" as ip_port, checksum,fingerprint,sample,first_seen,last_seen,reviewed_by,reviewed_on,comments FROM %v)", ip_port_col, tmpTableName)
	if err := saasdb.Exec(transformRowsSQL).Error; err != nil {
		return fmt.Errorf("we meet error when we trans rows from saasdb_slow_log_query_history to %v , error: %v", tmpTableName, err)
	}
	droptmpSql := fmt.Sprintf("Drop table saasdb.%v", tmpTableName)
	if err := saasdb.Exec(droptmpSql).Error; err != nil {
		return fmt.Errorf("we meet error when delete tmp table %v , error: %v", tmpTableName, err)
	}
	writesChan <- []byte(fmt.Sprintf("分析慢日志完成,stdout: %v", stdout))
	return nil
}

func (server *SlowLogQueryServer) runLinuxCmd(c string) ([]byte, error) {
	fmt.Println(c)
	cmd := exec.Command("/bin/bash", "-c", c)
	// 获取管道输入
	output, err := cmd.StdoutPipe()
	if err != nil {
		return nil, fmt.Errorf("无法获取命令的标准输出管道: %v", err.Error())
	}
	// 执行Linux命令
	if err := cmd.Start(); err != nil {
		return nil, fmt.Errorf("%v 命令执行失败，请检查命令输入是否有误: %v", c, err.Error())
	}
	// 读取所有输出
	bytes, err := ioutil.ReadAll(output)
	if err != nil {
		return nil, fmt.Errorf("打印异常，请检查")
	}
	if err := cmd.Wait(); err != nil {
		return nil, fmt.Errorf("wait %v", err.Error())
	}
	return bytes, nil
}
