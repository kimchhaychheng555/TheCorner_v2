import 'dart:convert';
import 'package:get/get.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/services/api_service.dart';

class OverviewTotalInvoiceController extends GetxController {
  RxList<SaleModel> receiptList = (<SaleModel>[]).obs;

  @override
  void onInit() {
    onLoad();
    super.onInit();
  }

  Future<void> onLoad() async {
    var _pagingation = "\$top=10";
    var _filter = "&\$filter=is_deleted eq false";
    var _query =
        "sale?$_pagingation&\$expand=table&$_filter&\$orderby=created_date desc";

    var _resp = await APIService.oDataGet(_query);
    if (_resp.isSuccess) {
      List<dynamic> _dyn = [];
      _dyn = jsonDecode(_resp.content);
      var _dataList = _dyn.map((e) => SaleModel.fromJson(e)).toList();
      receiptList.assignAll(_dataList);
    }
  }

  List<Map<String, dynamic>> get dataSource {
    List<Map<String, dynamic>> temp = [];
    for (var product in receiptList) {
      Map<String, dynamic> p = jsonDecode(jsonEncode(product));
      temp.add(p);
    }
    return temp;
  }
}
