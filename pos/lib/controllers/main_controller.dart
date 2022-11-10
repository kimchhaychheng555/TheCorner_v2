import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/permission_models/permission_model.dart';
import 'package:pos/models/permission_role_models/permission_role_model.dart';
import 'package:pos/models/user_models/user_model.dart';
import 'package:pos/screens/login_screens/login_screen.dart';
import 'package:pos/screens/smart_home_screens/smart_home_screen.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_service.dart';
import 'package:darq/darq.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var isApiConnected = false.obs;
  var isAuth = false.obs;
  var isHasConnection = true.obs;

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
    if (isApiConnected.value) {
      var _resp =
          await APIService.post("user/login", jsonEncode(AppService.loginUser));
      if (_resp.isSuccess) {
        await _onGetPermissionUser(_resp.content);
        Get.offAndToNamed(SmartHomeScreen.routeName);
      } else {
        Get.offAndToNamed(LoginScreen.routeName);
      }
    }
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

  void onConnectPressed() async {
    isLoading(true);
    AppService.apiApp = urlServerCtrl.text;
    var _res = await AppService.onTestConnectionApi();
    if (_res) {
      isApiConnected(true);
      isLoading(false);
      await _onUserAuthLogin();
      await AppService.onSaveConnectionApi();
    }
    isLoading(false);
  }
}
