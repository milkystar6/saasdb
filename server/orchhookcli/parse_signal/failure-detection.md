# Failure detection 故障检测

`orchestrator` uses a holistic approach to detect master and intermediate master failures. 
`orchestrator`使用整体方法来检测主机和中间主机故障。

In a naive approach, a monitoring tool would probe the master, for example, and alert when it cannot contact or query the master server. Such approach is susceptible to false positives caused by network glitches. The naive approach further mitigates false positives by running `n` tests spaced by `t`-long intervals. This reduces, in some cases, the chances of false positives, and then increases the response time in the event of real failure.
直白的方法，监控工具探测主服务器，在无法连接状态下发出告警，这种方法容易受到网络故障引起的误报的影响。
需要通过多次判断减少误报率，但是在真的故障场景下会导致确定故障的时间变长（orch作者先喷了一把传统的高可用设计思路，，，，说阈值判断法很垃圾 。。。 我这里把naive翻译成了最简单想到的，作者的意思更像是喷 ，毕竟naive不是个啥夸奖的词）

`orchestrator` harnesses the replication topology. It observes not only the server itself, but also its replicas. For example, to diagnose a dead master scenario, `orchestrator` must both:
`orchestrator`利用复制拓扑。它不仅观察服务器本身，还观察它的副本。 例如，要诊断一个dead master场景，`orchestrator`必须：
- Fail to contact said master  无法访问集群认为的master节点
- Be able to contact master's replicas, and confirm they, too, cannot see the master. 通过访问replias，确定master是否挂了

Instead of triaging the error by time, `orchestrator` triages by multiple observers, the replication topology servers themselves. In fact, when all of a master's replicas agree that they cannot contact their master, the replication topology is broken _de-facto_, and a failover is justified.
不是按时间对错误进行分类，而是orchestrator由多个观察者进行分类，复制拓扑服务器本身。事实上，当一个主节点的所有副本都同意它们无法联系到它们的主节点时，复制拓扑实际上就被破坏了，故障转移是合理的。
`orchestrator`'s holistic failure detection approach is known to be very reliable in production.
`orchestrator` 众所周知，整体故障检测方法在生产中非常可靠。

### Detection and recovery

Detection does not always lead to [recovery](topology-recovery.md). There are scenarios where a recovery is undesired:

- The cluster is not listed for auto-failovers.
- The admin user has indicated a recovery should not take place on the specific server.
- The admin user has globally disabled recoveries.
- A previous recovery on same cluster completed shortly before, and anti-flapping takes place.
- The failure type is not deemed worthy of recovery.

On desired scenarios, recovery immediately follows detection. On others, such as blocked recoveries, a recovery may follow a detection after many minutes.

Detection is independent of recovery, and is always enabled. `OnFailureDetectionProcesses` hooks are executed per detection, see [failure detection configuration](configuration-failure-detection.md).

### Failure detection scenarios

Observe the following list of potential failures:

* DeadMaster
* DeadMasterAndReplicas
* DeadMasterAndSomeReplicas
* DeadMasterWithoutReplicas
* UnreachableMasterWithLaggingReplicas
* UnreachableMaster
* LockedSemiSyncMaster
* MasterWithTooManySemiSyncReplicas
* AllMasterReplicasNotReplicating
* AllMasterReplicasNotReplicatingOrDead
* DeadCoMaster
* DeadCoMasterAndSomeReplicas
* DeadIntermediateMaster
* DeadIntermediateMasterWithSingleReplicaFailingToConnect
* DeadIntermediateMasterWithSingleReplica
* DeadIntermediateMasterAndSomeReplicas
* DeadIntermediateMasterAndReplicas
* AllIntermediateMasterReplicasFailingToConnectOrDead
* AllIntermediateMasterReplicasNotReplicating
* UnreachableIntermediateMasterWithLaggingReplicas
* UnreachableIntermediateMaster
* BinlogServerFailingToConnectToMaster

Briefly looking at some examples, here is how `orchestrator` reaches failure conclusions:

#### `DeadMaster`:

1. Master MySQL access failure
2. All of master's replicas are failing replication

This makes for a potential recovery process

#### `DeadMasterAndSomeReplicas`:

1. Master MySQL access failure
2. Some of its replicas are also unreachable
3. Rest of the replicas are failing replication

This makes for a potential recovery process

#### `UnreachableMaster`:

1. Master MySQL access failure
2. But it has replicating replicas.

This does not make for a recovery process. However, to improve analysis, `orchestrator` will
issue an emergent re-read of the replicas, to figure out whether they are really happy with the master
(in which case maybe `orchestrator` cannot see it due to a network glitch) or were actually taking
their time to figure out they were failing replication.

