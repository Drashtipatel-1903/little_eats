import '../../utils/exports.dart';

///this class will initialize all the services and configurations
abstract class AppInitializer {
  static void init(
    VoidCallback runApp,
  ) {
    ErrorWidget.builder = (errorDetails) {
      return CustomTextLabelWidget(
        label: errorDetails.exceptionAsString(),
      );
    };
    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError = (details) {
        // FirebaseCrashlytics.instance.recordFlutterError;
        FlutterError.dumpErrorToConsole(details);
        DebugLog.e(details.stack.toString());
      };
      await _initServices();
      runApp();
    }, (exception, stackTrace) async {
      DebugLog.i('runZonedGuarded: ${exception.toString()}');
      SentryService.instance
          .captureException(exception, stackTrace: stackTrace);
    });
  }

  static FutureOr<void> _initServices() async {
    try {
      await SentryService.instance.init();
      setupLocator();
      await _getPackageAndDeviceInfo();
      await DebugLog.init();
      await NotificationManager.instance.init();
      await _initStorage();
      _initScreenPreference();
      _setStatusBarTheme();
    } catch (err) {
      rethrow;
    }
  }

  static FutureOr<void> _initStorage() async {
    await GetStorage.init();
    await SharedPref.init();
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// StatusBar Customise
  ///
  static void _setStatusBarTheme() {
    SystemChrome.setSystemUIOverlayStyle(MyAppTheme.systemOverlay());
  }

  static Future _getPackageAndDeviceInfo() async {
    if (kIsWeb) {
      final webDeviceInfo = await DeviceInfoPlugin().webBrowserInfo;
      getIt<MainConfig>().webBrowserInfo = webDeviceInfo;
    } else {
      if (Platform.isAndroid) {
        final androidDeviceInfo = await DeviceInfoPlugin().androidInfo;
        getIt<MainConfig>().androidInfo = androidDeviceInfo;
      } else if (Platform.isIOS) {
        final iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
        getIt<MainConfig>().iosDeviceInfo = iosDeviceInfo;
      }
    }
    final packageInfo = await PackageInfo.fromPlatform();
    getIt<MainConfig>().packageInfo = packageInfo;
  }
}
