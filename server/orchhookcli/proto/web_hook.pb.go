// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.28.1
// 	protoc        v3.20.1
// source: web_hook.proto

package proto

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

// Operator Dead Master
type DeadMasterRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	DeadMasterAddress string `protobuf:"bytes,1,opt,name=DeadMasterAddress,proto3" json:"DeadMasterAddress,omitempty"`
}

func (x *DeadMasterRequest) Reset() {
	*x = DeadMasterRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_web_hook_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeadMasterRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeadMasterRequest) ProtoMessage() {}

func (x *DeadMasterRequest) ProtoReflect() protoreflect.Message {
	mi := &file_web_hook_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeadMasterRequest.ProtoReflect.Descriptor instead.
func (*DeadMasterRequest) Descriptor() ([]byte, []int) {
	return file_web_hook_proto_rawDescGZIP(), []int{0}
}

func (x *DeadMasterRequest) GetDeadMasterAddress() string {
	if x != nil {
		return x.DeadMasterAddress
	}
	return ""
}

type DeadMasterResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	MessageInfo  string `protobuf:"bytes,1,opt,name=MessageInfo,proto3" json:"MessageInfo,omitempty"`
	MessageWarn  string `protobuf:"bytes,2,opt,name=MessageWarn,proto3" json:"MessageWarn,omitempty"`
	MessageError string `protobuf:"bytes,3,opt,name=MessageError,proto3" json:"MessageError,omitempty"`
}

func (x *DeadMasterResponse) Reset() {
	*x = DeadMasterResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_web_hook_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *DeadMasterResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*DeadMasterResponse) ProtoMessage() {}

func (x *DeadMasterResponse) ProtoReflect() protoreflect.Message {
	mi := &file_web_hook_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use DeadMasterResponse.ProtoReflect.Descriptor instead.
func (*DeadMasterResponse) Descriptor() ([]byte, []int) {
	return file_web_hook_proto_rawDescGZIP(), []int{1}
}

func (x *DeadMasterResponse) GetMessageInfo() string {
	if x != nil {
		return x.MessageInfo
	}
	return ""
}

func (x *DeadMasterResponse) GetMessageWarn() string {
	if x != nil {
		return x.MessageWarn
	}
	return ""
}

func (x *DeadMasterResponse) GetMessageError() string {
	if x != nil {
		return x.MessageError
	}
	return ""
}

// Operator New Master
type NewMasterRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	NewMasterAddress string `protobuf:"bytes,1,opt,name=NewMasterAddress,proto3" json:"NewMasterAddress,omitempty"`
}

func (x *NewMasterRequest) Reset() {
	*x = NewMasterRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_web_hook_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *NewMasterRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*NewMasterRequest) ProtoMessage() {}

func (x *NewMasterRequest) ProtoReflect() protoreflect.Message {
	mi := &file_web_hook_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use NewMasterRequest.ProtoReflect.Descriptor instead.
func (*NewMasterRequest) Descriptor() ([]byte, []int) {
	return file_web_hook_proto_rawDescGZIP(), []int{2}
}

func (x *NewMasterRequest) GetNewMasterAddress() string {
	if x != nil {
		return x.NewMasterAddress
	}
	return ""
}

type NewMasterResponse struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	MessageInfo  string `protobuf:"bytes,1,opt,name=MessageInfo,proto3" json:"MessageInfo,omitempty"`
	MessageWarn  string `protobuf:"bytes,2,opt,name=MessageWarn,proto3" json:"MessageWarn,omitempty"`
	MessageError string `protobuf:"bytes,3,opt,name=MessageError,proto3" json:"MessageError,omitempty"`
}

func (x *NewMasterResponse) Reset() {
	*x = NewMasterResponse{}
	if protoimpl.UnsafeEnabled {
		mi := &file_web_hook_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *NewMasterResponse) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*NewMasterResponse) ProtoMessage() {}

