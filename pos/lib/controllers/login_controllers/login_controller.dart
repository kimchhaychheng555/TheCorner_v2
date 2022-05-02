import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/user_models/login_model.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/encrypter_service.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isRememberMe = false.obs;
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  void onRememberMeChanged(bool? _val) => isRememberMe(!isRememberMe.value);

  void onLoginPressed() {
    var _isSuccess = true;
    if (_isSuccess) {
      if (isRememberMe.value) {
        var _loginModel = LoginModel(
          username: usernameCtrl.text,
          password: passwordCtrl.text,
          assign_date: DateTime.now(),
        );
        String _encrypt = EncrypterService.encrypt(jsonEncode(_loginModel));
        AppService.storage.write("account_store", _encrypt);
      }
    }
  }
}
