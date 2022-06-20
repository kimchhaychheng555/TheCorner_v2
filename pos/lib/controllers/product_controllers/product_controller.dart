import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/screens/products_screens/category_screen.dart';
import 'package:pos/screens/products_screens/widgets/product_detail_screen.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:uuid/uuid.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  var isDeletedFilter = false.obs;
  var currentCategoryId = Rxn<String>();
  RxList<ProductModel> productList = (<ProductModel>[]).obs;
  RxList<CategoryModel> categoryList = (<CategoryModel>[]).obs;

  //Pagination
  var totalPage = 0.obs;
  var topCount = 0.obs;
  var currentPage = 1.obs;
  var totalRecords = 0.obs;
  var pager = 5.obs;
  RxList<int> pagerList = (<int>[]).obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading(true);
    onInitCategory();
    onInitPagerList();
    await onLoadProduct();
    isLoading(false);
  }

  void onInitCategory() async {
    isLoading(true);
    var _resp =
        await APIService.oDataGet("category?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _listDyn = jsonDecode(_resp.content);
      var _dataList = _listDyn.map((e) => CategoryModel.fromJson(e)).toList();
      categoryList.assignAll(_dataList);
      categoryList.insert(
        0,
        CategoryModel(
            id: Uuid.NAMESPACE_NIL, is_deleted: false, name: "all".tr),
      );
      currentCategoryId(categoryList.first.id);
    }
    isLoading(false);
  }

  void onInitPagerList() {
    var _temp = [5, 10, 15, 25, 50];
    pagerList.assignAll(_temp);
    pager(_temp.first);
  }

  void onPagerChanged(int? value) {
    pager(value);
    currentPage(1);
    onLoadProduct();
  }

  String tempStatus = "active";
  void onStatusFilterChanged(String? value) {
    tempStatus = value ?? "active";
  }

  String? _tempCategoryId;
  void onCategoryFilterChanged(String? value) {
    _tempCategoryId = value;
  }

  void onFilterPressed() {
    Get.back();
    if (tempStatus == "active") {
      isDeletedFilter(false);
    } else {
      isDeletedFilter(true);
    }

    if ((_tempCategoryId ?? Uuid.NAMESPACE_NIL) == Uuid.NAMESPACE_NIL) {
      currentCategoryId(_tempCategoryId);
    }
    onLoadProduct();
  }

  Future<void> onLoadProduct() async {
    isLoading(true);
    var _offset = ((currentPage.value - 1) * pager.value);
    var _pagingation = "\$count=true&\$skip=$_offset&\$top=${pager.value}";
    var _query =
        "product?$_pagingation&\$expand=category&\$filter=is_deleted eq ${isDeletedFilter.value}";
    if ((currentCategoryId.value ?? Uuid.NAMESPACE_NIL) != Uuid.NAMESPACE_NIL) {
      _query += " and category_id eq ${currentCategoryId.value}";
    }

    var _resp = await APIService.oDataGet(_query);
    if (_resp.isSuccess) {
      totalRecords(_resp.count);
      totalPage((_resp.count / pager.value).ceil());

      List<dynamic> _dyn = [];
      _dyn = jsonDecode(_resp.content);
      var _dataList = _dyn.map((e) => ProductModel.fromJson(e)).toList();
      productList.assignAll(_dataList);
    }
    isLoading(false);
  }

// Convert to map for Table Responsive
  List<Map<String, dynamic>> get dataSource {
    List<Map<String, dynamic>> temp = [];
    for (var product in productList) {
      Map<String, dynamic> p = jsonDecode(jsonEncode(product));
      temp.add(p);
    }
    return temp;
  }

  void onCategoryPressed() {
    Get.toNamed(
      CategoryScreen.routeName,
      preventDuplicates: true,
    );
  }

  void onAddProductPressed() {
    Get.toNamed(
      ProductDetailScreen.routeName,
      preventDuplicates: true,
    );
  }

  void onProductDeletePressed({
    required String id,
    required String name,
  }) {
    Get.defaultDialog(
      radius: 5,
      title: "product_delete".trParams({
        "name": name,
      }),
      titleStyle: const TextStyle(fontFamily: "Siemreap"),
      middleText: "are_you_sure".tr,
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            _productDeleteProcess(id);
          },
        ),
      ],
    );
  }

  void _productDeleteProcess(String? id) async {
    Get.back();
    isLoading(true);
    var _resp = await APIService.post("product/delete/$id");
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "delete_product_success".tr);
      onLoadProduct();
    } else {
      AppAlert.errorAlert(title: "delete_product_error".tr);
    }
    isLoading(false);
  }

  void onPagePressed(int page) {
    currentPage(page);
    onLoadProduct();
  }

  void onProductRestorePressed(String? value) async {
    isLoading(true);
    var _resp = await APIService.post("product/restore/$value");
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "restore_product_success".tr);
    } else {
      isLoading(false);
      AppAlert.errorAlert(title: "restore_product_error".tr);
      return;
    }

    onLoadProduct();
    isLoading(false);
  }

  String get getResultPageInfo {
    return "${"show".tr}: ${((currentPage.value - 1) * pager.value) + 1} - ${(currentPage.value * pager.value)} ${"show".tr} ${totalRecords.value}";
  }
}
