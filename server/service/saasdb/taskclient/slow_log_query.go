package taskclient

import "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb/request"

type SlowLogTaskClientService struct {
}

/* Get slow log */
func (ls *SlowLogTaskClientService) GetSlowLog(request.GetSlowLogSearch) ([]byte, error) {
	return nil, nil
}
