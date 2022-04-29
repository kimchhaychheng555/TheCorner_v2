import 'package:get/get.dart';
import 'package:pos/translation/en_translation.dart';
import 'package:pos/translation/kh_translation.dart';

class TranslateText extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enTranslation,
        'kh': khTranslation,
      };
}
