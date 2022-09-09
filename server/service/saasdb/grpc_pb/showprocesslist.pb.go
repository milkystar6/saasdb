// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v3.20.1
// source: showprocesslist.proto

package grpc_pb

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

// 定义 show processlist需要的消息
type ShowProcesslistRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	MySQLIP   string `protobuf:"bytes,1,opt,name=MySQLIP,proto3" json:"MySQLIP,omitempty"`
	MySQLPort int32  `protobuf:"varint,2,opt,name=MySQLPort,proto3" json:"MySQLPort,omitempty"`
}

func (x *ShowProcesslistRequest) Reset() {
	*x = ShowProcesslistRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_showprocesslist_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ShowProcesslistRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ShowProcesslistRequest) ProtoMessage() {}

func (x *ShowProcesslistRequest) ProtoReflect() protoreflect.Message {
	mi := &file_showprocesslist_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ShowProcesslistRequest.ProtoReflect.Descriptor instead.
func (*ShowProcesslistRequest) Descriptor() ([]byte, []int) {
	return file_showprocesslist_proto_rawDescGZIP(), []int{0}
}

func (x *ShowProcesslistRequest) GetMySQLIP() string {
	if x != nil {
		return x.MySQLIP
	}
	return ""
}

func (x *ShowProcesslistRequest) GetMySQLPort() int32 {
	if x != nil {
		return x.MySQLPort
	}
	return 0
}

// 定义 stop processlist需要的消息
type StopProcessRequset struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	MySQLIP   string `protobuf:"bytes,1,opt,name=MySQLIP,proto3" json:"MySQLIP,omitempty"`
	MySQLPort int32  `protobuf:"varint,2,opt,name=MySQLPort,proto3" json:"MySQLPort,omitempty"`
	ProcessId int32  `protobuf:"varint,3,opt,name=ProcessId,proto3" json:"ProcessId,omitempty"`
}

func (x *StopProcessRequset) Reset() {
	*x = StopProcessRequset{}
	if protoimpl.UnsafeEnabled {
		mi := &file_showprocesslist_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *StopProcessRequset) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*StopProcessRequset) ProtoMessage() {}

func (x *StopProcessRequset) ProtoReflect() protoreflect.Message {
	mi := &file_showprocesslist_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use StopProcessRequset.ProtoReflect.Descriptor instead.
func (*StopProcessRequset) Descriptor() ([]byte, []int) {
	return file_showprocesslist_proto_rawDescGZIP(), []int{1}
}

func (x *StopProcessRequset) GetMySQLIP() string {
	if x != nil {
		return x.MySQLIP
	}
	return ""
}

func (x *StopProcessRequset) GetMySQLPort() int32 {
	if x != nil {
		return x.MySQLPort
	}
	return 0
}

func (x *StopProcessRequset) GetProcessId() int32 {
	if x != nil {
		return x.ProcessId
	}
	return 0
}

// 定义 show processlist返回的消息
type ShowProcesslistResponce struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	ProcessListInfo []*ProcessListInfo `protobuf:"bytes,1,rep,name=ProcessListInfo,proto3" json:"ProcessListInfo,omitempty"`
}

func (x *ShowProcesslistResponce) Reset() {
	*x = ShowProcesslistResponce{}
	if protoimpl.UnsafeEnabled {
		mi := &file_showprocesslist_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ShowProcesslistResponce) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ShowProcesslistResponce) ProtoMessage() {}

func (x *ShowProcesslistResponce) ProtoReflect() protoreflect.Message {
	mi := &file_showprocesslist_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ShowProcesslistResponce.ProtoReflect.Descriptor instead.
func (*ShowProcesslistResponce) Descriptor() ([]byte, []int) {
	return file_showprocesslist_proto_rawDescGZIP(), []int{2}
}

func (x *ShowProcesslistResponce) GetProcessListInfo() []*ProcessListInfo {
	if x != nil {
		return x.ProcessListInfo
	}
	return nil
}

// 定义 stop processlist返回的消息
type StopProcessResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	IsSuccess               int32  `protobuf:"varint,1,opt,name=IsSuccess,proto3" json:"IsSuccess,omitempty"`
	MoreDetailedInformation string `protobuf:"bytes,2,opt,name=MoreDetailedInformation,proto3" json:"MoreDetailedInformation,omitempty"`
}

