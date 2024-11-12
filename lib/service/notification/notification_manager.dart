import '../../main.dart';
import '../../utils/exports.dart';

class NotificationManager {
  NotificationManager._internal();

  static final NotificationManager instance = NotificationManager._internal();

  Future<void> init() async {
    AwesomeNotificationManager.instance.init();
    await firebaseInitialize();
    _getBackgroundMessage();
    _getToken();
    _getInitialMessage();
    _onMessage();
    _onMessageOpenedApp();
  }

  /// initialize firebase
  Future<void> firebaseInitialize() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  /// when app is in termination/background mode this method will be call
  void _getBackgroundMessage() {
    FirebaseMessaging.onBackgroundMessage(firebaseBackground);
  }

  ///get token from firebase
  Future<void> _getToken({int maxRetries = 3}) async {
    try {
      final token = await FirebaseMessaging.instance.getToken(
        vapidKey: kIsWeb ? configVapidKey : null,
      );
      SentryService.instance.captureEvent(token.toString(), type: "token");
      DebugLog.d("FCM Token : $token");
    } catch (error) {
      if (maxRetries > 0) {
        await Future.delayed(const Duration(seconds: Dimens.duration5));
        _getToken(maxRetries: maxRetries - 1);
      }
    }
  }

  /// application has been opened from a terminated state via a [RemoteMessage]
  _getInitialMessage() async {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      DebugLog.i(
          "FCM Initial Message : ${message?.data} ${message?.notification}");
    });
  }

  ///when app is in foreground this method will be call
  void _onMessage() {
    FirebaseMessaging.onMessage.listen((message) async {
      DebugLog.i(
          "FCM Foreground Message : ${message.data} ${message.notification}");
      await AwesomeNotificationManager.instance
          .showNotification(payload: message.data);
    });
  }

  /// application has been opened from background state this method will be call
  void _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      DebugLog.i(
          "FCM MessageOpenedApp Message : ${message.data} ${message.notification}");
    });
  }
}
