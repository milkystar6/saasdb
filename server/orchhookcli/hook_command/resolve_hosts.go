package hook_command

import (
	"log"
	"net"
	"regexp"
)

func makeSureIpOrHostname(ipOrHostname string) bool {
	ipRegex := regexp.MustCompile(`^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$`)
	if ipRegex.MatchString(ipOrHostname) {
		// is ip
		return true
	} else {
		// is hostname
		return false
	}
}

func resloveHostname(hostname string) string {
	addrs, err := net.LookupIP(hostname)
	if err != nil {
		log.Fatalf("failed to lookup IP for hostname %s: %v", hostname, err)
	}
	a := ""
	for _, addr := range addrs {
		if ipv4 := addr.To4(); ipv4 != nil {
			a = ipv4.String()
		} else {
			log.Fatalf("no IPv4 address found")
		}
	}
	return a
}

func getIpFromAddr(ipOrhost string) string {
	ip := ""
	if makeSureIpOrHostname(ipOrhost) {
		ip = ipOrhost
	} else {
		ip = resloveHostname(ipOrhost)
	}
	return ip
}
