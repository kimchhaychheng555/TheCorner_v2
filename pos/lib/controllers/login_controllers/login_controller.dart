import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/permission_models/permission_model.dart';
import 'package:pos/models/permission_role_models/permission_role_model.dart';
import 'package:pos/models/user_models/login_model.dart';
import 'package:pos/models/user_models/user_model.dart';
import 'package:pos/screens/smart_home_screens/smart_home_screen.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/encrypter_service.dart';
import 'package:pos/services/log_service.dart';
import 'package:darq/darq.dart';

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
      }
      await _onGetPermissionUser(_resp.content);
      Get.offAndToNamed(SmartHomeScreen.routeName);
      LogService.sendLog(
        user: AppService.currentUser?.fullname ?? "",
        logAction: "This user login to system.",
      );
    } else {
      AppAlert.errorAlert(title: "login_failed".tr);
    }
    isLoading(false);
  }

  Future<void> _onGetPermissionUser(String jsonString) async {
    var _tempUser = UserModel.fromJson(jsonDecode(jsonString));
    var _tempPermissionList = <PermissionModel>[];

    var _resp = await APIService.oDataGet(
        "PermissionRole?\$expand=permission,role&\$filter=role_id eq ${_tempUser.role_id}");
    if (_resp.isSuccess) {
      List<dynamic> dyn = jsonDecode(_resp.content);
      var tempPermissionRoleList =
          dyn.map((e) => PermissionRoleMole.fromJson(e)).toList();

      var group = tempPermissionRoleList.groupBy((e) => e.role_id).source;
      for (var prl in group) {
        if (prl.permission != null) {
          _tempPermissionList.add(prl.permission!);
        }
      }
      _tempUser.permissions = _tempPermissionList;
      AppService.currentUser = _tempUser;
    }
  }
}
