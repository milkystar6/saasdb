package customize_exporter

import (
	"fmt"
	al "github.com/flipped-aurora/gin-vue-admin/server/grpcServer/agent_logger"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"time"
)

/*  Customize collector 自定义采集器
--------------------------------------------------------------
设计目的:
  自定义一些mysql的监控
  1、长SQL 长事务
  2、针对某个用户的会话连接个数，可以做到实例级别的配置
  3、所有的处于什么状态的sql 比如处于dump binlog / dump binlog gtid
  4、处于waiting for xxx 状态的sql
  5、读写心跳检测，只记录读心跳即可，写心跳
  6、扩展:
    在saasdb写个表 定义采集项名称，采集项sql，采集项说明，采集项推送说明
    值，阈值，实例tag(针对单独的实例，以ip port的方式，默认空表示全部实例)
     或者在instance上加tag字段(比较难维护这么多监控项) 等
    但是这种需要单独的维护任务管理或者全部串行化，一个一个来，适用于巡检项目的场景



关于采集器的外部调用:
  尽量设计出公共可以用的方法，注册结构体，方便外部调用
  在服务器上针对单机多实例的机器，采用注册线程池或者多个go routine 的方式设置多个采集器

--------------------------------------------------------------

 此文件中只提供对外结构体
*/

type CustomizeCollector struct {
}

func (c *CustomizeCollector) Test() {
	c.Start()
}

func (c *CustomizeCollector) Start() {
	msg := `开启本地自定义采集模块`
	al.Info(msg)

	// TODO 优化代码 下方的函数需要对数据库频繁对建立和删除连接 把链接定义一次 后面重复使用

	saasdbConn, _ := c.connSaasdb()
	cfg := config.LoadConfig
	localAddr := cfg.MyHostAddrInfo.MyIP
	var ins mo.Instance
	portSlice, _ := ins.QueryPortsByIP(saasdbConn, localAddr, keyForMySQL)

	for _, v := range portSlice {
		dbInformationSchema := dbConnCfg{
			Host: localAddr,
			Port: v,
			Db:   informationSchema,
		}
		localdb, err := c.connLocalMySQL(dbInformationSchema)
		// 如果连接失败，跳过后续过程
		if err != nil {
			al.Error(fmt.Sprintf("Failed to connect to MySQL %v. Skipping further processing.", dbInformationSchema))
			continue
		}

		// 抽数会话
		go c.runWithInterval(func() { c.CheckBinlogDumpThreadsCounts(dbInformationSchema, saasdbConn, localdb) }, 60*time.Second)

		// 活跃会话
		go c.runWithInterval(func() { c.ActiveSessions(dbInformationSchema, saasdbConn, localdb) }, 10*time.Second)
		// meta data lock
		go c.runWithInterval(func() { c.CheckWaitMetaDL(dbInformationSchema, saasdbConn, localdb) }, 1*time.Second)
		// 长事务
		go c.runWithInterval(func() { c.GetLongQuerySql(dbInformationSchema, saasdbConn, localdb) }, 60*time.Second)

		// 全表扫描

		// general collect
		// 1、select 1
		// 2、锁
		go c.runWithInterval(func() { c.MySQLSelect1(dbInformationSchema, saasdbConn, localdb) }, 10*time.Second)

		// 统计数据空间占用情况
		go c.runWithInterval(func() { c.SpaceUsage(dbInformationSchema, saasdbConn, localdb) }, 12*time.Hour)

		// log rotate

		// slow query log
		go c.SlowQueryLog(dbInformationSchema, saasdbConn, localdb)
	}

	select {}
}

func (c *CustomizeCollector) runWithInterval(fn func(), interval time.Duration) {
	fn()
	ticker := time.NewTicker(interval)
	defer ticker.Stop()

	for range ticker.C {
		fn()
	}
}
