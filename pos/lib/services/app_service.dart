import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos/models/start_sale_modesl/start_sale_model.dart';
import 'package:pos/models/user_models/login_model.dart';
import 'package:pos/models/user_models/user_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/encrypter_service.dart';

class AppService {
  static String apiApp = "http://localhost:9090/api/";
  static bool isApiConnected = false;
  static String currentLanguage = "en";
  static UserModel? currentUser;
  static LoginModel? loginUser;
  static GetStorage storage = GetStorage("setting");
  static StartSaleModel? currentStartSale;

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

  static void back() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.back();
  }

  static Future<bool> onTestConnectionApi() async {
    var _resp = await APIService.get("connection");
    if (_resp.isSuccess) {
      return true;
    }
    return false;
  }

  static Future<void> onSaveConnectionApi() async {
    await AppService.storage.write("api", AppService.apiApp);
  }

  static Future<void> onAppStartUpConfiguration() async {
    await Future.delayed(const Duration(seconds: 1));
    await onLanguageStartUp();
    await _onAPIUrlLoadStartUp();
    await _onLoadLoginUserStartUp();
  }

  static Future<void> _onLoadLoginUserStartUp() async {
    if (AppService.storage.hasData("account_store")) {
      var _loginUser =
          EncrypterService.decrypt(AppService.storage.read("account_store"));
      AppService.loginUser = LoginModel.fromJson(jsonDecode(_loginUser));
    }
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

  // Build Material Color
  static MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
