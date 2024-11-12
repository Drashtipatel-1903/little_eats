import '../../utils/exports.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  static LocaleCubit instance =getIt<LocaleCubit>();
  LocaleCubit()
      : super(ChangeLocaleState(BaseStateStatus.initial,locale:  const Locale(AppConstant.en)));

  /// change language
  Future<void> changeLanguage(String languageCode) async {
    setLocale(languageCode);
    emit(ChangeLocaleState(BaseStateStatus.success,locale: Locale(languageCode)));
  }
}
