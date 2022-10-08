package collect

import (
	"MySQLInstanceInfoCollect/config"
	"MySQLInstanceInfoCollect/model"
)

var DB model.MyDB
var ConnInfo *config.MyConnInfo
var Version string

type Collecter struct {
	Version string
	Datadir string
}

func (c *Collecter) Start() (*Collecter, error) {
	ConnInfo = DB.InitConfigFile()
	info, err := c.CollectionMySQL(ConnInfo)
	if err != nil {
		return nil, err
	}
	return info, nil
}
func (c *Collecter) CollectionMySQL(conn *config.MyConnInfo) (*Collecter, error) {
	Conn, err := DB.NewDBConn(true, conn)
	if err != nil {
		return nil, err
	}
	// 数据库版本信息
	Version, err = Conn.GetVersion()
	if err != nil {
		return nil, err
	}

	// 数据库datadir
	dataadir, err := Conn.GetDatadir()
	if err != nil {
		return nil, err
	}

	return &Collecter{
		Version: Version,
		Datadir: dataadir,
	}, nil
}
