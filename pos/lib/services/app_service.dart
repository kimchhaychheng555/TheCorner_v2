import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos/models/user_models/user_model.dart';
import 'package:pos/services/api_service.dart';

class AppService {
  static String apiApp = "http://localhost:9090/api/";
  static bool isApiConnected = false;
  static String currentLanguage = "en";
  static UserModel? currentUser;
  static GetStorage storage = GetStorage("setting");

  static Locale get getLanguage {
    switch (currentLanguage) {
      case "en":
        return const Locale('en');
      case "kh":
        return const Locale('kh');
      default:
        return const Locale('en');
    }
  }

  static String get getFont {
    switch (currentLanguage) {
      case "en":
        return "Roboto";
      case "kh":
        return "Siemreap";
      default:
        return "Roboto";
    }
  }

  static Future<bool> onTestConnectionApi() async {
    var _resp = await APIService.get("connection");
    if (_resp.isSuccess) {
      return true;
    }
    return false;
  }

  static Future<void> onSaveConnectionApi() async {
    await _onAPIUrlLoadStartUp();
  }

  static Future<void> onAppStartUpConfiguration() async {
    await Future.delayed(const Duration(seconds: 1));
    await onLanguageStartUp();
    await _onAPIUrlLoadStartUp();
  }

  static Future<void> onLanguageStartUp() async {
    if (AppService.storage.hasData("language")) {
      AppService.currentLanguage = AppService.storage.read("language");
    } else {
      await AppService.storage.write("language", AppService.currentLanguage);
    }
  }

  static Future<void> _onAPIUrlLoadStartUp() async {
    if (AppService.storage.hasData("api")) {
      AppService.apiApp = AppService.storage.read("api");
      var _resp = await APIService.get("connection");
      if (_resp.isSuccess) {
        AppService.isApiConnected = true;
      } else {
        AppService.isApiConnected = false;
      }
    } else {
      AppService.isApiConnected = false;
      await AppService.storage.write("api", AppService.apiApp);
    }
  }

//   // ===========================================================
//   // Language Option

  static Future<void> onChangeLanguage({String lang = ""}) async {
    if (lang != "") {
      AppService.currentLanguage = lang;
    } else {
      if (AppService.currentLanguage == "kh") {
        AppService.currentLanguage = "en";
      } else {
        AppService.currentLanguage = "kh";
      }
    }
    // Write Storage
    await AppService.storage.write("language", AppService.currentLanguage);
    // Re update translatation
    await Get.updateLocale(AppService.getLanguage);
  }
}
