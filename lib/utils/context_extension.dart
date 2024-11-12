import 'exports.dart';

// extension AppLocalizationsExtension on BuildContext {
//   AppLocalizations get l10n => AppLocalizations.of(this);
// }

extension CustomExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  AppString get appString => AppString.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  T instance<T>() => read<T>();
}
