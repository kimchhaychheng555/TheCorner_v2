import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos/models/user_models/user_model.dart';
import 'package:uuid/uuid.dart';

class AppService {
  static String apiApp = "http://localhost:9090/api/";
  static String currentLanguage = "en";
  static UserModel? currentUser;
  static GetStorage storage = GetStorage("setting");

  // Storage Option

  // ===========================================================
  // on app startup
  static void onAppStartUp() {
    _onLanguageStartUp();
    _onAutoAuthUser();
  }

  static void _onLanguageStartUp() {
    if (storage.hasData("language")) {
      currentLanguage = storage.read("language");
    } else {
      storage.write("language", currentLanguage);
    }
  }

  static void _onAutoAuthUser() {
    if (storage.hasData("account_store")) {
      String _userData = storage.read("account_store");
      var _user = UserModel.fromJson(jsonDecode(_userData));
      _user.id = const Uuid().v4();
      currentUser = _user;
    }
  }

  // ===========================================================
  // Language Option
  static onChangeLanguage({String lang = ""}) {
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
    storage.write("language", currentLanguage);
    Get.updateLocale(AppService.getLanguage);
  }

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
}
