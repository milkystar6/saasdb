package grpcServer

import (
	"fmt"
	al "github.com/flipped-aurora/gin-vue-admin/server/grpcServer/agent_logger"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/linux_cmd_interface"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"golang.org/x/net/context"
	"gorm.io/gorm"
	"strconv"
	"sync"
)

var waitBackupWork sync.WaitGroup
var onlyOneBackJobRun sync.Mutex

const (
	backupStatusRunning           = "running"
	mysqlBackupFullUseMysqldump   = "mysqldump_full"
	mysqlBackupSingleUseMysqldump = "mysqldump_single"
	mysqlBackupUseXtrafull        = "xtra_full"
	mysqlBackupUseXtraincr        = "xtra_incr"
	mysqlBackupFullUseMydumper    = "mydumper_full"
	mysqlBackupSingleUseMydumper  = "mydumper_single"
)

type HandleMySQLBackup struct {
	grpc_pb.UnimplementedMySQLBackupServiceServer
}

func (r *HandleMySQLBackup) NewMySQLBackupTask(ctx context.Context, req *grpc_pb.BackupTaskRequest) (res *grpc_pb.BackupTaskResponse) {
	al.Logger.Info("收到mysql备份的请求")
	backupType := req.GetBackupTypeMySQL()
	// todo 设计不完美，其实这里，saasdb连接方式可以直接获取配置文件的
	saasdbConn := req.GetSaasDBMySQLConn()

	domainId := req.GetDomainId()
	backupTaskUuid := req.GetBackupUuid()

	// 向saasdb数据库中保留该backup log
	// 1、正常访问到saasdb
	if db, err := ConnSaasDB(saasdbConn); err != nil {
		al.Logger.Error(fmt.Sprintf("连接saasdb失败，请检查saasdb数据库是否可用,%v", err))
		return &grpc_pb.BackupTaskResponse{
			MessageInfo: "连接saasdb失败，请检查saasdb数据库是否可用",
			MessageWarn: "warnings",
		}
	} else if backupTaskUuid == "" {
		// 2、将备份日志写入saasdb
		err := r.createBackupLog(db, int(domainId), backupType)
		if err != nil {
			return &grpc_pb.BackupTaskResponse{
				MessageInfo: "创建备份日志失败",
				MessageWarn: "warnings",
			}
		}
	}

	go r.routineTask(req)

	return &grpc_pb.BackupTaskResponse{
		MessageInfo: "备份任务发起成功",
		MessageWarn: "No warnings",
	}
}
func (r *HandleMySQLBackup) routineTask(meta *grpc_pb.BackupTaskRequest) {
	//  加锁 defer unlock 这里必须加一个lock，否则可能出现多个备份进程存在的情况 不允许 同时有不同类型的备份任务
	//  发起备份的时候，先检查 实例的状态是否是 available ，再决定是否可以进行备份
	onlyOneBackJobRun.Lock()
	defer onlyOneBackJobRun.Unlock()
	r.switchScrpits(meta)

}

func (r *HandleMySQLBackup) createBackupLog(db *gorm.DB, domainId int, backuptype *grpc_pb.BackupTypeMySQL) error {
	backUpFeature := model.NewBackUpFeature("")
	/* 获取一个唯一的id，通过mongo的objectid实现 */
	objectID := primitive.NewObjectID()
	backlog := &model.BackLog{
		GvaModel:      model.GvaModel{},
		DomainId:      domainId,
		BackupType:    backuptypetostring(backuptype),
		DataSize:      0,
		Status:        backupStatusRunning,
		BackUpFeature: backUpFeature,
		BackUpUuid:    objectID.String(),
	}
	return model.CreateBackLog(db, backlog)

}

func backuptypetostring(backuptype *grpc_pb.BackupTypeMySQL) string {
	if backuptype.Type == grpc_pb.BackupTypeMySQL_FullBackUpWithXtra {
		return mysqlBackupUseXtrafull
	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_IncrBackUpWithXtra {
		return mysqlBackupUseXtraincr
	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_FullBackUpWithMydumper {
		return mysqlBackupFullUseMydumper
	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_FullBackUpWithMySQLDump {
		return mysqlBackupFullUseMysqldump
	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_SingleTableBackUpWithMydumper {
		return mysqlBackupSingleUseMydumper
	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_SingleTableBackUpWithMySQLDump {
		return mysqlBackupSingleUseMysqldump
	}
	return ""
}

func (r *HandleMySQLBackup) switchScrpits(meta *grpc_pb.BackupTaskRequest) {
	backuptype := meta.GetBackupTypeMySQL()
	if backuptype.Type == grpc_pb.BackupTypeMySQL_FullBackUpWithXtra {
		r.backupMysqlFullUseXtra(meta)
	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_IncrBackUpWithXtra {

	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_FullBackUpWithMydumper {

	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_FullBackUpWithMySQLDump {

	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_SingleTableBackUpWithMydumper {

	} else if backuptype.Type == grpc_pb.BackupTypeMySQL_SingleTableBackUpWithMySQLDump {

	}
}

func (r *HandleMySQLBackup) backupMysqlFullUseXtra(meta *grpc_pb.BackupTaskRequest) {
	scriptExecutor := &linux_cmd_interface.DefaultScriptExecutor{}

	// 设置脚本的路径和参数
	scriptPath := fmt.Sprintf("%v/%v", config.LoadConfig.Scripts.ScriptsHomeDir, config.LoadConfig.Scripts.BackupMysqlScriptName)
	localMysqlConn := meta.GetMySQLConn()
	saasdbConn := meta.GetSaasDBMySQLConn()
	backupid := meta.GetBackupUuid()
	backupTimeout := meta.GetBackUpTimeout()
	//todo s3
	scriptArgs := []string{
		// conn local mysql
		"--mysql_host", localMysqlConn.MySQLHost,
		"--mysql_port", strconv.Itoa(int(localMysqlConn.MySQLPort)),
		"--mysql_backup_user", localMysqlConn.MySQLUser,
		"--mysql_backup_user_password", localMysqlConn.MySQLUserpasswd,
		// conn saas db
		"--saas_db_host", meta.SaasDBMySQLConn.MySQLHost,
		"--saas_db_port", strconv.Itoa(int(saasdbConn.MySQLPort)),
		"--saas_db_user", saasdbConn.MySQLUser,
		"--saas_db_user_password", saasdbConn.MySQLUserpasswd,
		"--saas_db_name", saasdbConn.SaaSDBName,

		"--backup_id", backupid,
		"--backup_timeout", strconv.Itoa(int(backupTimeout)),
	}
	al.Logger.Info(fmt.Sprintf("ready to backup mysql server %v:%v,cmd:bash %v with args %v", localMysqlConn.MySQLHost, localMysqlConn.MySQLPort, scriptPath, scriptArgs))
	// 调用脚本执行器的方法执行脚本
	_, err := scriptExecutor.ExecuteScript(scriptPath, scriptArgs)
	if err != nil {
		al.Logger.Error(fmt.Sprintf("Error executing script: %s", err))
	}

}

func (r *HandleMySQLBackup) backupMysqlIncrUseXtra() {

}
func (r *HandleMySQLBackup) backupMysqlFullUseMyDumper() {

}
func (r *HandleMySQLBackup) backupMysqlFullUseMySQLDump() {

}

func (r *HandleMySQLBackup) backupMysqlSingleUseMyDumper() {

}

func (r *HandleMySQLBackup) backupMysqlSingleUseMySQlDump() {

}
