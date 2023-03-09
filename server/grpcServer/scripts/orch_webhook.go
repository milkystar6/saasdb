package scripts

type OrchWebHooks struct{}

func (o *OrchWebHooks) OpDeadMaster(ip string) {

}

func (o OrchWebHooks) OpNewMaster(ip string) {
	// 去掉vip
}
