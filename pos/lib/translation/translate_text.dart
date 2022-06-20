import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';

class TranslateText extends Translations {
  String getTranslation(String fileName) {
    var dir = Directory.current.path;
    var fullPath = "$dir\\translate";
    final path = fullPath;
    final contents = File('$path/$fileName.json').readAsStringSync();
    return contents;
  }

  @override
  Map<String, Map<String, String>> get keys {
    return {
      'en': enTranslate,
      'kh': khTranslate,
    };
  }

  Map<String, String> get enTranslate {
    Map<String, dynamic> dyn = jsonDecode(getTranslation("en_translate"));
    Map<String, String> data =
        dyn.map((key, value) => MapEntry(key, value.toString()));

    return data;
  }

  Map<String, String> get khTranslate {
    Map<String, dynamic> dyn = jsonDecode(getTranslation("kh_translate"));
    Map<String, String> data =
        dyn.map((key, value) => MapEntry(key, value.toString()));

    return data;
  }
}
