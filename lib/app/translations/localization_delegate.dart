import '../../utils/exports.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppString> {
  @override
  bool isSupported(Locale locale) => [AppConstant.en,AppConstant.hi,].contains(locale.languageCode);

  @override
  Future<AppString> load(Locale locale) async {
    switch (locale.languageCode) {
      case AppConstant.en:
        return EnUS();
    /// commenting this code as app doesn't have multi language support
    /// not removing for future purpose
/*      case AppConstant.hi:
        return HiIN();*/
      default:
        return EnUS();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppString> old) => false;
}
