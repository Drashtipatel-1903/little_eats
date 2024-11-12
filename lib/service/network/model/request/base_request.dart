
import 'package:json_annotation/json_annotation.dart';

part 'base_request.g.dart';

/// Base request class for all api requests.
///
/// Now only need to generate class for body,
/// the rest will be handled by this generic class.
/// This class is must to use for request which has structure like:
/// {
///   head: {...},
///   body: {...}
/// }.
@JsonSerializable(ignoreUnannotated: true, genericArgumentFactories: true)
class BaseRequest<T> {
  @JsonKey(name: 'Head')
  HeadRequest? head;
  @JsonKey(name: 'Body')
  T? body;

  BaseRequest({this.head, this.body});

  factory BaseRequest.fromJson(
          Map<String, dynamic> json, T Function(dynamic json) jsonFrom) =>
      _$BaseRequestFromJson<T>(json, jsonFrom);

  Map<String, dynamic> toJson(Object? Function(T) toJson) =>
      _$BaseRequestToJson(this, toJson);
}

@JsonSerializable(ignoreUnannotated: true)
class HeadRequest {
  @JsonKey(name: 'Code')
  String? code;
  @JsonKey(name: 'Key')
  String? key;
  @JsonKey(name: 'AppVer')
  String? appVersion;
  @JsonKey(name: 'AppName')
  String? appName;
  @JsonKey(name: 'OSName')
  String? osName;
  @JsonKey(name: 'device_make')
  String? deviceMake;
  @JsonKey(name: 'device_model')
  String? deviceModel;
  @JsonKey(name: 'os_version')
  String? osVersion;
  @JsonKey(name: 'device_type')
  String? deviceType;
  @JsonKey(name: 'RequestCode')
  String? requestCode;
  @JsonKey(name: 'Token')
  String? token;

  HeadRequest(
      {this.code,
      this.key,
      this.requestCode,
      this.token,
      appName,
      deviceMake,
      deviceModel,
      deviceType,
      appVersion});
    /*  : osName = GetPlatform.isAndroid ? 'Android' : 'iOS',
        osVersion = GetPlatform.isAndroid
            ? MainController.instance().androidInfo.version.release
            : MainController.instance().iosDeviceInfo.systemVersion,
        appName = MainController.instance().packageInfo.appName,
        deviceModel = GetPlatform.isAndroid
            ? MainController.instance().androidInfo.model
            : MainController.instance().iosDeviceInfo.name,
        deviceType = "MOBILE",
        deviceMake = GetPlatform.isAndroid
            ? MainController.instance().androidInfo.brand
            : MainController.instance().iosDeviceInfo.model,
        appVersion = MainController.instance().packageInfo.version;
*/
  factory HeadRequest.fromJson(Map<String, dynamic> json) =>
      _$HeadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$HeadRequestToJson(this);
}
