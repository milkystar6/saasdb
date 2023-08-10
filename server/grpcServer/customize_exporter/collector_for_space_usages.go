package customize_exporter

import (
	"fmt"
	"github.com/flipped-aurora/gin-vue-admin/server/global"
	al "github.com/flipped-aurora/gin-vue-admin/server/grpcServer/agent_logger"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/config"
	"github.com/flipped-aurora/gin-vue-admin/server/grpcServer/customize_exporter/opsbase"
	mo "github.com/flipped-aurora/gin-vue-admin/server/model/saasdb"
	"github.com/shirou/gopsutil/v3/disk"
	"gorm.io/gorm"
	"os"
	"path/filepath"
	"strings"
)

type dirUsage struct {
	DataDirName        string
	DataDirSize        int64
	DataDirSizeHuman   string
	BinlogDirName      string
	BinlogDirSize      int64
	BinlogDirSizeHuman string
}

func (c *CustomizeCollector) SpaceUsage() {
	cfg := config.LoadConfig
	// 访问saasdb ==> get 在saasdb 注册了的数据库的端口
	// 根据端口 去分别查询数据库
	localAddr := cfg.MyHostAddrInfo.MyIP

	csaas := c.connSaasdb()
	var ins mo.Instance
	portSlice, _ := ins.QueryPortsByIP(csaas, localAddr, keyForMySQL)

	for _, v := range portSlice {

		dbInformationSchema := dbConnCfg{
			//User:   config.LoadConfig.MySQLManager.MysqlManagerUser,
			//Passwd: config.LoadConfig.MySQLManager.MysqlManagerPassword,
			Host: localAddr,
			Port: v,
			Db:   informationSchema,
		}

		go c.getSpaceUsage(dbInformationSchema, csaas)
	}
}

func (c *CustomizeCollector) getSpaceUsage(dbInformationSchema dbConnCfg, csaasdb *gorm.DB) {
	db := c.connLocalMySQL(dbInformationSchema)
	dataDir := c.GetVariables(db, "datadir", 0)
	//dataDir = "/Users/anderalex/Desktop/学习资料"

	dataDirTotalSize, err1 := calculateDirSize(dataDir)
	if err1 != nil {
		al.Error(fmt.Sprintf("Error:%v", err1))
		return
	}
	dataDirSizeHuman := formatSize(uint64(dataDirTotalSize))

	// time of consumption toc
	/* 统计datadir下 TopN文件 */
	res, toc, l := opsbase.Analyze(dataDir, 10)
	info := fmt.Sprintf("more details: top%v文件:%v,统计任务耗时:%v", l, res, toc)

	/* 统计挂载点空间使用信息 */
	mountPoint, err := getMountPoint(dataDir)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	fsInfo, err := disk.Usage(mountPoint)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}

	extra := fmt.Sprintf(`\ndatadir：%s,\n挂载点信息：%s,\n总空间：%s,\n已用空间：%s,\n可用空间：%s,\n`,
		dataDir, fsInfo.Path, formatSize(fsInfo.Total),
		formatSize(fsInfo.Used), formatSize(fsInfo.Free),
	)

	/* 统计binlog目录信息 */
	logBinBasename := c.GetVariables(db, "log_bin_basename", 0)
	lastSlashIndex := strings.LastIndex(logBinBasename, "/")
	binlogDirectory := ""
	var binlogDirectoryTotalSize int64
	binlogDirectorySizeHuman := ""
	if lastSlashIndex != -1 {
		binlogDirectory = logBinBasename[:lastSlashIndex]
		//binlogDirectory = "/Users/anderalex/Desktop/学习资料"
		binlogDirectoryTotalSize, err = calculateDirSize(binlogDirectory)
		if err != nil {
			al.Error(fmt.Sprintf("Error:%v", err))
			return
		}
		binlogDirectorySizeHuman = formatSize(uint64(binlogDirectoryTotalSize))
	} else {
		binlogDirectorySizeHuman = "Unknown"
	}

	/* 整理记录到saas_db中的信息 */
	dUsage := dirUsage{
		DataDirName:        dataDir,
		DataDirSize:        dataDirTotalSize,
		DataDirSizeHuman:   dataDirSizeHuman,
		BinlogDirName:      binlogDirectory,
		BinlogDirSize:      binlogDirectoryTotalSize,
		BinlogDirSizeHuman: binlogDirectorySizeHuman,
	}

	c.push2SaasDB(dbInformationSchema, csaasdb, dUsage)

	info = info + extra + fmt.Sprintf(`binlog目录: %v,\nbinlog目录大小: %v,\n`, binlogDirectory, binlogDirectorySizeHuman)
	msg := fmt.Sprintf(`
{"message_topic":"%v",
"ins_ip": "%v",
"ins_port":"%v",
"suppress_duration":%v,
"info":"%vcounts:%v"}
`, "Top10FileUsage", dbInformationSchema.Host, dbInformationSchema.Port, 43200, info, "null")
	SendMsg2WebHook(csaasdb, msg)
	c.CloseDB(db)
	c.CloseDB(csaasdb)
}

// 格式化字节数为易读的单位
func formatSize(bytes uint64) string {
	const unit = 1024
	if bytes < unit {
		return fmt.Sprintf("%d B", bytes)
	}
	div, exp := int64(unit), 0
	for n := bytes / unit; n >= unit; n /= unit {
		div *= unit
		exp++
	}
	return fmt.Sprintf("%.1f %cB", float64(bytes)/float64(div), "KMGTPE"[exp])
}

func getMountPoint(dirPath string) (string, error) {
	absPath, err := filepath.Abs(dirPath)
	if err != nil {
		return "", err
	}

	for {
		if info, err := os.Stat(absPath); err == nil {
			if info.IsDir() {
				return absPath, nil
			}
		}
		parent := filepath.Dir(absPath)
		if parent == absPath {
			break
		}
		absPath = parent
	}

	return "", fmt.Errorf("could not determine mount point")
}

func calculateDirSize(dirPath string) (int64, error) {
	var totalSize int64

	err := filepath.Walk(dirPath, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if !info.IsDir() {
			totalSize += info.Size()
		}
		return nil
	})

	if err != nil {
		return 0, err
	}

	return totalSize, nil
}

func (c *CustomizeCollector) push2SaasDB(dbCfg dbConnCfg, db *gorm.DB, info dirUsage) {
	ip := dbCfg.Host
	port := dbCfg.Port
	var ins mo.Instance
	insId, _, _ := ins.GetDomainIdByIpPort(db, ip, port)
	/* 根据insId向空间使用表中插入数据 */

	d := mo.DirUsage{
		GVA_MODEL:          global.GVA_MODEL{},
		InsId:              insId,
		DataDirName:        info.DataDirName,
		DataDirSize:        &info.DataDirSize,
		DataDirSizeHuman:   info.DataDirSizeHuman,
		BinlogDirName:      info.BinlogDirName,
		BinlogDirSize:      &info.BinlogDirSize,
		BinlogDirSizeHuman: info.BinlogDirSizeHuman,
	}
	err := d.Save(db)
	if err != nil {
		al.Error(fmt.Sprintf("更新数据到%v失败,err: %v", d.TableName(), err))
	}
}
