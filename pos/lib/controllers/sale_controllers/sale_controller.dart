import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/controllers/sale_controllers/sale_table_controller.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/models/table_models/table_model.dart';
import 'package:pos/services/api_service.dart';

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

  void onCategoryPressed(CategoryModel category) async {
    isLoading(true);
    categorySelected(category);
    await _onLoadProduct();
    isLoading(false);
  }
}
