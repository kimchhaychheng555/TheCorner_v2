import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/models/role_models/role_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/widgets/button_action_widget.dart';

class RoleController extends GetxController {
  var isLoading = false.obs;
  var isDeletedFilter = false.obs;

  //
  RxList<RoleModel> roleList = (<RoleModel>[]).obs;
  //Pagination
  var totalPage = 0.obs;
  var topCount = 0.obs;
  var currentPage = 1.obs;
  var totalRecords = 0.obs;
  var pager = 5.obs;
  RxList<int> pagerList = (<int>[]).obs;

  @override
  void onInit() async {
    onInitPagerList();
    await onLoad();
    super.onInit();
  }

  void onInitPagerList() {
    var _temp = [5, 10, 15, 25, 50];
    pagerList.assignAll(_temp);
    pager(_temp.first);
  }

  Future<void> onLoad() async {
    isLoading(true);
    var _offset = ((currentPage.value - 1) * pager.value);
    var _pagingation = "\$count=true&\$skip=$_offset&\$top=${pager.value}";
    var _query =
        "role?$_pagingation&\$expand=permissions,users&\$filter=is_deleted eq ${isDeletedFilter.value}";

    var _resp = await APIService.oDataGet(_query);
    if (_resp.isSuccess) {
      totalRecords(_resp.count);
      totalPage((_resp.count / pager.value).ceil());

      List<dynamic> _dyn = [];
      _dyn = jsonDecode(_resp.content);
      var _dataList = _dyn.map((e) => RoleModel.fromJson(e)).toList();
      roleList.assignAll(_dataList);
    }
    isLoading(false);
  }

  List<Map<String, dynamic>> get dataSource {
    List<Map<String, dynamic>> temp = [];
    for (var product in roleList) {
      Map<String, dynamic> p = jsonDecode(jsonEncode(product));
      temp.add(p);
    }
    return temp;
  }

  void onPagePressed(int page) {
    currentPage(page);
    onLoad();
  }

  void onPagerChanged(int? value) {
    pager(value);
    currentPage(1);
    onLoad();
  }

  String get getResultPageInfo {
    return "${"show".tr}: ${((currentPage.value - 1) * pager.value) + 1} - ${(currentPage.value * pager.value)} ${"show".tr} ${totalRecords.value}";
  }

  void onRestoreRole(String? roleId) async {
    isLoading(true);
    var _resp = await APIService.post("role/restore/$roleId");
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "restore_role_success".tr);
    } else {
      isLoading(false);
      AppAlert.errorAlert(title: "restore_role_error".tr);
      return;
    }

    onLoad();
    isLoading(false);
  }

  void onDeleteRole(String? roleId, String? name) {
    Get.defaultDialog(
      radius: 5,
      title: "product_delete".trParams({
        "name": name ?? "",
      }),
      middleText: "are_you_sure".tr,
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            _roleDeleteProcess(roleId);
          },
        ),
      ],
    );
  }

  void _roleDeleteProcess(String? roleId) async {
    Get.back();
    isLoading(true);
    var _resp = await APIService.post("role/delete/$roleId");
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "delete_role_success".tr);
      onLoad();
    } else {
      AppAlert.errorAlert(title: "delete_role_error".tr);
    }
    isLoading(false);
  }
}
