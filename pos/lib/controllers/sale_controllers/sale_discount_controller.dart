import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/sale_controllers/sale_controller.dart';
import 'package:pos/models/product_group_models/product_group_model.dart';

class SaleDiscountController extends GetxController {
  var discountType = Rxn<String>();
  var discountValueCtrl = TextEditingController();
  var saleCtrl = Get.find<SaleController>();

  RxList<ProductGroupModel> selectedProductGroup = (<ProductGroupModel>[]).obs;

  void onDiscountTypePressed(String type) {
    discountType(type);
  }

  void onProductGroupPressed(ProductGroupModel pg) {
    if (selectedProductGroup.contains(pg)) {
      selectedProductGroup.remove(pg);
    } else {
      selectedProductGroup.add(pg);
    }
  }

  void onSelectedAllProductGroup() {
    selectedProductGroup.assignAll(saleCtrl.productGroupList);
  }

  bool get selectedAllProductGroup {
    if (selectedProductGroup.length == saleCtrl.productGroupList.length) {
      return true;
    }

    return false;
  }
}
