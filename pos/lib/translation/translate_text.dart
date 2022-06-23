import 'package:get/get.dart';
import 'package:pos/translation/en_translate.dart';
import 'package:pos/translation/kh_translate.dart';

class TranslateText extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': enTranslate,
      'kh': khTranslate,
    };
  }
}
