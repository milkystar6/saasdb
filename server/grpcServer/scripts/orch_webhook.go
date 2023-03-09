package scripts

import (
	"fmt"
	"github.com/vishvananda/netlink"
	"net"
	"strings"
)

type OrchWebHooks struct{}

func (o *OrchWebHooks) OpDeadMaster(vip string) error {
	fmt.Println("for test,get op OpDeadMaster command ,", vip)
	// 去掉vip
	iface, err := o.getInterfaceByIP(vip)
	if err != nil {
		return err
	}
	return o.deleteVIP(vip, iface.Name)
}

func (o *OrchWebHooks) OpNewMaster(realIP, vip string) error {
	fmt.Println("for test,get op newMaster command ,", realIP, vip)
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
				ifaceName := strings.Split(iface.Name, "@")[0]

				// 获取网络接口对象
				link, err := netlink.LinkByName(ifaceName)
				if err != nil {
					fmt.Printf("Error getting link %s: %v\n", ifaceName, err)
					continue
				}

				// 挂载虚拟 IP 地址到网络接口
				ipnet.IP = ip
				err = netlink.AddrAdd(link, &netlink.Addr{IPNet: ipnet})
				if err != nil {
					fmt.Printf("Error adding address %s to interface %s: %v\n", ipnet.String(), ifaceName, err)
					continue
				}

				fmt.Printf("Virtual IP %s is now bound to interface %s\n", ipnet.String(), ifaceName)
			}
		}
	}
	return nil
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
	addr, err := netlink.ParseAddr(vip + "/32")
	if err != nil {
		return err
	}
	link, err := netlink.LinkByName(networkInterfaceCard) // replace with your network interface name
	if err != nil {
		return err
	}
	err = netlink.AddrDel(link, addr)
	if err != nil {
		return err
	}
	return nil
}
