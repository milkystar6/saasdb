### 配置文件参数解释
```txt
Configuration{
		Debug:                                      false,
		EnableSyslog:                               false,
		ListenAddress:                              ":3000",
		ListenSocket:                               "",
		HTTPAdvertise:                              "",
		AgentsServerPort:                           ":3001",
		StatusEndpoint:                             DefaultStatusAPIEndpoint,
		StatusOUVerify:                             false,
		BackendDB:                                  "mysql",
		SQLite3DataFile:                            "",
		SkipOrchestratorDatabaseUpdate:             false,
		PanicIfDifferentDatabaseDeploy:             false,
		RaftBind:                                   "127.0.0.1:10008",
		RaftAdvertise:                              "",
		RaftDataDir:                                "",
		DefaultRaftPort:                            10008,
		RaftNodes:                                  []string{},
		ExpectFailureAnalysisConcensus:             true,
		MySQLOrchestratorMaxPoolConnections:        128, // limit concurrent conns to backend DB
		MySQLOrchestratorPort:                      3306,
		MySQLTopologyUseMutualTLS:                  false,
		MySQLTopologyUseMixedTLS:                   true,
		MySQLOrchestratorUseMutualTLS:              false,
		MySQLConnectTimeoutSeconds:                 2,
		MySQLOrchestratorReadTimeoutSeconds:        30,
		MySQLOrchestratorRejectReadOnly:            false,
		MySQLDiscoveryReadTimeoutSeconds:           10,
		MySQLTopologyReadTimeoutSeconds:            600,
		MySQLConnectionLifetimeSeconds:             0,
		DefaultInstancePort:                        3306,
		TLSCacheTTLFactor:                          100,
		InstancePollSeconds:                        5,
		ReasonableInstanceCheckSeconds:             1,
		InstanceWriteBufferSize:                    100,
		BufferInstanceWrites:                       false,
		InstanceFlushIntervalMilliseconds:          100,
		SkipMaxScaleCheck:                          true,
		UnseenInstanceForgetHours:                  240,
		SnapshotTopologiesIntervalHours:            0,
		DiscoverByShowSlaveHosts:                   false,
		UseSuperReadOnly:                           false,
		DiscoveryMaxConcurrency:                    300,
		DiscoveryQueueCapacity:                     100000,
		DiscoveryQueueMaxStatisticsSize:            120,
		DiscoveryCollectionRetentionSeconds:        120,
		DiscoverySeeds:                             []string{},
		InstanceBulkOperationsWaitTimeoutSeconds:   10,
		HostnameResolveMethod:                      "default",
		MySQLHostnameResolveMethod:                 "@@hostname",
		SkipBinlogServerUnresolveCheck:             true,
		ExpiryHostnameResolvesMinutes:              60,
		RejectHostnameResolvePattern:               "",
		ReasonableReplicationLagSeconds:            10,
		ProblemIgnoreHostnameFilters:               []string{},
		VerifyReplicationFilters:                   false,
		ReasonableMaintenanceReplicationLagSeconds: 20,
		CandidateInstanceExpireMinutes:             60,
		AuditLogFile:                               "",
		AuditToSyslog:                              false,
		AuditToBackendDB:                           false,
		AuditPurgeDays:                             7,
		RemoveTextFromHostnameDisplay:              "",
		ReadOnly:                                   false,
		AuthenticationMethod:                       "",
		HTTPAuthUser:                               "",
		HTTPAuthPassword:                           "",
		AuthUserHeader:                             "X-Forwarded-User",
		PowerAuthUsers:                             []string{"*"},
		PowerAuthGroups:                            []string{},
		AccessTokenUseExpirySeconds:                60,
		AccessTokenExpiryMinutes:                   1440,
		ClusterNameToAlias:                         make(map[string]string),  kv对，方便自定义展示别名
		DetectClusterAliasQuery:                    "",
		DetectClusterDomainQuery:                   "",
		DetectInstanceAliasQuery:                   "",
		DetectPromotionRuleQuery:                   "",
		DataCenterPattern:                          "",
		PhysicalEnvironmentPattern:                 "",
		DetectDataCenterQuery:                      "",
		DetectPhysicalEnvironmentQuery:             "",
		DetectSemiSyncEnforcedQuery:                "",
		SupportFuzzyPoolHostnames:                  true,
		InstancePoolExpiryMinutes:                  60,
		PromotionIgnoreHostnameFilters:             []string{},
		ServeAgentsHttp:                            false,
		AgentsUseSSL:                               false,
		AgentsUseMutualTLS:                         false,
		AgentSSLValidOUs:                           []string{},
		AgentSSLSkipVerify:                         false,
		AgentSSLPrivateKeyFile:                     "",
		AgentSSLCertFile:                           "",
		AgentSSLCAFile:                             "",
		UseSSL:                                     false,
		UseMutualTLS:                               false,
		SSLValidOUs:                                []string{},
		SSLSkipVerify:                              false,
		SSLPrivateKeyFile:                          "",
		SSLCertFile:                                "",
		SSLCAFile:                                  "",
		AgentPollMinutes:                           60,
		UnseenAgentForgetHours:                     6,
		StaleSeedFailMinutes:                       60,
		SeedAcceptableBytesDiff:                    8192,
		SeedWaitSecondsBeforeSend:                  2,
		AutoPseudoGTID:                             false,      伪GTID 节点没开启GTID可以使用该模式
		PseudoGTIDPattern:                          "",
		PseudoGTIDPatternIsFixedSubstring:          false,
		PseudoGTIDMonotonicHint:                    "",
		DetectPseudoGTIDQuery:                      "",
		BinlogEventsChunkSize:                      10000,
		SkipBinlogEventsContaining:                 []string{},
		ReduceReplicationAnalysisCount:             true,
		FailureDetectionPeriodBlockMinutes:         60,
		RecoveryPeriodBlockMinutes:                 60,
		RecoveryPeriodBlockSeconds:                 3600,
		RecoveryIgnoreHostnameFilters:              []string{},
		RecoverMasterClusterFilters:                []string{}, 只对配置项RecoverMasterClusterFilters匹配的集群进行故障切换
		RecoverIntermediateMasterClusterFilters:    []string{},
		ProcessesShellCommand:                      "bash",
		OnFailureDetectionProcesses:                []string{},
		PreGracefulTakeoverProcesses:               []string{}, 在老的master离开之前，新的master优雅的接管master，即在老的master上先设置read_only之前要做的事情,属于优雅修改topo的过程
		PreFailoverProcesses:                       []string{}, Processes to execute before doing a failover (aborting operation should any once of them exits with non-zero code; order of execution undefined). May and should use some of these placeholders: {failureType}, {instanceType}, {isMaster}, {isCoMaster}, {failureDescription}, {command}, {failedHost}, {failureCluster}, {failureClusterAlias}, {failureClusterDomain}, {failedPort}, {countReplicas}, {replicaHosts}, {isDowntimed}
		PostMasterFailoverProcesses:                []string{},
		PostIntermediateMasterFailoverProcesses:    []string{},
		PostFailoverProcesses:                      []string{},
		PostUnsuccessfulFailoverProcesses:          []string{},
		PostGracefulTakeoverProcesses:              []string{}, 
		PostTakeMasterProcesses:                    []string{}, 主服务器不可用时，需要提升一个新的slave作为master，这个过程称为TakeMaster
		RecoverNonWriteableMaster:                  false, 当为“true”时，Orchestrator将把只读主节点视为故障情况，并尝试使主节点可写。
		CoMasterRecoveryMustPromoteOtherCoMaster:   true, 当为“false”时，可以提升任何节点（并且优先选择候选节点）。当为“true”时，Orchestrator将提升其他共同的主节点，否则会失败。
		DetachLostSlavesAfterMasterFailover:        true, 在主节点故障转移后，那些在主节点恢复中不会丢失的副本（即比提升的副本更为最新）是否应该被强制解除关联。
		ApplyMySQLPromotionAfterMasterFailover:     true,
		PreventCrossDataCenterMasterFailover:       false,
		PreventCrossRegionMasterFailover:           false, 如果设置为true，则Orchestrator将防止在不同地区之间进行主节点故障转移。也就是说，如果当前主节点和候选主节点处于不同的地区，则将不会进行故障转移。 ## 这个区域怎么区分的 ？？？ 一个区域维护一个orchestrator集群不需要配置这个
		MasterFailoverLostInstancesDowntimeMinutes: 0,
		MasterFailoverDetachSlaveMasterHost:        false, 当ApplyMySQLPromotionAfterMasterFailover设置为true时，该参数无意义。否则，如果设置为true，Orchestrator是否应该在新晋升的主节点上执行detach-replica-master-host(分离复制master节点)操作，以确保新的主节点不会尝试复制旧的主节点（如果旧的主节点恢复）。默认值为false。
		FailMasterPromotionOnLagMinutes:            0,     当设置为大于0时，如果候选副本落后于配置的分钟数，则主节点晋升失败。
		FailMasterPromotionIfSQLThreadNotUpToDate:  false, 如果设置为true，并且发生主节点故障转移，如果候选主节点尚未消耗完所有中继日志，则会中止晋升并显示错误。
		DelayMasterPromotionIfSQLThreadNotUpToDate: false, 如果设置为true，并且发生主节点故障转移，如果候选主节点尚未消耗完所有中继日志，则延迟晋升，直到SQL线程追上为止。
		PostponeSlaveRecoveryOnLagMinutes:          0,  在崩溃恢复时，落后于给定分钟数的副本仅在恢复过程的后期被重新启动，即在选举出主节点/IM并执行过程之后。将值设置为0可以禁用此功能。
		OSCIgnoreHostnameFilters:                   []string{},
		GraphiteAddr:                               "",
		GraphitePath:                               "",
		GraphiteConvertHostnameDotsToUnderscores:   true,  不集成Graphite的话 忽略
		GraphitePollSeconds:                        60,  Graphite是一个开源的指标和分析平台，用于实时监控和可视化应用程序的性能和运行状况。
		URLPrefix:                                  "",  配置到转发代理等，url前缀，忽略
		DiscoveryIgnoreReplicaHostnameFilters:      []string{},  Regexp(正则表达式) filters(过滤器) to apply to(应用于) prevent discovering(防止发现) instances of any kind 任何类型实例的。
		
		ConsulAddress:                              "",
		ConsulScheme:                               "http",
		ConsulAclToken:                             "",
		ConsulCrossDataCenterDistribution:          false,
		ConsulKVStoreProvider:                      "consul",
		ConsulMaxKVsPerTransaction:                 ConsulKVsPerCluster,
		ZkAddress:                                  "",
		KVClusterMasterPrefix:                      "mysql/master", 在KV存储（内部、Consul、ZK）中用于集群主节点条目的前缀，默认为“mysql/master”。 (忽略即可)
		WebMessage:                                 "",       如果提供，则将显示在所有标题栏下的网页上。
		MaxConcurrentReplicaOperations:             5,        副本上的并发操作的最大数量。
		EnforceExactSemiSyncReplicas:               false,    如果为真，半同步副本将按照所需的优先顺序启用/禁用，以匹配等待计数；这适用于LockedSemiSyncMaster和MasterWithTooManySemiSyncReplicas。
		RecoverLockedSemiSyncMaster:                false,    如果为真，orchestrator将通过在副本上启用半同步以匹配等待计数来从LockedSemiSync状态中恢复；EnforceExactSemiSyncReplicas可以覆盖此行为。
		ReasonableLockedSemiSyncMasterSeconds:      0,        在触发LockedSemiSync分析之前，需要评估LockedSemiSync假设的时间；如果没有设置，则回退到ReasonableReplicationLagSeconds。
	}
```

