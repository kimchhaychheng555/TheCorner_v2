import 'package:get/get.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';

class ReportDetailController extends GetxController {
  var isLoading = false.obs;
  var saleModel = Rxn<SaleModel>();

  RxList<SaleProductModel> sale_products = (<SaleProductModel>[]).obs;

  @override
  void onInit() {
    saleModel(SaleModel.fromJson(Get.arguments));
    super.onInit();
  }

  void _onLoad() {}
}
