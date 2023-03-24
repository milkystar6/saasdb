package hook_command

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"strconv"
	"strings"
)

type ModifyRoleMsg struct {
	MIns            string
	MRole           string
	MSaasDBAddr     string
	MSaasDBUser     string
	MSaasDBPassword string
}

func (c *Command) ModifyRoles(meta ModifyRoleMsg) {
	ip := strings.Split(meta.MIns, ":")[0]
	port, _ := strconv.Atoi(strings.Split(meta.MIns, ":")[1])
	r := ""
	h := ""
	if meta.MRole == saasdb.Standby {
		r = saasdb.Standby
		h = saasdb.Standby
	} else {
		r = meta.MRole
		h = "available"
	}
	mr := InstanceModifyRole{
		//Ip:     strings.Split(meta.MIns, ":")[0],
		//Port:   &port,
		Role:   r,
		Health: h,
	}
	// use gorm
	db, _ := newConn(meta)
	err := db.Debug().Model(&InstanceModifyRole{}).Where("ip=? and port=?", ip, port).Updates(mr).Error
	if err != nil {
		fmt.Println(err)
	}
}