func (x *StopProcessResponse) Reset() {
	*x = StopProcessResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_showprocesslist_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *StopProcessResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*StopProcessResponse) ProtoMessage() {}

func (x *StopProcessResponse) ProtoReflect() protoreflect.Message {
	mi := &file_showprocesslist_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use StopProcessResponse.ProtoReflect.Descriptor instead.
func (*StopProcessResponse) Descriptor() ([]byte, []int) {
	return file_showprocesslist_proto_rawDescGZIP(), []int{3}
}

func (x *StopProcessResponse) GetIsSuccess() int32 {
	if x != nil {
		return x.IsSuccess
	}
	return 0
}

func (x *StopProcessResponse) GetMoreDetailedInformation() string {
	if x != nil {
		return x.MoreDetailedInformation
	}
	return ""
}

type ProcessListInfo struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	ID      uint32 `protobuf:"varint,1,opt,name=ID,proto3" json:"ID,omitempty"`
	USER    string `protobuf:"bytes,2,opt,name=USER,proto3" json:"USER,omitempty"`
	HOST    string `protobuf:"bytes,3,opt,name=HOST,proto3" json:"HOST,omitempty"`
	DB      string `protobuf:"bytes,4,opt,name=DB,proto3" json:"DB,omitempty"`
	COMMAND string `protobuf:"bytes,5,opt,name=COMMAND,proto3" json:"COMMAND,omitempty"`
	TIME    uint32 `protobuf:"varint,6,opt,name=TIME,proto3" json:"TIME,omitempty"`
	STATE   string `protobuf:"bytes,7,opt,name=STATE,proto3" json:"STATE,omitempty"`
	INFO    string `protobuf:"bytes,8,opt,name=INFO,proto3" json:"INFO,omitempty"`
}

func (x *ProcessListInfo) Reset() {
	*x = ProcessListInfo{}
	if protoimpl.UnsafeEnabled {
		mi := &file_showprocesslist_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *ProcessListInfo) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*ProcessListInfo) ProtoMessage() {}

