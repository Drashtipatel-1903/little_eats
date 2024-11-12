
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

/// Base response class for all api responses.
///
/// Now only need to generate class for body,
/// the rest will be handled by this generic class.
/// This class is must to use for responses which has structure like:
/// {
///   head: {...},
///   body: {...} or [...]
/// }.
@JsonSerializable(
  ignoreUnannotated: true,
  genericArgumentFactories: true,
  createFactory: false,
)
class BaseResponse<T> {
  @JsonKey(name: 'head')
  HeadResponse? head;
  @JsonKey(name: 'body')
  T? body;

  BaseResponse({this.head, this.body});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) jsonFrom) =>
      _baseResponseFromJson(json, jsonFrom);

  Map<String, dynamic> toJson(Object? Function(T) toJson) =>
      _$BaseResponseToJson(this, toJson);
}

/// We are using below from json method for [BaseResponse] class to generate
/// models class from api response with different keys.
///
/// Note: If in future some more keys/fields are added,
/// then we have to add conversion for that fields manually here.
/// JsonSerializable will only generate tojson methods, but for fromJson method
/// we have to add them manually as below function.
BaseResponse<T> _baseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      head: json['head'] == null
          ? json['Head'] == null
              ? null
              : HeadResponse.fromJson(json['Head'] as Map<String, dynamic>)
          : HeadResponse.fromJson(json['head'] as Map<String, dynamic>),
      body: json.containsKey('Body')
          ? _nullableGenericFromJson(json['Body'], fromJsonT)
          : _nullableGenericFromJson(json['body'], fromJsonT),
    );

T? _nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

@JsonSerializable(ignoreUnannotated: true, createFactory: false)
class HeadResponse {
  @JsonKey(name: 'status')

  /// Also for 'Status', the same field will be used.
  dynamic status;

  @JsonKey(name: 'successUserStatus')

  /// Also for 'SuccessUserStatus', the same field will be used.
  String? successUserStatus;

  @JsonKey(name: 'responseCode')

  /// Also for 'Code' and 'ResponseCode', the same field will be used.
  dynamic responseCode;

  @JsonKey(name: 'statusDescription')

  /// Also for 'Description', this same field will be used.
  String? statusDescription;

  @JsonKey(name: 'errorCode')

  /// Also for 'ErrorCode', this same field will be used.
  dynamic errorCode;

  @JsonKey(name: 'errorMsg')

  /// Also for 'ErrorMsg','ErrorDescription', this same field will be used.
  String? errorMsg;

  @JsonKey(name: 'Token')

  /// Also for 'methodName', this same field will be used.

  String? methodName;

  @JsonKey(name: 'MethodName')

  /// Also for 'token', this same field will be used.
  String? token;

  @JsonKey(name: 'Errors')

  /// Also for 'errors', this same field will be used.
  List<ErrorResponse>? errors;

  HeadResponse(
      {this.status,
      this.successUserStatus,
      this.responseCode,
      this.methodName,
      this.statusDescription,
      this.errorMsg,
      this.errors,
      this.token,
      this.errorCode});

  factory HeadResponse.fromJson(Map<String, dynamic> json) =>
      _headResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HeadResponseToJson(this);
}

/// We are using below from json method for [HeadResponse] class to generate
/// models class from api response with different keys.
///
/// Note: If in future some more keys/fields are added,
/// then we have to add conversion for that fields manually here.
/// JsonSerializable will only generate tojson methods, but for fromJson method
/// we have to add them manually as below function.
HeadResponse _headResponseFromJson(Map<String, dynamic> json) => HeadResponse(
      status: json['status'] ?? json['Status'],
      successUserStatus: (json['successUserStatus'] ??
          json['SuccessUserStatus'] ??
          json['success_user_status']) as String?,
      responseCode: (json['responseCode'] ??
          json['ResponseCode'] ??
          json['Code'] ??
          json['response_code']),
      errorCode: (json['errorCode'] ?? json['ErrorCode']),
      statusDescription: (json['statusDescription'] ??
          json['Description'] ??
          json['status_description']),
      errorMsg: (json['errorMsg'] ??
          json['errorMsg'] ??
          json['ErrorDescription']) as String?,
      methodName: (json['methodName'] ?? json['MethodName']),
      // errors: (json['Errors'] ?? json['errors']) as List<dynamic>?,
      errors: json['Errors'] == null
          ? json['errors'] == null
              ? null
              : (json['errors'] as List<dynamic>?)
                  ?.map(
                      (e) => ErrorResponse.fromJson(e as Map<String, dynamic>))
                  .toList()
          : (json['Errors'] as List<dynamic>?)
              ?.map((v) => ErrorResponse.fromJson(v as Map<String, dynamic>))
              .toList(),
      token: (json['Token'] ?? json['token']),
    );

@JsonSerializable(ignoreUnannotated: true, createFactory: false)
class ErrorResponse {
  @JsonKey(name: 'code')

  /// Also for 'Code', the same field will be used.
  String? code;

  @JsonKey(name: 'subStatusCode')

  /// Also for 'SubStatusCode', the same field will be used.
  String? subStatusCode;

  @JsonKey(name: 'message')

  /// Also for 'Message', the same field will be used.
  String? message;

  ErrorResponse({
    this.code,
    this.subStatusCode,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _errorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

ErrorResponse _errorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      code: json['code'] ?? json['Code'],
      subStatusCode: (json['subStatusCode'] ?? json['SubStatusCode']),
      message: (json['message'] ?? json['Message']),
    );
