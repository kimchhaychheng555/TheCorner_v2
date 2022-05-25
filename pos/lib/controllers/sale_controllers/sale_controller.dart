import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/sale_controllers/sale_table_controller.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:pos/models/table_models/table_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:uuid/uuid.dart';

class SaleController extends GetxController {
  var isLoading = false.obs;
  SaleTableController saleTableCtrl = Get.find();
  var categorySelected = Rxn<CategoryModel>();
  var sale = Rxn<SaleModel>();
  var table = Rxn<TableModel>();

  //
  RxList<ProductModel> productList = (<ProductModel>[]).obs;
  RxList<CategoryModel> categoryList = (<CategoryModel>[]).obs;

  @override
  void onInit() async {
    isLoading(true);
    _onInitController();
    await _onLoadCategory();
    await _onLoadProduct();
    _onSaleInitValue();
    isLoading(false);
    super.onInit();
  }

  void _onInitController() {
    table(TableModel.fromJson(jsonDecode(Get.arguments["table"])));
  }

  void onTableChanged(String? tableId) {
    table(saleTableCtrl.tableList.where((t) => t.id == tableId).first);
  }

  Future<void> _onLoadProduct() async {
    var _resp = await APIService.oDataGet(
        "product?\$filter=is_deleted eq false and category_id eq ${categorySelected.value?.id}");
    if (_resp.isSuccess) {
      List<dynamic> _products = jsonDecode(_resp.content) ?? [];
      var _datas = _products.map((p) => ProductModel.fromJson(p)).toList();
      productList.assignAll(_datas);
    }
  }

  Future<void> _onLoadCategory() async {
    var _resp =
        await APIService.oDataGet("category?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _categories = jsonDecode(_resp.content) ?? [];
      var _datas = _categories.map((c) => CategoryModel.fromJson(c)).toList();
      categoryList.assignAll(_datas);
      categorySelected(_datas.first);
    }
  }

  void _onSaleInitValue() {
    var _sale = SaleModel(
      created_by: AppService.currentUser?.fullname,
      id: Uuid.NAMESPACE_NIL,
      sale_date: AppService.currentStartSale?.date,
      table_id: table.value?.id,
    );
    sale(_sale);
  }

  void onCategoryPressed(CategoryModel category) async {
    isLoading(true);
    categorySelected(category);
    await _onLoadProduct();
    isLoading(false);
  }

  void onCancelBillPressed() {
    Get.defaultDialog(
      radius: 5,
      title: "cancel".tr,
      middleText: "do_you_want_to_cancel_this_bill".tr,
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            AppService.back();
          },
        ),
      ],
    );
  }

  void onHoldBillPressed() {}
  void onPayPressed() {}
  void onProductPressed(ProductModel product) {
    var _exists = sale.value?.sale_products
        .where((sp) => sp.product_id == product.id)
        .toList();

    if ((_exists ?? []).isNotEmpty) {
      _exists?.first.quantity = ((_exists.first.quantity ?? 0) + 1);
    } else {
      var _tempSp = SaleProductModel(
        quantity: 1,
        image: product.image,
        price: product.price,
        product_id: product.id,
        product_name: product.name,
      );
      sale.value?.sale_products.add(_tempSp);
    }

    sale.refresh();
  }

  void onSaleProductItemPressed(SaleProductModel sp) {}
  void onSaleProductItemDeletePressed(SaleProductModel sp) {
    Get.defaultDialog(
      radius: 5,
      title: sp.product_name ?? "",
      titleStyle: const TextStyle(fontFamily: "Siemreap"),
      middleText: "do_you_want_to_remove_this_product".tr,
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            _onSaleProductItemDeleteProcess(sp);
          },
        ),
      ],
    );
  }

  void _onSaleProductItemDeleteProcess(SaleProductModel sp) {
    sale.value?.sale_products.remove(sp);
    sale.refresh();
    Get.back();
  }
}
