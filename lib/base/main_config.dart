import '../utils/exports.dart';

class MainConfig {
  late final AndroidDeviceInfo androidInfo;
  late final IosDeviceInfo iosDeviceInfo;
  late final WebBrowserInfo webBrowserInfo;
  late final PackageInfo packageInfo;

  static ApiClient get apiClient => getIt<ApiClient>();
  static BuildContext context = getIt<AppRouter>().navigatorKey.currentContext!;
  static TextTheme get textTheme => MainConfig.context.theme.textTheme;
}
