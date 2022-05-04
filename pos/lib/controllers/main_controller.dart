import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/service_locator.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isAuth = false.obs;
  var isApiConnected = true.obs;

  var urlServerCtrl = TextEditingController();

  @override
  void onInit() async {
    isLoading(true);
    // Start up Configuration
    await dependencyLocator<AppService>().onAppStartUpConfiguration();

    if (AppService.isApiConnected) {
      isApiConnected(AppService.isApiConnected);
      await _onUserAuthLogin();
    } else {
      isApiConnected(false);
    }
    await Get.updateLocale(AppService.getLanguage);
    isLoading(false);
    super.onInit();
  }

  Future<void> _onUserAuthLogin() async {
    var _resp =
        await APIService.post("user/login", jsonEncode(AppService.currentUser));
    print(_resp);
  }

  void onConnectPressed() async {
    // AppService.apiApp = urlServerCtrl.text;
    // dependencyLocator<AppService>().onTestConnectionApi();
  }
}