## orchestrator的topology-recovery
### orchestrator支持如下几种恢复
- 自动恢复
-  [Graceful(优雅), planned(计划), master promotion(master进阶提升)](#graceful-master-promotion).
- 手动恢复
- 手动、强制、紧急故障转移 
### failover的条件
topology需要开启GTID/伪GTID




Orchestrator 对MySQL主库的故障切换分为自动切换和手动切换。
手动切换又分为recover、force-master-failover、force-master-takeover以及graceful-master-takeover.

1.自动切换
自动切换是主库出现故障后，自动提升新主库，进行故的障切换。

自动切换受到以下条件限制和约束：

主库是downtime的集群不进行故障切换。如果希望忽略集群故障，可以设置downtime。
处于故障活跃期的集群不进行故障切换(即in_active_period=1)
只对配置项RecoverMasterClusterFilters匹配的集群进行故障切换
会周期检测主库状态。
自动切换，会周期进行故障扫描，如果发现故障，条件满足就会进行故障切换。

故障检测和切换具体由CheckAndRecover()实现，具体调用：

GetReplicationAnalysis()，进行故障扫描
executeCheckAndRecoverFunction()，进行故障恢复
2.手动切换
手动切换包括: recover、force-master-failover, force-master-takeover以及graceful-master-takeover。

手动切换不受自动切换中提到的条件限制和约束。

2.1 recover
recover 以故障主库以及候选实例candiateKey为参数，调用CheckAndRecover()，进行故障切换。
指定的故障主库必须是故障的，也就是已确认发生故障，如果不是故障的，不进行切换。

2.2 force-master-failover
不论集群主库是否故障，都会进行后续切换操作，需要用户确认已发生故障。

具体步骤：

(1) 故障扫描 forceAnalysisEntry()-->GetReplicationAnalysis()
(2) 故障恢复ForceExecuteRecovery(analysisEntry, nil,false)-->executeCheckAndRecoverFunction()，不指定候选主库
最后，老主库成为单独的DB 实例。

2.3 force-master-takeover
同上，需要用户自己判定故障。

force-master-takeover，唯一不同于force-master-failover的点是，force-master-takeover带候选主库(即candidate)，并且候选主库必须是集群主库的直连从库。
其他同force-master-failover。

2.3 graceful-master-takeover
这种切换方式针对的是：老主库是正常的，需要提升新主库，老主库可作为从库。

具体操作步骤包括：

(1)检查候选主库

候选主库必须是集群的主库的直连从库
候选主库，没有被禁止提升为主库(即promotion rule 不是must not)
候选主库，没有延迟过大(超过20s)
(2) 故障扫描，forceAnalysisEntry()-->GetReplicationAnalysis()

(3) 调用hooks：PreGracefulTakeoverProcesses

(4) 如果集群中不只一个副本，将老主库的从库移动到候选主库之下

(5) 停止候选主库的复制，在候选主库上执行stop slave

(6) 设置老主库只读

(7) 使候选主库追上老主库(start slave until)

(8) 进行故障恢复，新主库形成ForceExecuteRecovery(analysisEntry, &destination.Key, false)-->executeCheckAndRecoverFunction()

(9) 将老主库变成新主库的从库

(10) 调用hooks: PostGracefulTakeoverProcesses

之所以称为graceful，是因为老主库不是故障的，首先会让候选主库追上老主库。最后，将老主库作为新主库的从库(但没有执行start slave)。
而force-master-failover、force-master-takeover 不会将老主库作为新主库的从库，老主库成为孤立的实例。

