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

  @override
  void onInit() async {
    super.onInit();
    isLoading(true);
    await onLoadProduct();
    isLoading(false);
  }

  Future<void> onLoadProduct() async {
    var _resp = await APIService.oDataGet(
        "product?\$expand=category&\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
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
