import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/services/api_service.dart';

class ProductDetailController extends GetxController {
  var isLoading = false.obs;

  RxList<CategoryModel> categoryList = (<CategoryModel>[]).obs;

  @override
  void onInit() async {
    super.onInit();
    await onLoadCategory();
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

  void onUploadPressed() {}
  void onClearImagePressed() {}
}
