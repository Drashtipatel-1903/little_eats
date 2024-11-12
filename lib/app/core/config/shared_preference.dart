import '../../../utils/exports.dart';

abstract class PrefsKey {
  static const isLoggedInKey = "keyIsLoggedIn";
  static const userIdKey = 'keyUserID';
  static String currentLocaleKey = "KeyCurrentLocale";
}

abstract class SharedPref {
  static GetStorage? _prefsInstance;
  static String encryptKey = "";
  static String encryptIv = "";

  static init() {
    _prefsInstance ??= GetStorage();
    _getEncryptionKey();
    if (kIsWeb) {
      encryptIv = AppConstant.web.padLeft(AppConstant.encryptionLength, "0");
    } else {
      if (Platform.isAndroid) {
        encryptIv =
            AppConstant.android.padLeft(AppConstant.encryptionLength, "0");
      } else if (Platform.isIOS) {
        encryptIv = AppConstant.ios.padLeft(AppConstant.encryptionLength, "0");
      }
    }
  }

  static void _isPreferenceReady() {
    assert(_prefsInstance != null, "SharedPreferences not ready yet!");
  }

  static bool getBool(String key, [bool? defValue]) {
    var value = _decodedValue(key);
    return value.isNotNullOrEmpty ? bool.parse(value!) : defValue ?? false;
  }

  static int getInt(String key, [int? defValue]) {
    var value = _decodedValue(key);
    return value.isNotNullOrEmpty ? int.parse(value!) : defValue ?? 0;
  }

  static double getDouble(String key, [double? defValue]) {
    var value = _decodedValue(key);
    return value.isNotNullOrEmpty ? double.parse(value!) : defValue ?? 0.0;
  }

  static String getString(String key, [String? defValue]) {
    var value = _decodedValue(key);
    return value.isNotNullOrEmpty ? value! : defValue ?? "";
  }

  static Future<void> setValue(String key, dynamic value) async {
    var encrypted = AESEncryption.encryptCode(
      encryptKey,
      encryptIv,
      text: value.toString(),
    );
    _prefsInstance?.write(key, encrypted);
  }

  // Removes an entry from persistent storage.
  static Future<void> remove(String key) async {
    _prefsInstance?.remove(key);
  }

  // Returns all keys in the persistent storage.
  static Set<String>? getKeys() {
    _isPreferenceReady();
    return _prefsInstance?.getKeys();
  }

  // Completes with true once the user preferences for the app has been cleared.
  static Future<void> clearData() async {
    _prefsInstance?.erase();
  }

  // Best to clean up by calling this function in the State object's dispose() function.
  static void dispose() {
    _prefsInstance = null;
  }

  static String? _decodedValue(String key) {
    _isPreferenceReady();
    if (_prefsInstance?.read(key) != null) {
      var value = _prefsInstance?.read(key);
      return AESEncryption.decryptCode(encryptKey, encryptIv, text: value);
    } else {
      return null;
    }
  }

  static void _getEncryptionKey() {
    encryptKey =
        getIt<MainConfig>().packageInfo.packageName.replaceAll(".", "0");
    //check if encryption key is less than AppConstant.encryptionLength digit then add 0 in the end
    if (encryptKey.length > AppConstant.encryptionLength) {
      encryptKey = encryptKey.substring(0, AppConstant.encryptionLength);
    } else {
      encryptKey = encryptKey.padLeft(AppConstant.encryptionLength, "0");
    }
  }
}
