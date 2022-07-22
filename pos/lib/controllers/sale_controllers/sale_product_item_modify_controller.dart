import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';

class SaleProductItemModifyController extends GetxController {
  var quantityCtrl = TextEditingController();
  var priceCtrl = TextEditingController();
  var discountType = Rxn<String>();
  var discountValueCtrl = TextEditingController();

  void onControllerInit(SaleProductModel sp) {
    quantityCtrl.text = sp.quantity.toString();
    priceCtrl.text = sp.price.toString();
    discountType(sp.discount_type);
    discountValueCtrl.text = sp.discount.toString();
  }

  void onDiscountTypePressed(String type) {
    discountType(type);
  }
}
