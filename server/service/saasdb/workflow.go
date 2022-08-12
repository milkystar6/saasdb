package saasdb

import "github.com/flipped-aurora/gin-vue-admin/server/global"

type WorkFlowService struct {
}

func (w *WorkFlowService) BackupDB(GrpcMsg global.GrpcMsg, dblist []string) error {
	return nil
}

func (w *WorkFlowService) BackupTable(GrpcMsg global.GrpcMsg, tablelist []string) error {
	return nil
}

func (w *WorkFlowService) BackAllDB(GrpcMsg global.GrpcMsg) error {
	return nil
}
