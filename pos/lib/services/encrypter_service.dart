import 'package:encrypt/encrypt.dart';
import 'package:pos/constants/constants.dart';

class EncrypterService {
  static final _iv = IV.fromLength(16);
  static final _key = Key.fromUtf8(keyEncrypt);
  static final _encrypter = Encrypter(AES(_key));

  static String encrypt(String encrypt) {
    final encrypted = _encrypter.encrypt(encrypt, iv: _iv);
    return encrypted.base16;
  }

  static String decrypt(String decrypt) {
    var _encrypt = Encrypted.fromBase16(decrypt);
    var decrypted = _encrypter.decrypt(_encrypt, iv: _iv);
    return decrypted;
  }
}
