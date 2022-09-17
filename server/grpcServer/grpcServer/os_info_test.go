package grpcServer

// 获取宿主机的配置信息

import (
	"fmt"
	"github.com/shirou/gopsutil/v3/cpu"
	"github.com/shirou/gopsutil/v3/disk"
	"github.com/shirou/gopsutil/v3/mem"
	"github.com/stretchr/testify/require"
	"testing"
	"time"
)

func GetCpuPercent() float64 {
	percent, _ := cpu.Percent(time.Second, false)
	return percent[0]
}

func GetMemPercent() float64 {
	memInfo, _ := mem.VirtualMemory()
	return memInfo.UsedPercent
}

func GetDiskPercent() float64 {
	parts, _ := disk.Partitions(true)
	diskInfo, _ := disk.Usage(parts[0].Mountpoint)
	return diskInfo.UsedPercent
}
func GetCpuCoreInfo() {
	c1, _ := cpu.Counts(true) //cpu逻辑数量
	fmt.Println(c1)           //4
	c2, _ := cpu.Counts(false) //cpu物理核心
	fmt.Println(c2)           //如果是2说明是双核超线程, 如果是4则是4核非超线程
	if c1==c2*2 {
		fmt.Println("超线程")
	}else if c1==c2{
		fmt.Println("非超线程")
	}else {
		fmt.Println("Unknow 线程模式")
	}
	info, _ := cpu.Times(false)
	fmt.Println(info)

}
func GetMemMoreInfo(){
	info, _ := mem.VirtualMemory()
	fmt.Println(info)
	info2, _ := mem.SwapMemory()
	fmt.Println(info2)
	fmt.Println(info.Total/1024/1024/1024)  // 单位是bit -> Byte -> Mib ->Gib

}

func GetDiskMoreInfo()  {
	info, _ := disk.Partitions(true) //所有分区
	fmt.Println(info)
	info2, _ := disk.Usage("/Users/anderalex/") //指定某路径的硬盘使用情况
	fmt.Println(info2)
	info3, _ := disk.IOCounters() //所有硬盘的io信息
	fmt.Println(info3)
}
func TestFileSerializer(t *testing.T) {
	t.Parallel()
	_, err := fmt.Println(GetCpuPercent())
	go func() {
		for{
			info, _ := cpu.Percent(time.Second, false)
			fmt.Println(info)
		}
	}()
	require.NoError(t, err)
	_, err = fmt.Println(GetMemPercent())
	require.NoError(t, err)
	_, err = fmt.Println(GetDiskPercent())
	require.NoError(t, err)
	info, _ := cpu.Info() //总体信息
	fmt.Println(info)

	GetCpuCoreInfo()

    GetMemMoreInfo()

	GetDiskMoreInfo()

}
