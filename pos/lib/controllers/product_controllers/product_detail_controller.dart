import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/services/api_service.dart';

class ProductDetailController extends GetxController {
  var titleScreen = "".obs;
  var isLoading = false.obs;
  var isEditable = false.obs;
  //
  var productDetail = ProductModel().obs;
  var tempProductDetail = ProductModel().obs;
  RxList<CategoryModel> categoryList = (<CategoryModel>[]).obs;

  @override
  void onInit() async {
    super.onInit();
    await onLoadCategory();
    onGetArgument();
  }

  Future<void> onGetArgument() async {
    var arg = Get.arguments;
    if (arg != null) {
      var _data = ProductModel.fromJson(arg);
      productDetail(_data);
      tempProductDetail(productDetail.value);
    }

    if (productDetail.value.id == null) {
      titleScreen("add_product");
      isEditable(true);
    }
  }

  Future<void> onLoadCategory() async {
    isLoading(true);

    var _resp =
        await APIService.oDataGet("category?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _dynamic = [];
      _dynamic = jsonDecode(_resp.content);
      var _dataList = _dynamic.map((e) => CategoryModel.fromJson(e)).toList();
      categoryList.assignAll(_dataList);
    }

    isLoading(false);
  }

  void onEditablePressed() {
    titleScreen("edit_product");
    isEditable(!isEditable.value);
  }

  void onStockableChanged(bool? value) {
    productDetail.value.stockable = value;
    productDetail.refresh();
  }

  void onUploadPressed() {}
  void onClearImagePressed() {}

  void onCancelProductDetail() => Get.back();
  void onSaveProductDetail() {}
}
