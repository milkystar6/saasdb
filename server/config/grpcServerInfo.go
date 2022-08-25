package config

type GrpcServer struct {
	/* grpc_pb 管理所需的节点信息 */
	GrpcServerListenPort    int    `mapstructure:"grpcServerListenPort" json:"grpcServerListenPort" yaml:"grpcServerListenPort"`
	GrpcMySQLMangerUser     string `mapstructure:"grpcMySQLMangerUser" json:"grpcMySQLMangerUser" yaml:"grpcMySQLMangerUser"`
	GrpcMySQLMangerPassword string `mapstructure:"grpcMySQLMangerPassword" json:"grpcMySQLMangerPassword" yaml:"grpcMySQLMangerPassword"`

	/* cerify x-509 证书相关  */
	GrpcCA     string `mapstructure:"grpcCA" json:"grpcCA" yaml:"grpcCA"`
	GrpcKey    string `mapstructure:"grpcKey" json:"grpcKey" yaml:"grpcKey"`
	GrpcWebUrl string `mapstructure:"grpcWebUrl" json:"grpcWebUrl" yaml:"grpcWebUrl"`
}
