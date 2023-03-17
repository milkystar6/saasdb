package scripts

import (
	"bytes"
	"errors"
	"fmt"
	"github.com/vishvananda/netlink"
	"net"
	"os/exec"
	"strings"
)

type OrchWebHooks struct{}

func (o *OrchWebHooks) OpDeadMaster(vip string) error {
	fmt.Println("for test,get op OpDeadMaster command ,", vip)
	// 去掉vip
	iface, err := o.getInterfaceByIP(vip)
	if err != nil {
		fmt.Println("Error ....")
		return err
	}
	return o.deleteVIPByShell(vip, iface.Name)
	//return o.deleteVIP(vip, iface.Name)
}
func (o *OrchWebHooks) OpNewMaster(realIP, vip string) error {
	// 解析虚拟 IP 地址
	ip := net.ParseIP(vip)
	if ip == nil {
		return fmt.Errorf("Invalid IP address: %s\n", vip)
	}

	// 获取所有网络接口
	ifaces, err := net.Interfaces()
	if err != nil {
		return fmt.Errorf("Error getting interfaces: %v\n", err)
	}

	// 遍历每个网络接口
	for _, iface := range ifaces {
		// 如果网络接口是虚拟机网卡，则跳过
		if strings.Contains(iface.Name, "vir") {
			continue
		}

		// 获取网络接口的所有 IP 地址
		addrs, err := iface.Addrs()
		if err != nil {
			fmt.Printf("Error getting addresses for interface %s: %v\n", iface.Name, err)
			continue
		}

		// 遍历每个 IP 地址
		for _, addr := range addrs {
			// 解析 IP 地址和子网掩码
			ip, ipnet, err := net.ParseCIDR(addr.String())
			if err != nil {
				fmt.Printf("Error parsing address %s: %v\n", addr.String(), err)
				continue
			}

			// 检查 IP 地址是否匹配
			if ip.Equal(net.ParseIP(realIP)) {
				// 获取网络接口的名称
				ifaceName := iface.Name

				// 获取网络接口对象
				link, err := netlink.LinkByName(ifaceName)
				if err != nil {
					fmt.Printf("Error getting link %s: %v\n", ifaceName, err)
					continue
				}

				// 挂载虚拟 IP 地址到网络接口
				ipnet.IP = net.ParseIP(vip)
				err = netlink.AddrAdd(link, &netlink.Addr{IPNet: ipnet})
				if err != nil {
					fmt.Printf("Error adding address %s to interface %s: %v\n", ipnet.String(), ifaceName, err)
					continue
				}

				fmt.Printf("Virtual IP %s is now bound to interface %s\n", ipnet.String(), ifaceName)
				return nil
			}
		}
	}

	// 如果没有找到对应的物理网卡，则返回错误
	return fmt.Errorf("Error binding virtual IP %s: cannot find physical interface for real IP %s\n", vip, realIP)
}

// getInterfaceByIP returns the network interface that has the specified IP address.
func (o *OrchWebHooks) getInterfaceByIP(ip string) (*net.Interface, error) {

	ifaces, err := net.Interfaces()
	if err != nil {

		return nil, err
	}
	for _, iface := range ifaces {
		addrs, err := iface.Addrs()
		if err != nil {

			return nil, err
		}
		for _, addr := range addrs {
			if ipnet, ok := addr.(*net.IPNet); ok && ipnet.Contains(net.ParseIP(ip)) {
				return &iface, nil
			}
		}
	}

	return nil, fmt.Errorf("no interface found for IP address %s", ip)
}

// deleteVIP deletes the specified VIP address.
func (o *OrchWebHooks) deleteVIP(vip string, networkInterfaceCard string) error {

	// Don't use this code first. The func has many bugs

	ip := net.ParseIP(vip)
	if ip == nil {
		return fmt.Errorf("invalid IP address: %s", vip)
	}

	fmt.Println("a2")
	addr := &netlink.Addr{IPNet: &net.IPNet{IP: ip}}

	link, err := netlink.LinkByName(networkInterfaceCard)
	if err != nil {
		return fmt.Errorf("failed to get link %s: %v", networkInterfaceCard, err)
	} else if link == nil {
		fmt.Println("无法实现Link,通过linux命令操作实现网卡下线")
		return fmt.Errorf("link %s not found", networkInterfaceCard)

	}

	// 添加虚拟IP地址并设置标志为FLAGS_REPLACE
	fmt.Println("a3")
	if err := netlink.AddrAdd(link, addr); err != nil {

		return fmt.Errorf("failed to add address %s to link %s: %v", vip, networkInterfaceCard, err)
	}
	// 删除虚拟IP地址
	fmt.Println("a4")
	if err := netlink.AddrDel(link, addr); err != nil {

		return fmt.Errorf("failed to delete address %s from link %s: %v", vip, networkInterfaceCard, err)
	}

	return nil
}

func (o *OrchWebHooks) deleteVIPByShell(vip string, networkcard string) error {
	// Run shell command to get IP and subnet mask
	cmd := exec.Command("sh", "-c", "ip a l | grep "+vip+" | awk '{print $2}'")
	var stdout bytes.Buffer
	var stderr bytes.Buffer
	cmd.Stdout = &stdout
	cmd.Stderr = &stderr
	err := cmd.Run()
	if err != nil {
		return errors.New(stderr.String())
	}
	vipAndMask := strings.TrimSpace(stdout.String())
	// Run shell command to delete VIP
	cmd = exec.Command("sh", "-c", "ip addr del "+vipAndMask+" dev "+networkcard)
	stdout.Reset()
	stderr.Reset()
	cmd.Stdout = &stdout
	cmd.Stderr = &stderr
	err = cmd.Run()
	if err != nil {
		return errors.New(stderr.String())
	}
	return nil
}
