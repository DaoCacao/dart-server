///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ResultStatus extends $pb.ProtobufEnum {
  static const ResultStatus UNKNOWN = ResultStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');
  static const ResultStatus OK = ResultStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OK');
  static const ResultStatus UNAUTHORIZED = ResultStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNAUTHORIZED');
  static const ResultStatus NOT_FOUND = ResultStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NOT_FOUND');
  static const ResultStatus ERROR = ResultStatus._(6, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ERROR');

  static const $core.List<ResultStatus> values = <ResultStatus> [
    UNKNOWN,
    OK,
    UNAUTHORIZED,
    NOT_FOUND,
    ERROR,
  ];

  static final $core.Map<$core.int, ResultStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResultStatus? valueOf($core.int value) => _byValue[value];

  const ResultStatus._($core.int v, $core.String n) : super(v, n);
}

