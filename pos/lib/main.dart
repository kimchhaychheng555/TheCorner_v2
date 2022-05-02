import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos/binding.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/main_screen.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/translation/translate_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//
  if (Platform.isWindows) {
    var dir = Directory.current.path;
    var fullPath = "$dir\\cache";
    if (!Directory(fullPath).existsSync()) {
      Directory(fullPath).createSync(recursive: true);
    }
    await GetStorage("setting", fullPath).initStorage;
  } else {
    await GetStorage("setting").initStorage;
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onInit: AppService.onAppStartUp,
      debugShowCheckedModeBanner: false,
      translations: TranslateText(),
      locale: AppService.getLanguage,
      title: 'Sale POS',
      theme: ThemeData(
        fontFamily: AppService.getFont,
        backgroundColor: primaryColor,
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
      initialBinding: CustomBinding(),
    );
  }
}
