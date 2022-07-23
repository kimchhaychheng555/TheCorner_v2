import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/log_service.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:uuid/uuid.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;

  RxList<CategoryModel> categoryList = (<CategoryModel>[]).obs;

  @override
  void onInit() {
    super.onInit();
    onLoadCategory();
  }

  void onLoadCategory() async {
    isLoading(true);
    var _resp = await APIService.oDataGet("category");
    if (_resp.isSuccess) {
      List<dynamic> _dynList = jsonDecode(_resp.content);
      var dataList = _dynList.map((e) => CategoryModel.fromJson(e)).toList();
      categoryList(dataList);
    }

    isLoading(false);
  }

  void onAddCategoryPressed() {
    var nameCtrl = TextEditingController();
    Get.defaultDialog(
      radius: 5,
      title: "add_category".tr,
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
            var category = CategoryModel(id: Uuid.NAMESPACE_NIL);
            _onCategoryEditProcess(category, nameCtrl.text);
          },
        ),
      ],
    );
  }

  void onEditPressed(CategoryModel category) {
    var nameCtrl = TextEditingController(text: category.name);
    Get.defaultDialog(
      radius: 5,
      title: "edit_category".trParams({
        "name": category.name ?? "",
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
            _onCategoryEditProcess(category, nameCtrl.text);
          },
        ),
      ],
    );
  }

  void _onCategoryEditProcess(CategoryModel category, String? newName) async {
    isLoading(true);
    Get.back();
    var _tempCategory =
        CategoryModel.fromJson(jsonDecode(jsonEncode(category)));
    _tempCategory.name = newName;

    var _resp =
        await APIService.post("category/save", jsonEncode(_tempCategory));
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "save_category_success".tr);
      //
      LogService.sendLog(
          user: AppService.currentUser?.fullname ?? "",
          logAction: "This User Add Category : ${category.name}");
    } else {
      AppAlert.errorAlert(title: "save_category_error".tr);
    }
    onLoadCategory();
    isLoading(false);
  }

  void onDeletePressed(CategoryModel category) {
    Get.defaultDialog(
      radius: 5,
      title: "delete_category".trParams({
        "name": category.name ?? "",
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
    var _resp = await APIService.post("category/delete/$id");
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "delete_category_success".tr);
    } else {
      AppAlert.errorAlert(title: "delete_category_error".tr);
    }
    onLoadCategory();
    isLoading(false);
  }

  void onRestorePressed(CategoryModel category) async {
    isLoading(true);
    var _resp = await APIService.post("category/restore/${category.id}");
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "delete_category_success".tr);
    } else {
      AppAlert.errorAlert(title: "delete_category_error".tr);
    }
    onLoadCategory();
    isLoading(false);
  }
}
