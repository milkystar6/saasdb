package hook_command

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"strconv"
	"strings"
)

const (
	mysqlRolesSlaveForHa = "slaveforha"
	mysqlRolesSlaveOnly  = "slaveonly"
	mysqlRolesMaster     = "master"
	nilID                = 0
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
		h = saasdb.Avaiabel
	}
	mr := InstanceModifyRole{
		//Ip:     strings.Split(meta.MIns, ":")[0],
		//Port:   &port,
		Role:   r,
		Health: h,
	}
	// use gorm
	db, _ := newConn(meta)
	// 查询集群中是否存在其他状态是master的节点
	var instance saasdb.Instance
	domainId, _, err2 := instance.GetDomainIdByIpPort(db, ip, port)
	if err2 != nil {
		fmt.Println(err2)
	}

	//修改现有集群中的master节点为slave for ha
	if *domainId == nilID {
		fmt.Println(fmt.Sprintf("Warning: saas_instance表中ip=%v,port=%v的实例没有domain_id,niliid: %v"), ip, port, nilID)
	} else {
		sql := fmt.Sprintf("UPDATE %v SET role='%v' where domain_id ='%v' and role='%v' ", instance.TableName(), mysqlRolesSlaveForHa, *domainId, mysqlRolesMaster)
		e := db.Debug().Exec(sql).Error
		if e != nil {
			fmt.Println(e)
		}
	}

	// 修改真正的master节点的
	err := db.Debug().Model(&InstanceModifyRole{}).Where("ip=? and port=?", ip, port).Updates(mr).Error
	if err != nil {
		fmt.Println(err)
	}
}
