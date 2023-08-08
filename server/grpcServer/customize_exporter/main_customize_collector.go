package customize_exporter

import (
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
	//msg := `开启本地自定义采集模块`
	//al.Info(msg)

	// 抽数会话
	go c.runWithInterval(c.CheckBinlogDumpThreadsCounts, 60*time.Second)
	// 活跃会话
	go c.runWithInterval(c.ActiveSessions, 10*time.Second)
	// meta data lock
	go c.runWithInterval(c.CheckWaitMetaDL, 1*time.Second)
	// 长事务
	go c.runWithInterval(c.GetLongQuerySql, 10*time.Second)

	// 全表扫描

	// select 1
	go c.runWithInterval(c.MySQLSelect1, 1*time.Second) // 可以做到 db.conn里

	// 统计数据空间占用情况
	go c.runWithInterval(c.SpaceUsage, 12*time.Hour)

	// 锁
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
