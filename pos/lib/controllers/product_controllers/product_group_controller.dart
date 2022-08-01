import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/models/product_group_models/product_group_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/log_service.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:uuid/uuid.dart';

class ProductGroupController extends GetxController {
  var isLoading = false.obs;

  RxList<ProductGroupModel> productGroupList = (<ProductGroupModel>[]).obs;

  @override
  void onInit() {
    super.onInit();
    onLoadCategory();
  }

  void onLoadCategory() async {
    isLoading(true);
    var _resp = await APIService.oDataGet("productGroup");
    if (_resp.isSuccess) {
      List<dynamic> _dynList = jsonDecode(_resp.content);
      var dataList =
          _dynList.map((e) => ProductGroupModel.fromJson(e)).toList();
      productGroupList(dataList);
    }

    isLoading(false);
  }

  void onAddCategoryPressed() {
    var nameCtrl = TextEditingController();
    Get.defaultDialog(
      radius: 5,
      title: "add_product_group".tr,
      titleStyle: const TextStyle(fontFamily: "Siemreap"),
      content: Column(
        children: [
          TextField(
            controller: nameCtrl,
            style: const TextStyle(fontFamily: "Siemreap"),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              filled: true,
              isCollapsed: true,
              hintText: "product_group".tr,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            var category = ProductGroupModel(id: Uuid.NAMESPACE_NIL);
            _onCategoryEditProcess(category, nameCtrl.text);
          },
        ),
      ],
    );
  }

  void onEditPressed(ProductGroupModel productGroup) {
    var nameCtrl = TextEditingController(text: productGroup.group_name);
    Get.defaultDialog(
      radius: 5,
      title: "edit_product_group".trParams({
        "name": productGroup.group_name ?? "",
      }),
      titleStyle: const TextStyle(fontFamily: "Siemreap"),
      content: Column(
        children: [
          TextField(
            controller: nameCtrl,
            style: const TextStyle(fontFamily: "Siemreap"),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 20,
              ),
              filled: true,
              isCollapsed: true,
              hintText: "category".tr,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            _onCategoryEditProcess(productGroup, nameCtrl.text);
          },
        ),
      ],
    );
  }

  void _onCategoryEditProcess(
      ProductGroupModel productGroup, String? newName) async {
    isLoading(true);
    Get.back();
    var _tempCategory =
        ProductGroupModel.fromJson(jsonDecode(jsonEncode(productGroup)));
    _tempCategory.group_name = newName;

    var _resp =
        await APIService.post("productGroup/save", jsonEncode(_tempCategory));
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "save_category_success".tr);
      //
      LogService.sendLog(
          user: AppService.currentUser?.fullname ?? "",
          logAction:
              "This User Add Product Group : ${productGroup.group_name}");
    } else {
      AppAlert.errorAlert(title: "save_category_error".tr);
    }
    onLoadCategory();
    isLoading(false);
  }

  void onDeletePressed(ProductGroupModel category) {
    Get.defaultDialog(
      radius: 5,
      title: "delete_product_group".trParams({
        "name": category.group_name ?? "",
      }),
      titleStyle: const TextStyle(fontFamily: "Siemreap"),
      middleText: "are_you_sure".tr,
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            _onCategoryDeleteProcess(category.id);
          },
        ),
      ],
    );
  }

  void _onCategoryDeleteProcess(String? id) async {
    isLoading(true);
    Get.back();
    var _resp = await APIService.post("productGroup/delete/$id");
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "delete_category_success".tr);
    } else {
      AppAlert.errorAlert(title: "delete_category_error".tr);
    }
    onLoadCategory();
    isLoading(false);
  }

  void onRestorePressed(ProductGroupModel category) async {
    isLoading(true);
    var _resp = await APIService.post("productGroup/restore/${category.id}");
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "delete_category_success".tr);
    } else {
      AppAlert.errorAlert(title: "delete_category_error".tr);
    }
    onLoadCategory();
    isLoading(false);
  }
}