func (x *NewMasterResponse) ProtoReflect() protoreflect.Message {
	mi := &file_web_hook_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use NewMasterResponse.ProtoReflect.Descriptor instead.
func (*NewMasterResponse) Descriptor() ([]byte, []int) {
	return file_web_hook_proto_rawDescGZIP(), []int{3}
}

func (x *NewMasterResponse) GetMessageInfo() string {
	if x != nil {
		return x.MessageInfo
	}
	return ""
}

func (x *NewMasterResponse) GetMessageWarn() string {
	if x != nil {
		return x.MessageWarn
	}
	return ""
}

func (x *NewMasterResponse) GetMessageError() string {
	if x != nil {
		return x.MessageError
	}
	return ""
}

var File_web_hook_proto protoreflect.FileDescriptor

var file_web_hook_proto_rawDesc = []byte{
	0x0a, 0x0e, 0x77, 0x65, 0x62, 0x5f, 0x68, 0x6f, 0x6f, 0x6b, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f,
	0x22, 0x41, 0x0a, 0x11, 0x44, 0x65, 0x61, 0x64, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x2c, 0x0a, 0x11, 0x44, 0x65, 0x61, 0x64, 0x4d, 0x61, 0x73,
	0x74, 0x65, 0x72, 0x41, 0x64, 0x64, 0x72, 0x65, 0x73, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x11, 0x44, 0x65, 0x61, 0x64, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x41, 0x64, 0x64, 0x72,
	0x65, 0x73, 0x73, 0x22, 0x7c, 0x0a, 0x12, 0x44, 0x65, 0x61, 0x64, 0x4d, 0x61, 0x73, 0x74, 0x65,
	0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x20, 0x0a, 0x0b, 0x4d, 0x65, 0x73,
	0x73, 0x61, 0x67, 0x65, 0x49, 0x6e, 0x66, 0x6f, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b,
	0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x49, 0x6e, 0x66, 0x6f, 0x12, 0x20, 0x0a, 0x0b, 0x4d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x57, 0x61, 0x72, 0x6e, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x0b, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x57, 0x61, 0x72, 0x6e, 0x12, 0x22, 0x0a,
	0x0c, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x45, 0x72, 0x72, 0x6f, 0x72, 0x18, 0x03, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x0c, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x45, 0x72, 0x72, 0x6f,
	0x72, 0x22, 0x3e, 0x0a, 0x10, 0x4e, 0x65, 0x77, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x52, 0x65,
	0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x2a, 0x0a, 0x10, 0x4e, 0x65, 0x77, 0x4d, 0x61, 0x73, 0x74,
	0x65, 0x72, 0x41, 0x64, 0x64, 0x72, 0x65, 0x73, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52,
	0x10, 0x4e, 0x65, 0x77, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x41, 0x64, 0x64, 0x72, 0x65, 0x73,
	0x73, 0x22, 0x7b, 0x0a, 0x11, 0x4e, 0x65, 0x77, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x52, 0x65,
	0x73, 0x70, 0x6f, 0x6e, 0x73, 0x65, 0x12, 0x20, 0x0a, 0x0b, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67,
	0x65, 0x49, 0x6e, 0x66, 0x6f, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x4d, 0x65, 0x73,
	0x73, 0x61, 0x67, 0x65, 0x49, 0x6e, 0x66, 0x6f, 0x12, 0x20, 0x0a, 0x0b, 0x4d, 0x65, 0x73, 0x73,
	0x61, 0x67, 0x65, 0x57, 0x61, 0x72, 0x6e, 0x18, 0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x0b, 0x4d,
	0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x57, 0x61, 0x72, 0x6e, 0x12, 0x22, 0x0a, 0x0c, 0x4d, 0x65,
	0x73, 0x73, 0x61, 0x67, 0x65, 0x45, 0x72, 0x72, 0x6f, 0x72, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09,
	0x52, 0x0c, 0x4d, 0x65, 0x73, 0x73, 0x61, 0x67, 0x65, 0x45, 0x72, 0x72, 0x6f, 0x72, 0x32, 0x54,
	0x0a, 0x13, 0x4f, 0x70, 0x44, 0x65, 0x61, 0x64, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x53, 0x65,
	0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x3d, 0x0a, 0x10, 0x48, 0x61, 0x6e, 0x64, 0x6c, 0x65, 0x44,
	0x65, 0x61, 0x64, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x12, 0x12, 0x2e, 0x44, 0x65, 0x61, 0x64,
	0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x13, 0x2e,
	0x44, 0x65, 0x61, 0x64, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70, 0x6f, 0x6e,
	0x73, 0x65, 0x22, 0x00, 0x32, 0x50, 0x0a, 0x12, 0x4f, 0x70, 0x4e, 0x65, 0x77, 0x4d, 0x61, 0x73,
	0x74, 0x65, 0x72, 0x53, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x12, 0x3a, 0x0a, 0x0f, 0x48, 0x61,
	0x6e, 0x64, 0x6c, 0x65, 0x4e, 0x65, 0x77, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x12, 0x11, 0x2e,
	0x4e, 0x65, 0x77, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,
	0x1a, 0x12, 0x2e, 0x4e, 0x65, 0x77, 0x4d, 0x61, 0x73, 0x74, 0x65, 0x72, 0x52, 0x65, 0x73, 0x70,
	0x6f, 0x6e, 0x73, 0x65, 0x22, 0x00, 0x42, 0x10, 0x5a, 0x0e, 0x2e, 0x2e, 0x70, 0x72, 0x6f, 0x74,
	0x6f, 0x2f, 0x3b, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_web_hook_proto_rawDescOnce sync.Once
	file_web_hook_proto_rawDescData = file_web_hook_proto_rawDesc
)

func file_web_hook_proto_rawDescGZIP() []byte {
	file_web_hook_proto_rawDescOnce.Do(func() {
		file_web_hook_proto_rawDescData = protoimpl.X.CompressGZIP(file_web_hook_proto_rawDescData)
	})
	return file_web_hook_proto_rawDescData
}

var file_web_hook_proto_msgTypes = make([]protoimpl.MessageInfo, 4)
var file_web_hook_proto_goTypes = []interface{}{
	(*DeadMasterRequest)(nil),  // 0: DeadMasterRequest
	(*DeadMasterResponse)(nil), // 1: DeadMasterResponse
	(*NewMasterRequest)(nil),   // 2: NewMasterRequest
	(*NewMasterResponse)(nil),  // 3: NewMasterResponse
}
var file_web_hook_proto_depIdxs = []int32{
	0, // 0: OpDeadMasterService.HandleDeadMaster:input_type -> DeadMasterRequest
	2, // 1: OpNewMasterService.HandleNewMaster:input_type -> NewMasterRequest
	1, // 2: OpDeadMasterService.HandleDeadMaster:output_type -> DeadMasterResponse
	3, // 3: OpNewMasterService.HandleNewMaster:output_type -> NewMasterResponse
	2, // [2:4] is the sub-list for method output_type
	0, // [0:2] is the sub-list for method input_type
	0, // [0:0] is the sub-list for extension type_name
	0, // [0:0] is the sub-list for extension extendee
	0, // [0:0] is the sub-list for field type_name
}

func init() { file_web_hook_proto_init() }
func file_web_hook_proto_init() {
	if File_web_hook_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_web_hook_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeadMasterRequest); i {
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
		file_web_hook_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*DeadMasterResponse); i {
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
		file_web_hook_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*NewMasterRequest); i {
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
		file_web_hook_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*NewMasterResponse); i {
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
			RawDescriptor: file_web_hook_proto_rawDesc,
			NumEnums:      0,
			NumMessages:   4,
			NumExtensions: 0,
			NumServices:   2,
		},
		GoTypes:           file_web_hook_proto_goTypes,
		DependencyIndexes: file_web_hook_proto_depIdxs,
		MessageInfos:      file_web_hook_proto_msgTypes,
	}.Build()
	File_web_hook_proto = out.File
	file_web_hook_proto_rawDesc = nil
	file_web_hook_proto_goTypes = nil
	file_web_hook_proto_depIdxs = nil
}
