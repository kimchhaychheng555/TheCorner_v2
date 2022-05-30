import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SaleDiscountController extends GetxController {
  var discountType = Rxn<String>();
  var discountValueCtrl = TextEditingController();

  void onDiscountTypePressed(String type) {
    discountType(type);
  }
}
