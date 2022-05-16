import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/user_models/login_model.dart';
import 'package:pos/screens/smart_home_screens/smart_home_screen.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/encrypter_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isRememberMe = false.obs;
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  void onRememberMeChanged(bool? _val) => isRememberMe(!isRememberMe.value);

  void onLoginPressed() async {
    isLoading(true);
    var _loginModel = LoginModel(
      username: usernameCtrl.text,
      password: passwordCtrl.text,
      assign_date: DateTime.now(),
    );

    var _resp = await APIService.post("user/login", jsonEncode(_loginModel));
    if (_resp.isSuccess) {
      if (isRememberMe.value) {
        String _encrypt = EncrypterService.encrypt(jsonEncode(_loginModel));
        AppService.storage.write("account_store", _encrypt);
        Get.offAndToNamed(SmartHomeScreen.routeName);
      }
    } else {
      Get.snackbar("error", "Error");
    }
    isLoading(false);
  }
}
