import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var isRememberMe = false.obs;
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  void onRememberMeChanged(bool? _val) => isRememberMe(!isRememberMe.value);

  void onLoginPressed() {
    print("<===================>");
    print("Username: " + usernameCtrl.text);
    print("Password: " + passwordCtrl.text);
  }
}
