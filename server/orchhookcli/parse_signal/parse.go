package parse_signal

type FailureType string

/* 以下代码类型来自orchestrator analysize.go
定义了orchestrator的监控数据库 访问失败类型
为了方便理解 这里区分哪些是可以恢复的类型，哪些是不可以恢复的类型
reference: https://github.com/openark/orchestrator/blob/master/docs/failure-detection.md

*/
const (
	NoProblem                                               FailureType = "NoProblem"
	DeadMasterWithoutReplicas                               FailureType = "DeadMasterWithoutReplicas"
	DeadMaster                                              FailureType = "DeadMaster"
	DeadMasterAndReplicas                                   FailureType = "DeadMasterAndReplicas"
	DeadMasterAndSomeReplicas                               FailureType = "DeadMasterAndSomeReplicas"
	UnreachableMasterWithLaggingReplicas                    FailureType = "UnreachableMasterWithLaggingReplicas"
	UnreachableMaster                                       FailureType = "UnreachableMaster"
	MasterSingleReplicaNotReplicating                       FailureType = "MasterSingleReplicaNotReplicating"
	MasterSingleReplicaDead                                 FailureType = "MasterSingleReplicaDead"
	AllMasterReplicasNotReplicating                         FailureType = "AllMasterReplicasNotReplicating"
	AllMasterReplicasNotReplicatingOrDead                   FailureType = "AllMasterReplicasNotReplicatingOrDead"
	LockedSemiSyncMasterHypothesis                          FailureType = "LockedSemiSyncMasterHypothesis"
	LockedSemiSyncMaster                                    FailureType = "LockedSemiSyncMaster"
	MasterWithTooManySemiSyncReplicas                       FailureType = "MasterWithTooManySemiSyncReplicas"
	MasterWithoutReplicas                                   FailureType = "MasterWithoutReplicas"
	DeadCoMaster                                            FailureType = "DeadCoMaster"
	DeadCoMasterAndSomeReplicas                             FailureType = "DeadCoMasterAndSomeReplicas"
	UnreachableCoMaster                                     FailureType = "UnreachableCoMaster"
	AllCoMasterReplicasNotReplicating                       FailureType = "AllCoMasterReplicasNotReplicating"
	DeadIntermediateMaster                                  FailureType = "DeadIntermediateMaster"
	DeadIntermediateMasterWithSingleReplica                 FailureType = "DeadIntermediateMasterWithSingleReplica"
	DeadIntermediateMasterWithSingleReplicaFailingToConnect FailureType = "DeadIntermediateMasterWithSingleReplicaFailingToConnect"
	DeadIntermediateMasterAndSomeReplicas                   FailureType = "DeadIntermediateMasterAndSomeReplicas"
	DeadIntermediateMasterAndReplicas                       FailureType = "DeadIntermediateMasterAndReplicas"
	UnreachableIntermediateMasterWithLaggingReplicas        FailureType = "UnreachableIntermediateMasterWithLaggingReplicas"
	UnreachableIntermediateMaster                           FailureType = "UnreachableIntermediateMaster"
	AllIntermediateMasterReplicasFailingToConnectOrDead     FailureType = "AllIntermediateMasterReplicasFailingToConnectOrDead"
	AllIntermediateMasterReplicasNotReplicating             FailureType = "AllIntermediateMasterReplicasNotReplicating"
	FirstTierReplicaFailingToConnectToMaster                FailureType = "FirstTierReplicaFailingToConnectToMaster"
	BinlogServerFailingToConnectToMaster                    FailureType = "BinlogServerFailingToConnectToMaster"
	// Group replication problems
	DeadReplicationGroupMemberWithReplicas FailureType = "DeadReplicationGroupMemberWithReplicas"
)
