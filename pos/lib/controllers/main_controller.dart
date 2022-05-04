import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/service_locator.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isAuth = false.obs;
  var isApiConnected = true.obs;

  @override
  void onInit() async {
    isLoading(true);
    await Future.delayed(const Duration(seconds: 2));

    // Start up Configuration
    await dependencyLocator<AppService>().onAppStartUpConfiguration();

    if (AppService.isApiConnected) {
      isApiConnected(AppService.isApiConnected);
      await _onUserAuthLogin();
    } else {
      isApiConnected(false);
    }
    isLoading(false);
    super.onInit();
  }

  Future<void> _onUserAuthLogin() async {
    var _resp =
        await APIService.post("user/login", jsonEncode(AppService.currentUser));
    print(_resp);
  }
}
