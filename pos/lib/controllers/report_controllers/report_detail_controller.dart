import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/models/print_models/print_model.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:pos/screens/sale_screens/sale_screen.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:uuid/uuid.dart';

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

  void onPrintInvoicePressed() async {
    isLoading(true);
    var printData = PrintModel(
      created_by: AppService.currentUser?.fullname,
      id: Uuid.NAMESPACE_NIL,
      sale_id: saleModel.value?.id,
      key: "invoice",
    );
    var _resp = await APIService.post("print/save", jsonEncode(printData));
    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "print_success".tr);
    } else {
      AppAlert.errorAlert(title: "print_error".tr);
    }

    isLoading(false);
  }

  void onEditSale() {
    Get.toNamed(
      SaleScreen.routeName,
      arguments: {
        "sale": saleModel.value?.id,
      },
    );
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
