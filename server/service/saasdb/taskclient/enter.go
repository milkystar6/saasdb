package taskclient

type TaskGroup struct {
	BackupTaskClientService
	ProcessTaskClientService
	VariablesTaskClientService
	SlowLogTaskClientService
}
