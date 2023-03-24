package agent_logger

import (
	"fmt"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

const (
	LogEncodingJson   = "json"
	LogEncodingText   = "text"
	LogEncodingXML    = "xml"
	LogEncodingCSV    = "csv"
	agentLogPrefix    = "saas_agent.log"
	agentLogErrPrefix = "saas_agent_error.error"
	logDir            = "logs/"
)

var logger *zap.Logger

// InitLogger 初始化日志记录器
func InitLogger() error {
	// 创建一个新的 Zap 配置
	config := zap.Config{
		Encoding:         LogEncodingJson,                             // 日志编码格式
		Level:            zap.NewAtomicLevelAt(zap.InfoLevel),         // 日志级别
		OutputPaths:      []string{"stdout", logDir + agentLogPrefix}, // 日志输出路径
		ErrorOutputPaths: []string{logDir + agentLogErrPrefix},        // 错误日志输出路径
		EncoderConfig: zapcore.EncoderConfig{
			TimeKey:      "time",                        // 时间字段名称
			LevelKey:     "level",                       // 级别字段名称
			MessageKey:   "message",                     // 消息字段名称
			CallerKey:    "caller",                      // 调用者字段名称
			EncodeTime:   zapcore.ISO8601TimeEncoder,    // 时间编码器
			EncodeLevel:  zapcore.LowercaseLevelEncoder, // 级别编码器
			EncodeCaller: zapcore.ShortCallerEncoder,    // 调用者编码器
		},
	}

	// 根据配置创建一个新的 Zap 日志记录器
	var err error
	logger, err = config.Build()
	if err != nil {
		return fmt.Errorf("初始化日志记录器失败：%s", err.Error())
	}

	return nil
}

// CloseLogger 关闭日志记录器
func CloseLogger() {
	if logger != nil {
		logger.Sync()
	}
}

// Debug 记录 DEBUG 级别的日志
func Debug(msg string, fields ...zap.Field) {
	logger.Debug(msg, fields...)
}

// Info 记录 INFO 级别的日志
func Info(msg string, fields ...zap.Field) {
	logger.Info(msg, fields...)
}

// Warn 记录 WARN 级别的日志
func Warn(msg string, fields ...zap.Field) {
	logger.Warn(msg, fields...)
}

// Error 记录 ERROR 级别的日志
func Error(msg string, fields ...zap.Field) {
	logger.Error(msg, fields...)
}

// DPanic 记录 DPANIC 级别的日志
func DPanic(msg string, fields ...zap.Field) {
	logger.DPanic(msg, fields...)
}

// Panic 记录 PANIC 级别的日志
func Panic(msg string, fields ...zap.Field) {
	logger.Panic(msg, fields...)
}

// Fatal 记录 FATAL 级别的日志
func Fatal(msg string, fields ...zap.Field) {
	logger.Fatal(msg, fields...)
}
