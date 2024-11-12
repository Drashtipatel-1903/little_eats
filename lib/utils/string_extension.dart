import 'exports.dart';

extension StringUtils on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isBlank => this == null || this!.trim().isEmpty;

  bool get isValidEmployeeCode =>
      this!.toString().toLowerCase().startsWith("c");

  bool get isNotBlank => !isBlank;

  bool get isNullOrBlank => this == null || isBlank;

  bool get isNotNullOrBlank => !isNullOrBlank;

  bool get isValidPassword => RegExpressions.password.hasMatch(this ?? '');

  String get toTitleCase =>
      this == null ? '' : '${this![0].toUpperCase()}${this!.substring(1)}';

  String get toBase64 => base64Encode(utf8.encode(this ?? ''));

  Uint8List get fromBase64 => base64Decode(this ?? '');
}

extension ListUtil on List<String> {
  String get joinToString => reduce((curr, next) => '$curr,$next');

  String get joinToWithOutComaString => reduce((curr, next) => '$curr$next');
}

///extension for validation
///
/// email validation,
/// mobile number validation,
/// password validation,
/// confirm password validation
/// collection code validation
extension TextFieldValidator on String {
  //check password validation
  //check it should be not empty
  //and match with regex apply for password
  String? validatePassword(BuildContext context) {
    if (isEmpty) {
      return context.appString.pleaseEnterPasswordKey;
    } else if (!RegExpressions.password.hasMatch(this)) {
      return context.appString.passwordShouldHaveKey;
    } else {
      return null;
    }
  }

  String? validateEmail(BuildContext context){
    if(isEmpty){
      return context.appString.pleaseEnterEmailIdKey;
    }else if(!RegExpressions.email.hasMatch(this)){
      return context.appString.pleaseEnterValidEmailIdKey;
    }
    return null;
  }

  String? validateFullName(BuildContext context){
    if(isEmpty){
      return context.appString.pleaseEnterFullNameKey;
    }
    return null;
  }


  String? validateConfirmPassword(BuildContext context, String password) {
    if (isEmpty) {
      return context.appString.pleaseEnterConfirmPasswordKey;
    } else if (!RegExpressions.password.hasMatch(this)) {
      return context.appString.passwordShouldHaveKey;
    } else if (this != password) {
      return context.appString.confirmPasswordNotMatchingKey;
    }
    return null;
  }


  String? validateOtpCode(BuildContext context) {
    if (isEmpty) {
      return context.appString.pleaseEnterOTPKey;
    } else if (length != AppConstant.otpTextLength) {
      return context.appString.pleaseEnterValidOTPKey;
    } else {
      return null;
    }
  }
}
