import '../../utils/exports.dart';

Locale setLocale(String languageCode) {
  SharedPref.setValue(PrefsKey.currentLocaleKey, languageCode);
  return _locale(languageCode);
}

Locale getLocale() {
  String languageCode = SharedPref.getString(PrefsKey.currentLocaleKey, AppConstant.en);
  return _locale(languageCode);
}

// if language is not selected then default will be english
Locale _locale(String languageCode) {
  return languageCode.isNotEmpty
      ? Locale(languageCode, '')
      : const Locale(AppConstant.en, '');
}