func (x *ProcessListInfo) ProtoReflect() protoreflect.Message {
	mi := &file_showprocesslist_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use ProcessListInfo.ProtoReflect.Descriptor instead.
func (*ProcessListInfo) Descriptor() ([]byte, []int) {
	return file_showprocesslist_proto_rawDescGZIP(), []int{4}
}

func (x *ProcessListInfo) GetID() uint32 {
	if x != nil {
		return x.ID
	}
	return 0
}

func (x *ProcessListInfo) GetUSER() string {
	if x != nil {
		return x.USER
	}
	return ""
}

func (x *ProcessListInfo) GetHOST() string {
	if x != nil {
		return x.HOST
	}
	return ""
}

func (x *ProcessListInfo) GetDB() string {
	if x != nil {
		return x.DB
	}
	return ""
}

func (x *ProcessListInfo) GetCOMMAND() string {
	if x != nil {
		return x.COMMAND
	}
	return ""
}

func (x *ProcessListInfo) GetTIME() uint32 {
	if x != nil {
		return x.TIME
	}
	return 0
}

func (x *ProcessListInfo) GetSTATE() string {
	if x != nil {
		return x.STATE
	}
	return ""
}

func (x *ProcessListInfo) GetINFO() string {
	if x != nil {
		return x.INFO
	}
	return ""
}

var File_showprocesslist_proto protoreflect.FileDescriptor

var file_showprocesslist_proto_rawDesc = []byte{
	0x0a, 0x15, 0x73, 0x68, 0x6f, 0x77, 0x70, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x6c, 0x69, 0x73,
	0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x06, 0x73, 0x61, 0x61, 0x73, 0x64, 0x62, 0x22,
	0x50, 0x0a, 0x16, 0x53, 0x68, 0x6f, 0x77, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x6c, 0x69,
	0x73, 0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x18, 0x0a, 0x07, 0x4d, 0x79, 0x53,
	0x51, 0x4c, 0x49, 0x50, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x4d, 0x79, 0x53, 0x51,
	0x4c, 0x49, 0x50, 0x12, 0x1c, 0x0a, 0x09, 0x4d, 0x79, 0x53, 0x51, 0x4c, 0x50, 0x6f, 0x72, 0x74,
	0x18, 0x02, 0x20, 0x01, 0x28, 0x05, 0x52, 0x09, 0x4d, 0x79, 0x53, 0x51, 0x4c, 0x50, 0x6f, 0x72,
	0x74, 0x22, 0x6a, 0x0a, 0x12, 0x53, 0x74, 0x6f, 0x70, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73,
	0x52, 0x65, 0x71, 0x75, 0x73, 0x65, 0x74, 0x12, 0x18, 0x0a, 0x07, 0x4d, 0x79, 0x53, 0x51, 0x4c,
	0x49, 0x50, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x4d, 0x79, 0x53, 0x51, 0x4c, 0x49,
	0x50, 0x12, 0x1c, 0x0a, 0x09, 0x4d, 0x79, 0x53, 0x51, 0x4c, 0x50, 0x6f, 0x72, 0x74, 0x18, 0x02,
	0x20, 0x01, 0x28, 0x05, 0x52, 0x09, 0x4d, 0x79, 0x53, 0x51, 0x4c, 0x50, 0x6f, 0x72, 0x74, 0x12,
	0x1c, 0x0a, 0x09, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x49, 0x64, 0x18, 0x03, 0x20, 0x01,
	0x28, 0x05, 0x52, 0x09, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x49, 0x64, 0x22, 0x5c, 0x0a,
	0x17, 0x53, 0x68, 0x6f, 0x77, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x6c, 0x69, 0x73, 0x74,
	0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x63, 0x65, 0x12, 0x41, 0x0a, 0x0f, 0x50, 0x72, 0x6f, 0x63,
	0x65, 0x73, 0x73, 0x4c, 0x69, 0x73, 0x74, 0x49, 0x6e, 0x66, 0x6f, 0x18, 0x01, 0x20, 0x03, 0x28,
	0x0b, 0x32, 0x17, 0x2e, 0x73, 0x61, 0x61, 0x73, 0x64, 0x62, 0x2e, 0x50, 0x72, 0x6f, 0x63, 0x65,
	0x73, 0x73, 0x4c, 0x69, 0x73, 0x74, 0x49, 0x6e, 0x66, 0x6f, 0x52, 0x0f, 0x50, 0x72, 0x6f, 0x63,
	0x65, 0x73, 0x73, 0x4c, 0x69, 0x73, 0x74, 0x49, 0x6e, 0x66, 0x6f, 0x22, 0x6d, 0x0a, 0x13, 0x53,
	0x74, 0x6f, 0x70, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e,
	0x73, 0x65, 0x12, 0x1c, 0x0a, 0x09, 0x49, 0x73, 0x53, 0x75, 0x63, 0x63, 0x65, 0x73, 0x73, 0x18,
	0x01, 0x20, 0x01, 0x28, 0x05, 0x52, 0x09, 0x49, 0x73, 0x53, 0x75, 0x63, 0x63, 0x65, 0x73, 0x73,
	0x12, 0x38, 0x0a, 0x17, 0x4d, 0x6f, 0x72, 0x65, 0x44, 0x65, 0x74, 0x61, 0x69, 0x6c, 0x65, 0x64,
	0x49, 0x6e, 0x66, 0x6f, 0x72, 0x6d, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x18, 0x02, 0x20, 0x01, 0x28,
	0x09, 0x52, 0x17, 0x4d, 0x6f, 0x72, 0x65, 0x44, 0x65, 0x74, 0x61, 0x69, 0x6c, 0x65, 0x64, 0x49,
	0x6e, 0x66, 0x6f, 0x72, 0x6d, 0x61, 0x74, 0x69, 0x6f, 0x6e, 0x22, 0xb1, 0x01, 0x0a, 0x0f, 0x50,
	0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x4c, 0x69, 0x73, 0x74, 0x49, 0x6e, 0x66, 0x6f, 0x12, 0x0e,
	0x0a, 0x02, 0x49, 0x44, 0x18, 0x01, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x02, 0x49, 0x44, 0x12, 0x12,
	0x0a, 0x04, 0x55, 0x53, 0x45, 0x52, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x55, 0x53,
	0x45, 0x52, 0x12, 0x12, 0x0a, 0x04, 0x48, 0x4f, 0x53, 0x54, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x04, 0x48, 0x4f, 0x53, 0x54, 0x12, 0x0e, 0x0a, 0x02, 0x44, 0x42, 0x18, 0x04, 0x20, 0x01,
	0x28, 0x09, 0x52, 0x02, 0x44, 0x42, 0x12, 0x18, 0x0a, 0x07, 0x43, 0x4f, 0x4d, 0x4d, 0x41, 0x4e,
	0x44, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x43, 0x4f, 0x4d, 0x4d, 0x41, 0x4e, 0x44,
	0x12, 0x12, 0x0a, 0x04, 0x54, 0x49, 0x4d, 0x45, 0x18, 0x06, 0x20, 0x01, 0x28, 0x0d, 0x52, 0x04,
	0x54, 0x49, 0x4d, 0x45, 0x12, 0x14, 0x0a, 0x05, 0x53, 0x54, 0x41, 0x54, 0x45, 0x18, 0x07, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x05, 0x53, 0x54, 0x41, 0x54, 0x45, 0x12, 0x12, 0x0a, 0x04, 0x49, 0x4e,
	0x46, 0x4f, 0x18, 0x08, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x49, 0x4e, 0x46, 0x4f, 0x32, 0x76,
	0x0a, 0x1b, 0x4d, 0x79, 0x53, 0x51, 0x4c, 0x53, 0x68, 0x6f, 0x77, 0x50, 0x72, 0x6f, 0x63, 0x65,
	0x73, 0x73, 0x4c, 0x69, 0x73, 0x74, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x57, 0x0a,
	0x12, 0x4e, 0x65, 0x77, 0x53, 0x68, 0x6f, 0x77, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x6c,
	0x69, 0x73, 0x74, 0x12, 0x1e, 0x2e, 0x73, 0x61, 0x61, 0x73, 0x64, 0x62, 0x2e, 0x53, 0x68, 0x6f,
	0x77, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x71, 0x75,
	0x65, 0x73, 0x74, 0x1a, 0x1f, 0x2e, 0x73, 0x61, 0x61, 0x73, 0x64, 0x62, 0x2e, 0x53, 0x68, 0x6f,
	0x77, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x6c, 0x69, 0x73, 0x74, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x63, 0x65, 0x22, 0x00, 0x32, 0x66, 0x0a, 0x17, 0x4d, 0x79, 0x53, 0x51, 0x4c, 0x53,
	0x74, 0x6f, 0x70, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63,
	0x65, 0x12, 0x4b, 0x0a, 0x0e, 0x4e, 0x65, 0x77, 0x53, 0x74, 0x6f, 0x70, 0x50, 0x72, 0x6f, 0x63,
	0x65, 0x73, 0x73, 0x12, 0x1a, 0x2e, 0x73, 0x61, 0x61, 0x73, 0x64, 0x62, 0x2e, 0x53, 0x74, 0x6f,
	0x70, 0x50, 0x72, 0x6f, 0x63, 0x65, 0x73, 0x73, 0x52, 0x65, 0x71, 0x75, 0x73, 0x65, 0x74, 0x1a,
	0x1b, 0x2e, 0x73, 0x61, 0x61, 0x73, 0x64, 0x62, 0x2e, 0x53, 0x74, 0x6f, 0x70, 0x50, 0x72, 0x6f,
	0x63, 0x65, 0x73, 0x73, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x42, 0x14,
	0x5a, 0x12, 0x2e, 0x2e, 0x67, 0x72, 0x70, 0x63, 0x5f, 0x70, 0x62, 0x2f, 0x3b, 0x67, 0x72, 0x70,
	0x63, 0x5f, 0x70, 0x62, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_showprocesslist_proto_rawDescOnce sync.Once
	file_showprocesslist_proto_rawDescData = file_showprocesslist_proto_rawDesc
)

func file_showprocesslist_proto_rawDescGZIP() []byte {
	file_showprocesslist_proto_rawDescOnce.Do(func() {
		file_showprocesslist_proto_rawDescData = protoimpl.X.CompressGZIP(file_showprocesslist_proto_rawDescData)
	})
	return file_showprocesslist_proto_rawDescData
}

var file_showprocesslist_proto_msgTypes = make([]protoimpl.MessageInfo, 5)
var file_showprocesslist_proto_goTypes = []interface{}{
	(*ShowProcesslistRequest)(nil),  // 0: saasdb.ShowProcesslistRequest
	(*StopProcessRequset)(nil),      // 1: saasdb.StopProcessRequset
	(*ShowProcesslistResponce)(nil), // 2: saasdb.ShowProcesslistResponce
	(*StopProcessResponse)(nil),     // 3: saasdb.StopProcessResponse
	(*ProcessListInfo)(nil),         // 4: saasdb.ProcessListInfo
}
var file_showprocesslist_proto_depIdxs = []int32{
	4, // 0: saasdb.ShowProcesslistResponce.ProcessListInfo:type_name -> saasdb.ProcessListInfo
	0, // 1: saasdb.MySQLShowProcessListService.NewShowProcesslist:input_type -> saasdb.ShowProcesslistRequest
	1, // 2: saasdb.MySQLStopProcessService.NewStopProcess:input_type -> saasdb.StopProcessRequset
	2, // 3: saasdb.MySQLShowProcessListService.NewShowProcesslist:output_type -> saasdb.ShowProcesslistResponce
	3, // 4: saasdb.MySQLStopProcessService.NewStopProcess:output_type -> saasdb.StopProcessResponse
	3, // [3:5] is the sub-list for method output_type
	1, // [1:3] is the sub-list for method input_type
	1, // [1:1] is the sub-list for extension type_name
	1, // [1:1] is the sub-list for extension extendee
	0, // [0:1] is the sub-list for field type_name
}

func init() { file_showprocesslist_proto_init() }
func file_showprocesslist_proto_init() {
	if File_showprocesslist_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_showprocesslist_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ShowProcesslistRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_showprocesslist_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*StopProcessRequset); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_showprocesslist_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ShowProcesslistResponce); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_showprocesslist_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*StopProcessResponse); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_showprocesslist_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*ProcessListInfo); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_showprocesslist_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   5,
			NumExtensions: 0,
			NumServices:   2,
		},
		GoTypes:           file_showprocesslist_proto_goTypes,
		DependencyIndexes: file_showprocesslist_proto_depIdxs,
		MessageInfos:      file_showprocesslist_proto_msgTypes,
	}.Build()
	File_showprocesslist_proto = out.File
	file_showprocesslist_proto_rawDesc = nil
	file_showprocesslist_proto_goTypes = nil
	file_showprocesslist_proto_depIdxs = nil
}
