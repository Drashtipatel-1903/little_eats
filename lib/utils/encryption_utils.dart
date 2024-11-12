import 'package:encrypt/encrypt.dart';

/// Encryption
///
/// Using AES Algorithym
/// Using PKCS7 Padding
/// Using ECB Blocker
class AESEncryption {
  static String encryptCode(String encryptKey, String encryptIV,
      {String? text = ""}) {
    Key key = Key.fromUtf8(encryptKey);
    IV iv = IV.fromUtf8(encryptIV);
    return Encrypter(AES(key, mode: AESMode.cbc)).encrypt(text!, iv: iv).base64;
  }

  static String decryptCode(
    String encryptKey,
    String encryptIV, {
    String? text = "",
  }) {
    Key key = Key.fromUtf8(encryptKey);
    IV iv = IV.fromUtf8(encryptIV);
    return Encrypter(AES(key, mode: AESMode.cbc)).decrypt64(text!, iv: iv);
  }
}
