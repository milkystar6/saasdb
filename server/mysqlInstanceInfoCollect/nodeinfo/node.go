package nodeinfo

import (
	"MySQLInstanceInfoCollect/format"
	"fmt"
	"github.com/shirou/gopsutil/v3/cpu"
	"github.com/shirou/gopsutil/v3/disk"
	"github.com/shirou/gopsutil/v3/mem"
	"log"
)

type NodeCollecter struct {
	Cpu      *Cpu
	Mem      *Mem
	DataDisk *DataDisk
}

type Cpu struct {
	CoresLogical  int     `json:"cores_logical,omitempty"`  // 逻辑cpu个数
	CoresPhysical int     `json:"cores_physical,omitempty"` // 物理cpu个数
	IsHT          bool    `json:"is_ht,omitempty"`          // Hyper-Threading
	ModelName     string  `json:"model_name,omitempty"`     // 型号
	MHZ           float64 `json:"mhz,omitempty"`            // 主频
}
type Mem struct {
	VirtualMemory      uint64 `json:"virtual_memory,omitempty"`
	VirtualMemoryHuman string `json:"virtual_memory_human,omitempty"`
}
type DataDisk struct {
	DatadirName      string `json:"datadir_name,omitempty"`
	DatadirSize      uint64 `json:"datadir_size,omitempty"`
	DatadirSizeHuman string `json:"datadir_size_human,omitempty"`
	FsType           string `json:"fs_type,omitempty"` // file system type
}

func (r *NodeCollecter) Start(datadir string) *NodeCollecter {
	datadir = "/Users/haochen/docker/mysql/"
	return &NodeCollecter{
		Cpu:      r.CountCpu(),
		Mem:      r.CountMem(),
		DataDisk: r.CountDatadir(datadir),
	}
}

func (r *NodeCollecter) CountCpu() *Cpu {
	var isht bool
	c1, _ := cpu.Counts(true)  //cpu逻辑数量
	c2, _ := cpu.Counts(false) //cpu物理核心

	if c1 == c2*2 {

		isht = true
	} else if c1 == c2 {
		isht = false
	} else {
		isht = false
	}

	info, _ := cpu.Info()
	extrastring := make(map[string]string, 0)
	extrafloat64 := make(map[string]float64, 0)
	for k, v := range info {
		if k > 0 {
			break
		}
		extrastring["model_name"] = v.ModelName
		extrafloat64["mhz"] = v.Mhz
	}
	return &Cpu{
		CoresLogical:  c1,
		CoresPhysical: c2,
		IsHT:          isht,
		ModelName:     extrastring["model_name"],
		MHZ:           extrafloat64["mhz"],
	}
}

func (r *NodeCollecter) CountMem() *Mem {
	totalMem, _ := mem.VirtualMemory()
	size, unit := format.NewHumanSizeMessage(float64(totalMem.Total))
	humanSize := fmt.Sprintf("%v%v", size, unit)
	return &Mem{
		VirtualMemory:      totalMem.Total,
		VirtualMemoryHuman: humanSize,
	}
}

func (r *NodeCollecter) CountDatadir(datadirname string) *DataDisk {
	usage, err := disk.Usage(datadirname)
	if err != nil {
		log.Printf("统计MySQL datadir %v 信息错误, error: %v\n", datadirname, err)
	}
	size, unit := format.NewHumanSizeMessage(float64(usage.Total))
	humanSize := fmt.Sprintf("%v%v", size, unit)
	return &DataDisk{
		DatadirName:      datadirname,
		DatadirSize:      usage.Total,
		DatadirSizeHuman: humanSize,
		FsType:           usage.Fstype,
	}
}

func (r *NodeCollecter) CountAllDisk() {

}
