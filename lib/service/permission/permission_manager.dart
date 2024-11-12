import '../../utils/exports.dart';

/// Utility class for Permission asking and granting.
///
/// Customized [PermissionManager] as per this app's
/// requirement.
class PermissionManager {
  static final PermissionManager _singletonApiProvider =
      PermissionManager._internal();

  factory PermissionManager() {
    return _singletonApiProvider;
  }

  PermissionManager._internal();

  /// Request Multiple permission
  FutureOr<bool> requestPermissions(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> status = await permissions.request();

    bool granted = true;
    status.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) {
        granted = false;
      }
    });

    return granted;
  }

  /// Check all permission given or not
  FutureOr<bool> isAllPermissionsGranted(List<Permission> permissions) async {
    Map<Permission, PermissionStatus> permissionStatuses =
        await permissions.request();

    for (var permission in permissionStatuses.keys) {
      if (permissionStatuses[permission] != PermissionStatus.granted) {
        return false; // Permission not granted
      }
    }

    return true; // All permissions granted
  }

  //----------------------------------------------------------------
  /// Check OS version of Android is 33 or Greater
  FutureOr<bool> isAndroidOSVersionIS13() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt > 32) {
      return true;
    } else {
      return false;
    }
  }

  /// Check Location permission
  FutureOr<bool> checkLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      return true;
    } else {
      if (status.isDenied) {
        // We didn't ask for permission yet or
        //the permission has been denied before but not permanently.
        return false;
      } else {
        return false;
      }
    }
  }

  /// Request Location permission
  FutureOr<bool> requestLocationPermission() async {
    final status = await Permission.location.request();
    bool st = false;
    if (status == PermissionStatus.granted) {
      DebugLog.d('Permission granted');
      st = true;
    } else if (status == PermissionStatus.denied) {
      //await openAppSettings();
      st = false;
      DebugLog.d(
          'Permission denied. Show a dialog and again ask for the permission');
    } else if (status == PermissionStatus.permanentlyDenied) {
      DebugLog.d('Take the user to the settings page.');
      await openAppSettings();
    }
    return st;
  }

  /// Check with Storage permission given or not
  FutureOr<bool> checkStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else {
      if (status.isDenied) {
        // We didn't ask for permission yet or
        //the permission has been denied before but not permanently.
        return true;
      } else {
        return false;
      }
    }
  }

  /// Request Storage permission
  FutureOr<bool> requestStoragePermission() async {
    final status = await Permission.storage.request();
    bool st = false;
    if (status == PermissionStatus.granted) {
      DebugLog.d('Permission granted');
      st = true;
    } else if (status == PermissionStatus.denied) {
      //await openAppSettings();
      st = false;
      DebugLog.d(
          'Permission denied. Show a dialog and again ask for the permission');
    } else if (status == PermissionStatus.permanentlyDenied) {
      DebugLog.d('Take the user to the settings page.');
      await openAppSettings();
    }
    return st;
  }

  /// Check with SMS permission given or not
  FutureOr<bool> checkSMSPermission() async {
    var status = await Permission.sms.status;
    if (status.isGranted) {
      return true;
    } else {
      if (status.isDenied) {
        // We didn't ask for permission yet or
        //the permission has been denied before but not permanently.
        return true;
      } else {
        return false;
      }
    }
  }

  /// Request SMS permission
  FutureOr<bool> requestSMSPermission() async {
    final status = await Permission.sms.request();
    bool st = false;
    if (status == PermissionStatus.granted) {
      DebugLog.d('Permission granted');
      st = true;
    } else if (status == PermissionStatus.denied) {
      //await openAppSettings();
      st = false;
      DebugLog.d(
          'Permission denied. Show a dialog and again ask for the permission');
    } else if (status == PermissionStatus.permanentlyDenied) {
      DebugLog.d('Take the user to the settings page.');
      await openAppSettings();
    }
    return st;
  }

  /// Check with Contacts permission given or not
  FutureOr<bool> checkContactsPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      return true;
    } else {
      if (status.isDenied) {
        // We didn't ask for permission yet or
        //the permission has been denied before but not permanently.
        return true;
      } else {
        return false;
      }
    }
  }

  FutureOr<bool> requestContactPermission() async {
    final status = await Permission.contacts.request();
    bool st = false;
    if (status == PermissionStatus.granted) {
      DebugLog.d('Permission granted');
      st = true;
    } else if (status == PermissionStatus.denied) {
      //await openAppSettings();
      st = false;
      DebugLog.d(
          'Permission denied. Show a dialog and again ask for the permission');
    } else if (status == PermissionStatus.permanentlyDenied) {
      DebugLog.d('Take the user to the settings page.');
      await openAppSettings();
    }
    return st;
  }

  /// Check with Phone permission given or not
  FutureOr<bool> checkPhonePermission() async {
    var status = await Permission.phone.status;
    if (status.isGranted) {
      return true;
    } else {
      if (status.isDenied) {
        // We didn't ask for permission yet or
        //the permission has been denied before but not permanently.
        return true;
      } else {
        return false;
      }
    }
  }

  FutureOr<bool> requestPhonePermission() async {
    final status = await Permission.phone.request();
    bool st = false;
    if (status == PermissionStatus.granted) {
      DebugLog.d('Permission granted');
      st = true;
    } else if (status == PermissionStatus.denied) {
      //await openAppSettings();
      st = false;
      DebugLog.d(
          'Permission denied. Show a dialog and again ask for the permission');
    } else if (status == PermissionStatus.permanentlyDenied) {
      DebugLog.d('Take the user to the settings page.');
      await openAppSettings();
    }
    return st;
  }

  /// Check with Camera permission given or not
  FutureOr<bool> checkCameraPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      return true;
    } else {
      if (status.isDenied) {
        return false;
      } else {
        return false;
      }
    }
  }

  /// Request Camera permission
  FutureOr<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    bool st = false;
    if (status == PermissionStatus.granted) {
      DebugLog.d('Permission granted');
      st = true;
    } else if (status == PermissionStatus.denied) {
      //await openAppSettings();
      DebugLog.d(
          'Permission denied. Show a dialog and again ask for the permission');
      st = false;
    } else if (status == PermissionStatus.permanentlyDenied) {
      DebugLog.d('Take the user to the settings page.');
      await openAppSettings();
    }
    return st;
  }

  /// Request Notifications permission
  FutureOr<bool> requestNotificationsPermission() async {
    final status = await Permission.notification.request();
    bool st = false;
    if (status == PermissionStatus.granted) {
      DebugLog.d('Permission granted');
      st = true;
    } else if (status == PermissionStatus.denied) {
      //await openAppSettings();
      DebugLog.d(
          'Permission denied. Show a dialog and again ask for the permission');
      st = false;
    } else if (status == PermissionStatus.permanentlyDenied) {
      DebugLog.d('Take the user to the settings page.');
      await openAppSettings();
    }
    return st;
  }

  void askPermission() async {
    var value = await PermissionManager().requestLocationPermission();
    if (value) {
      var contactPermission = await requestContactPermission();
      if (contactPermission) {
        var storagePermission = await requestPhonePermission();
        if (storagePermission) {
          // var smsPermission = await requestSMSPermission();
        }
      }
    }
  }

  void openMobileSetting() async {
    await openAppSettings();
  }
}
