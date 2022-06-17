import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/screens/products_screens/widgets/product_detail_widget.dart';
import 'package:pos/services/api_service.dart';

class ProductController extends GetxController {
  var isLoading = false.obs;
  RxList<ProductModel> productList = (<ProductModel>[]).obs;

  @override
  void onInit() async {
    super.onInit();
    isLoading(true);
    await onLoadProduct();
    isLoading(false);
  }

  Future<void> onLoadProduct() async {
    var _resp = await APIService.oDataGet(
        "product?\$expand=category&\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _dyn = [];
      _dyn = jsonDecode(_resp.content);
      var _dataList = _dyn.map((e) => ProductModel.fromJson(e)).toList();
      productList.assignAll(_dataList);
    }
  }

// Convert to map for Table Responsive
  List<Map<String, dynamic>> get dataSource {
    List<Map<String, dynamic>> temp = [];
    for (var product in productList) {
      Map<String, dynamic> p = jsonDecode(jsonEncode(product));
      temp.add(p);
    }
    return temp;
  }

  void onAddCategoryPressed() {}
  void onAddProductPressed() {
    Get.toNamed(
      ProductDetailScreen.routeName,
      preventDuplicates: true,
    );
  }
}
