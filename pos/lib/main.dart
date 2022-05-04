import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos/helper/app_bindings.dart';
import 'package:pos/helper/app_routes.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/themes/theme.dart';
import 'package:pos/translation/translate_text.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    if (Platform.isWindows) {
      var dir = Directory.current.path;
      var fullPath = "$dir\\cache";
      if (!Directory(fullPath).existsSync()) {
        Directory(fullPath).createSync(recursive: true);
      }
      await GetStorage("setting", fullPath).initStorage;
    } else {
      await GetStorage.init("setting");
    }
  } else {
    await GetStorage.init("setting");
  }

  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: AppService.onLanguageStartUp,
      debugShowCheckedModeBanner: false,
      translations: TranslateText(),
      locale: AppService.getLanguage,
      title: 'Sale POS',
      theme: AppTheme.getTheme,
      getPages: AppRoute.getPages,
      initialRoute: AppRoute.initialRoute,
      initialBinding: AppBindings(),
    );
  }
}
