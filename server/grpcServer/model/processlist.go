package model

import (
	"fmt"
	"gorm.io/gorm"
)

type InformationSchemaProcesslist struct {
	Id      int    `json:"id" form:"id" ,gorm:"column:ID;TYPE:bigint"`
	User    string `json:"user" ,from:"user" ,gorm:"column:USER;TYPE:varchar(32)"`
	Host    string `json:"host" ,form:"host" ,gorm:"column:HOST;TYPE:varchar(261)"`
	Db      string `json:"db" ,form:"db" ,gorm:"column:DB;TYPE:varchar(64)"`
	Command string `json:"command" ,form:"command" ,gorm:"column:COMMAND;TYPE:varchar(16)"`
	Time    int    `json:"time" ,form:"time" ,gorm:"column:TIME;TYPE:int"`
	State   string `json:"state" ,form:"state" ,gorm:"column:STATE;TYPE:varchar(64)"`
	Info    string `json:"info" ,form:"info" ,gorm:"column:INFO;TYPE:varchar(65535)"`
}

func (r *InformationSchemaProcesslist) TableName() string {
	return "PROCESSLIST"
}

func (r *InformationSchemaProcesslist) GetAllProcesslist(db *gorm.DB) []InformationSchemaProcesslist {
	resArr := make([]InformationSchemaProcesslist, 0, 0)
	selectcol := []string{"id", "user", "host", "db", "command", "time", "state", "info"}
	db.Model(&r).Table(r.TableName()).Select(selectcol).Scan(&resArr)
	return resArr
}

func (r *InformationSchemaProcesslist) GetProcesslistWithCommand(db *gorm.DB, command string) (pro []InformationSchemaProcesslist, tol int64) {
	resArr := make([]InformationSchemaProcesslist, 0, 0)
	selectcol := []string{"id", "user", "host", "db", "command", "time", "state", "info"}
	db.Model(&r).Table(r.TableName()).Select(selectcol).Where("COMMAND LIKE  ?", command).Scan(&resArr).Count(&tol)
	return resArr, tol
}

func (r *InformationSchemaProcesslist) GetProcesslistWithCommandAndUser(db *gorm.DB, command, user string) (pro []InformationSchemaProcesslist, tol int64) {
	resArr := make([]InformationSchemaProcesslist, 0, 0)
	selectcol := []string{"id", "user", "host", "db", "command", "time", "state", "info"}
	db.Model(&r).Table(r.TableName()).Select(selectcol).Where("COMMAND LIKE  ? AND user = ?", fmt.Sprintf("%%%s%%", command), user).Scan(&resArr).Count(&tol)
	return resArr, tol
}

func (r *InformationSchemaProcesslist) GetProcesslistWithState(db *gorm.DB, state string) (pro []InformationSchemaProcesslist, tol int64) {
	resArr := make([]InformationSchemaProcesslist, 0, 0)
	selectcol := []string{"id", "user", "host", "db", "command", "time", "state", "info"}
	db.Model(&r).Table(r.TableName()).Select(selectcol).Where(" STATE LIKE ?", fmt.Sprintf("%%%s%%", state)).Scan(&resArr).Count(&tol)
	return resArr, tol

}

func (r *InformationSchemaProcesslist) CountActiveSessions(db *gorm.DB, SESSION_STATES []string) (total int64) {
	db.Table(r.TableName()).Select("COUNT(*)").Where("STATE IN ?", SESSION_STATES).Count(&total)
	return total
}

func (r *InformationSchemaProcesslist) ActiveSessionNotSleep(db *gorm.DB) (tol int64) {
	db.Table(r.TableName()).Select("COUNT(*)").Where("INFO IS NOT NULL").Count(&tol)
	return tol - 1 //除去本查询
}
