import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:pos/services/api_service.dart';

class ReportDetailController extends GetxController {
  var isLoading = false.obs;
  var saleModel = Rxn<SaleModel>();

  RxList<SaleProductModel> saleProducts = (<SaleProductModel>[]).obs;

  @override
  void onInit() async {
    isLoading(true);
    saleModel(SaleModel.fromJson(Get.arguments));
    await _onLoad();
    isLoading(false);
    super.onInit();
  }

  Future<void> _onLoad() async {
    var _resp = await APIService.get(
        "sale(${saleModel.value?.id})?\$expand=sale_products");

    if (_resp.isSuccess) {
      var _dyn = jsonDecode(_resp.content);
      var _data = SaleModel.fromJson(_dyn);
      saleProducts.assignAll(_data.sale_products ?? []);
    }
  }
}
