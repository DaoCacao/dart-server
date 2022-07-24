///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use resultStatusDescriptor instead')
const ResultStatus$json = const {
  '1': 'ResultStatus',
  '2': const [
    const {'1': 'UNKNOWN', '2': 0},
    const {'1': 'OK', '2': 1},
    const {'1': 'UNAUTHORIZED', '2': 2},
    const {'1': 'NOT_FOUND', '2': 3},
    const {'1': 'ERROR', '2': 6},
  ],
};

/// Descriptor for `ResultStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List resultStatusDescriptor = $convert.base64Decode('CgxSZXN1bHRTdGF0dXMSCwoHVU5LTk9XThAAEgYKAk9LEAESEAoMVU5BVVRIT1JJWkVEEAISDQoJTk9UX0ZPVU5EEAMSCQoFRVJST1IQBg==');
@$core.Deprecated('Use resultDescriptor instead')
const Result$json = const {
  '1': 'Result',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.ResultStatus', '10': 'status'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Result`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultDescriptor = $convert.base64Decode('CgZSZXN1bHQSJQoGc3RhdHVzGAEgASgOMg0uUmVzdWx0U3RhdHVzUgZzdGF0dXMSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');
@$core.Deprecated('Use headersDescriptor instead')
const Headers$json = const {
  '1': 'Headers',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `Headers`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List headersDescriptor = $convert.base64Decode('CgdIZWFkZXJzEhQKBXRva2VuGAEgASgJUgV0b2tlbg==');
@$core.Deprecated('Use userRawDescriptor instead')
const UserRaw$json = const {
  '1': 'UserRaw',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
  ],
};

/// Descriptor for `UserRaw`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRawDescriptor = $convert.base64Decode('CgdVc2VyUmF3Eg4KAmlkGAEgASgFUgJpZBIaCgh1c2VybmFtZRgCIAEoCVIIdXNlcm5hbWU=');
@$core.Deprecated('Use signUpRequestDescriptor instead')
const SignUpRequest$json = const {
  '1': 'SignUpRequest',
  '2': const [
    const {'1': 'headers', '3': 1, '4': 1, '5': 11, '6': '.Headers', '10': 'headers'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'passworrd', '3': 3, '4': 1, '5': 9, '10': 'passworrd'},
  ],
};

/// Descriptor for `SignUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpRequestDescriptor = $convert.base64Decode('Cg1TaWduVXBSZXF1ZXN0EiIKB2hlYWRlcnMYASABKAsyCC5IZWFkZXJzUgdoZWFkZXJzEhoKCHVzZXJuYW1lGAIgASgJUgh1c2VybmFtZRIcCglwYXNzd29ycmQYAyABKAlSCXBhc3N3b3JyZA==');
@$core.Deprecated('Use signUpResponseDescriptor instead')
const SignUpResponse$json = const {
  '1': 'SignUpResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.Result', '10': 'result'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.UserRaw', '10': 'user'},
  ],
};

/// Descriptor for `SignUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpResponseDescriptor = $convert.base64Decode('Cg5TaWduVXBSZXNwb25zZRIfCgZyZXN1bHQYASABKAsyBy5SZXN1bHRSBnJlc3VsdBIUCgV0b2tlbhgCIAEoCVIFdG9rZW4SHAoEdXNlchgDIAEoCzIILlVzZXJSYXdSBHVzZXI=');
@$core.Deprecated('Use signInRequestDescriptor instead')
const SignInRequest$json = const {
  '1': 'SignInRequest',
  '2': const [
    const {'1': 'headers', '3': 1, '4': 1, '5': 11, '6': '.Headers', '10': 'headers'},
    const {'1': 'username', '3': 2, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `SignInRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signInRequestDescriptor = $convert.base64Decode('Cg1TaWduSW5SZXF1ZXN0EiIKB2hlYWRlcnMYASABKAsyCC5IZWFkZXJzUgdoZWFkZXJzEhoKCHVzZXJuYW1lGAIgASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use signInResponseDescriptor instead')
const SignInResponse$json = const {
  '1': 'SignInResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.Result', '10': 'result'},
    const {'1': 'token', '3': 2, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'user', '3': 3, '4': 1, '5': 11, '6': '.UserRaw', '10': 'user'},
  ],
};

/// Descriptor for `SignInResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signInResponseDescriptor = $convert.base64Decode('Cg5TaWduSW5SZXNwb25zZRIfCgZyZXN1bHQYASABKAsyBy5SZXN1bHRSBnJlc3VsdBIUCgV0b2tlbhgCIAEoCVIFdG9rZW4SHAoEdXNlchgDIAEoCzIILlVzZXJSYXdSBHVzZXI=');
@$core.Deprecated('Use echoRequestDescriptor instead')
const EchoRequest$json = const {
  '1': 'EchoRequest',
  '2': const [
    const {'1': 'headers', '3': 1, '4': 1, '5': 11, '6': '.Headers', '10': 'headers'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `EchoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoRequestDescriptor = $convert.base64Decode('CgtFY2hvUmVxdWVzdBIiCgdoZWFkZXJzGAEgASgLMgguSGVhZGVyc1IHaGVhZGVycxIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdl');
@$core.Deprecated('Use echoResponseDescriptor instead')
const EchoResponse$json = const {
  '1': 'EchoResponse',
  '2': const [
    const {'1': 'result', '3': 1, '4': 1, '5': 11, '6': '.Result', '10': 'result'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `EchoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List echoResponseDescriptor = $convert.base64Decode('CgxFY2hvUmVzcG9uc2USHwoGcmVzdWx0GAEgASgLMgcuUmVzdWx0UgZyZXN1bHQSGAoHbWVzc2FnZRgCIAEoCVIHbWVzc2FnZQ==');
