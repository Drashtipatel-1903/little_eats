import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import '../../utils/exports.dart';

/// Use this method to detect when a new notification or a schedule is created
@pragma("vm:entry-point")
Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification) async {
  DebugLog.d("on Create Method");
}

/// Use this method to detect if the user dismissed a notification
@pragma("vm:entry-point")
Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction) async {
  DebugLog.i("on Dismiss Method");
}

/// Use this method to detect every time that a new notification is displayed
@pragma("vm:entry-point")
Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification) async {
  DebugLog.d("on Display Method");
}

/// Use this method to detect when the user taps on a notification or action button
@pragma("vm:entry-point")
Future<void> onActionReceivedMethod(ReceivedAction receivedAction) async {
  //TODO manage your redirection here
  DebugLog.t("on Action Received Method ");
}

class AwesomeNotificationManager {
  AwesomeNotificationManager._internal();

  static final AwesomeNotificationManager instance =
      AwesomeNotificationManager._internal();
  static final AwesomeNotifications _awesomeNotification =
      AwesomeNotifications();

  static ReceivePort? receivePort;

  void init() {
    _initializeAwesomeNotification();
    !kIsWeb ? _initializeIsolatePort() : null;
  }

  ///this method initialize AwesomeNotification
  void _initializeAwesomeNotification() {
    _awesomeNotification.initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelGroupKey: NotificationConst.channelGroupKey,
              channelKey: NotificationConst.channelKey,
              channelName: NotificationConst.channelName,
              channelDescription: NotificationConst.channelDescription,
              defaultColor: Colors.blue,
              ledColor: Colors.white)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: NotificationConst.channelGroupKey,
              channelGroupName: NotificationConst.channelGroupName)
        ],
        debug: true);

    // this thing is for checking if the notification permission are allowed or not you can skip or comment this code if you have handled previously
    _awesomeNotification.isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        _awesomeNotification.requestPermissionToSendNotifications();
      }
    });
    // this method is used for setting all the listeners necessary for the events received in the notification controller
    _awesomeNotification.setListeners(
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
    !kIsWeb ? _initializeIsolatePort() : null;
  }

  void _initializeIsolatePort() {
    receivePort = ReceivePort('Notification action port in main isolate')
      ..listen(
          (silentData) => onActionReceivedImplementationMethod(silentData));

    // This initialization only happens on main isolate
    IsolateNameServer.registerPortWithName(
        receivePort!.sendPort, 'notification_action_port');
  }

  static Future<void> onActionReceivedImplementationMethod(
    ReceivedAction receivedAction,
  ) async {
    DebugLog.t("on Action Received Method");
  }

  ///this method actually creates the notification in the system tray
  Future<void> showNotification({Map<String, dynamic>? payload}) async {
    if (payload?.isNotEmpty ?? false) {
      await _awesomeNotification.createNotification(
        content: NotificationContent(
            id: Random().nextInt(1000),
            channelKey: NotificationConst.channelKey,
            title: payload!["title"] ?? "",
            body: payload["body"] ?? "",
            bigPicture: payload["image"] ?? "",
            payload: Map<String, String>.from(payload)),
      );
    }
  }
}
