package taskclient

import (
	"encoding/json"
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"golang.org/x/net/context"
)

type BackupTaskClientService struct {
}

// BackupTaskMeta 定义所需的备份的命令行参数 存放到结构体中
type BackupTaskMeta struct {
	BackupType      int               `json:"vm_type,omitempty"`              // 备份类型 如 `MySQL MongoDB`
	BackupMode      string            `json:"vm_mode,omitempty"`              // 备份模式 如 `Full Incr`
	VmWorkNode      string            `json:"vm_work_node,omitempty"`         // 备份主机 如 `ip地址`
	DstDBHost       string            `json:"dst_db_host"`                    // 备份Mysql地址 如`127.0.0.1`
	DstDBPort       uint32            `json:"dst_db_port,omitempty"`          // 备份目标数据库端口 如 `3306 `
	BackupTool      string            `json:"backup_tool,omitempty"`          // 备份工具 如 `mysqlbackup xtrabackup mysqldump mydumper dumpling等`
	Storage         string            `json:"storage,omitempty"`              // 备份存储 如 `本地存储 远端存储 s3 nfs`
	NotifyWebhook   string            `json:"notify_webhook"`                 // 消息推送地址
	SaasDBMySQLConn saasdb.SaasdbConn `json:"saas_db_my_sql_connn,omitempty"` // saasdb数据库连接地址
	DbDomainId      int               `json:"db_domain_id,omitempty"`         // 数据库集群id
	BackupLogUUid   string            `json:"backup_log_u_uid,omitempty"`     // 备份日志uuid
}

// BackupEntry 入口函数
func (r *BackupTaskClientService) BackupEntry(meta BackupTaskMeta) ([]byte, error) {
	backclient, err := r.NewBackupClient(meta.VmWorkNode)
	if err != nil {
		return nil, fmt.Errorf("建立grpc连接失败,err:%v", err)
	}
	return r.NewBackupTask(meta, backclient)
}

// NewBackupClient client
func (r *BackupTaskClientService) NewBackupClient(wn string) (grpc_pb.MySQLBackupServiceClient, error) {
	client, err := NewGrpcConn(wn)
	if err != nil {
		return nil, err
	}

	return grpc_pb.NewMySQLBackupServiceClient(client), nil

}

func (r *BackupTaskClientService) NewBackupTaskRequest(meta BackupTaskMeta) *grpc_pb.BackupTaskRequest {
	wv := grpc_pb.WorkVm{WorkVm: meta.VmWorkNode}

	mc := grpc_pb.MySQLConn{
		MySQLUser:       "backup",
		MySQLUserpasswd: "B@ckup@dmIn@",
		MySQLHost:       meta.DstDBHost,
		MySQLPort:       meta.DstDBPort,
	}
	sdm := grpc_pb.SaasDBMySQLConn{
		MySQLUser:       meta.SaasDBMySQLConn.Username,
		MySQLUserpasswd: meta.SaasDBMySQLConn.Password,
		MySQLHost:       meta.SaasDBMySQLConn.Host,
		MySQLPort:       meta.SaasDBMySQLConn.Port,
		SaaSDBName:      meta.SaasDBMySQLConn.Dbname,
	}
	btm := grpc_pb.BackupTypeMySQL{Type: grpc_pb.BackupTypeMySQL_FullBackUpWithXtra}
	dm := uint32(meta.DbDomainId)
	// TODO 这里账号密码先写死
	return &grpc_pb.BackupTaskRequest{
		WorkVm:          &wv,
		MySQLConn:       &mc,
		SaasDBMySQLConn: &sdm,
		BackupTypeMySQL: &btm,
		RemoteStorageS3: nil,
		BackUpTimeout:   12800,
		DomainId:        dm,
	}
}

func (r *BackupTaskClientService) NewBackupTask(meta BackupTaskMeta, client grpc_pb.MySQLBackupServiceClient) ([]byte, error) {
	ctx, cancle := context.WithTimeout(context.Background(), global.GrpcCreateTimeout)
	defer cancle()
	res, err := client.NewBackup(ctx, r.NewBackupTaskRequest(meta))
	if err != nil {
		return nil, err
	}
	if res != nil {
		strbyte, e := json.Marshal(res)
		if e != nil {
			fmt.Println(e)
		}
		return strbyte, nil
	}
	return nil, fmt.Errorf("can't get any ack from grpcserver , please cheak the log")
}
