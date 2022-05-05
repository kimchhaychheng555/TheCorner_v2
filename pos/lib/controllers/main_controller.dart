import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos/screens/login_screens/login_screen.dart';
import 'package:pos/screens/smart_home_screens/smart_home_screen.dart';
import 'package:pos/services/app_service.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isApiConnected = true.obs;
  var isAuth = false.obs;

  var urlServerCtrl = TextEditingController();

  @override
  void onInit() async {
    isLoading(true);
    // Start up Configuration
    await AppService.onAppStartUpConfiguration();
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
    // var _resp =
    //     await APIService.post("user/login", jsonEncode(AppService.currentUser));

    if (isApiConnected.value) {
      if (isAuth.value) {
        Get.offAndToNamed(SmartHomeScreen.routeName);
      } else {
        Get.offAndToNamed(LoginScreen.routeName);
      }
    }
    // print(_resp);
  }

  void onConnectPressed() async {
    isLoading(true);
    AppService.apiApp = urlServerCtrl.text;
    var _res = await AppService.onTestConnectionApi();
    if (_res) {
      isApiConnected(true);
      await AppService.onSaveConnectionApi();
      isLoading(false);
      await _onUserAuthLogin();
    }
    isLoading(false);
  }
}
