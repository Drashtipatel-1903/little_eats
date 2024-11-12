// ignore: avoid_classes_with_only_static_members
abstract class RegExpressions {
  static final RegExp password =
      RegExp(r'^(?=.*[a-z])(?=.*\d)[a-zA-Z\d\w\W]{8,}$');
  static final RegExp aadharRegex =
      RegExp(r"^[2-9]{1}[0-9]{3}\s[0-9]{4}\s[0-9]{4}$");
  static final RegExp onlyDigitsRegex =
  RegExp(r"[0-9]");
  static final RegExp email = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

}
