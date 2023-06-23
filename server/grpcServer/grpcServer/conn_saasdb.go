package grpcServer

import (
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/model"
	"github.com/flipped-aurora/gin-vue-admin/server/service/saasdb/grpc_pb"
	"gorm.io/gorm"
)

func ConnSaasDB(saasdbConn *grpc_pb.SaasDBMySQLConn) (db *gorm.DB, err error) {
	db, err = SaasDB(saasdbConn.MySQLUser, saasdbConn.MySQLUserpasswd, saasdbConn.MySQLHost, saasdbConn.SaaSDBName, int(saasdbConn.MySQLPort))
	if err != nil {
		return nil, err
	}
	return db, nil

}

func SaasDB(user, passwd, host, db string, port int) (*gorm.DB, error) {
	return model.GormMysql(user, passwd, host, db, port)
}
