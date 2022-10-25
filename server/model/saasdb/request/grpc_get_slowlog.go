package request

import "time"

type GetSlowLogSearch struct {
	Vm          string    `json:"vm,omitempty"`
	VmMySQLHost string    `json:"vm_mysql_host,omitempty"`
	VmMySQLPort string    `json:"vm_mysql_port,omitempty"`
	StartTime   time.Time `json:"start_time,omitempty"`
	EndTime     time.Time `json:"end_time,omitempty"`
}
