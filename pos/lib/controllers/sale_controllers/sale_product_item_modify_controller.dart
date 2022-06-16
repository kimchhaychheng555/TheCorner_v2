import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';

class SaleProductItemModifyController extends GetxController {
  var quantityCtrl = TextEditingController();
  var priceCtrl = TextEditingController();

  void onControllerInit(SaleProductModel sp) {
    quantityCtrl.text = sp.quantity.toString();
    priceCtrl.text = sp.price.toString();
  }
}