#### `DeadIntermediateMaster`:

1. An intermediate master (replica with replicas) cannot be reached
2. All of its replicas are failing replication

This makes for a potential recovery process.

#### `UnreachableMasterWithLaggingReplicas`:

1. Master cannot be reached
2. All of its immediate replicas (excluding SQL delayed) are lagging

This scenario can happen when the master is overloaded. Clients would see a "Too many connections", while the replicas, which have been connected since long ago, claim the master is fine. Similarly, if the master is locked due to some metadata operation, clients would be blocked on connection while replicas _may claim_ everything's fine. However, since apps cannot connect to the master, no actual data gets written, and when using a heartbeat mechanism such as `pt-heartbeat`, we can observe a growing lag on replicas.

`orchestrator` responds to this scenario by restarting replication on all of master's immediate replicas. This will close the old client connections on those replicas and attempt to initiate new ones. These may now fail to connect, leading to a complete replication failure on all replicas. This will next lead `orchestrator` to analyze a `DeadMaster`.

#### `LockedSemiSyncMaster`

1. Master is running with semi-sync enabled (`rpl_semi_sync_master_enabled=1`)
2. Number of connected semi-sync replicas falls short of expected `rpl_semi_sync_master_wait_for_slave_count`
3. `rpl_semi_sync_master_timeout` is high enough such that master locks writes and does not fall back to asynchronous replication

This condition only triggers after `ReasonableLockedSemiSyncMasterSeconds` has passed. If `ReasonableLockedSemiSyncMasterSeconds` is not set, 
it triggers after `ReasonableReplicationLagSeconds`.

Remediation of this condition can be to disable semi-sync on the master, or to bring up (or enable) sufficient semi-sync replicas.

If `EnforceExactSemiSyncReplicas` is enabled, `orchestrator` will determine the desired semi-sync topology and enable/disable semi-sync on the replicas to match it.
The desired topology is defined by the priority order (see below) and the master wait count.

If `RecoverLockedSemiSyncMaster` is enabled, `orchestrator` will enable (but never disable) semi-sync on the replicas in priority order until
the number of semi-sync replicas matches the master wait count. Please note that `RecoverLockedSemiSyncMaster` has no effect if `EnforceExactSemiSyncReplicas` is set.

The priority order is defined by `DetectSemiSyncEnforcedQuery` (higher number is higher priority), the promotion rule (`DetectPromotionRuleQuery`) and the hostname (fallback).

If `EnforceExactSemiSyncReplicas` and `RecoverLockedSemiSyncMaster` are both disabled (default), `orchestrator` does not invoke any recovery processes for this type of analysis.

Please also consult the [semi-sync topology](configuration-discovery-classifying.md#semi-sync-topology) documentation for more details.

#### `MasterWithTooManySemiSyncReplicas`

1. Master is running with semi-sync enabled (`rpl_semi_sync_master_enabled=1`)
2. Number of connected semi-sync replicas is higher than the expected `rpl_semi_sync_master_wait_for_slave_count`
3. `EnforceExactSemiSyncReplicas` is enabled (this analysis is not triggered if this flag is not enabled)

If `EnforceExactSemiSyncReplicas` is enabled, `orchestrator` will determine the desired semi-sync topology and enable/disable semi-sync on the replicas to match it.
The desired topology is defined by the priority order and the master wait count.

The priority order is defined by `DetectSemiSyncEnforcedQuery` (higher number is higher priority), the promotion rule (`DetectPromotionRuleQuery`) and the hostname (fallback).

If `EnforceExactSemiSyncReplicas` is disabled (default), `orchestrator` does not invoke any recovery processes for this type of analysis.

Please also consult the [semi-sync topology](configuration-discovery-classifying.md#semi-sync-topology) documentation for more details.

### Failures of no interest

The following scenarios are of no interest to `orchestrator`, and while the information and state are available to `orchestrator`, it does not recognize such scenarios as _failures_ per se; there's no detection hooks invoked and obviously no recoveries attempted:

- Failure of simple replicas (_leaves_ on the replication topology graph)
  Exception: semi sync replicas causing `LockedSemiSyncMaster`
- Replication lags, even severe.

### Visibility

An up-to-date analysis is available via:

- Command line: `orchestrator-client -c replication-analysis`
  or `orchestrator -c replication-analysis`
- Web API: `/api/replication-analysis`
- Web: `/web/clusters-analysis/` page (`Clusters`->`Failure analysis`).
  This presents an incomplete list of problems, only highlighting actionable ones.

Read next: [Topology recovery](topology-recovery.md)
