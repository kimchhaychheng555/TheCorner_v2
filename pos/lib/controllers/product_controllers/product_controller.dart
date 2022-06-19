import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/screens/products_screens/category_screen.dart';
import 'package:pos/screens/products_screens/widgets/product_detail_screen.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/widgets/button_action_widget.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  RxList<ProductModel> productList = (<ProductModel>[]).obs;

  //Pagination
  var totalPage = 0.obs;
  var topCount = 0.obs;
  var currentPage = 1.obs;
  var offset = 0.obs;
  var pager = 5.obs;
  RxList<int> pagerList = (<int>[]).obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading(true);
    onInitPagerList();
    await onLoadProduct();
    isLoading(false);
  }

  void onInitPagerList() {
    var _temp = [5, 10, 15, 25, 50];
    pagerList.assignAll(_temp);
    pager(_temp.first);
  }

  void onPagerChanged(int? value) {
    pager(value);
  }

  Future<void> onLoadProduct() async {
    var _resp = await APIService.oDataGet(
        "product?\$expand=category&\$count=true&\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      totalPage((_resp.count / pager.value).ceil());

      List<dynamic> _dyn = [];
      _dyn = jsonDecode(_resp.content);
      var _dataList = _dyn.map((e) => ProductModel.fromJson(e)).toList();
      productList.assignAll(_dataList);
    }
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
}
