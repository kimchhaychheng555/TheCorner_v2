import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_service.dart';

class ReportController extends GetxController {
  var keywordCtrl = TextEditingController();
  var isLoading = false.obs;
  RxList<SaleModel> reportList = (<SaleModel>[]).obs;

  //Pagination
  var totalPage = 0.obs;
  var topCount = 0.obs;
  var currentPage = 1.obs;
  var totalRecords = 0.obs;
  var pager = 5.obs;
  RxList<int> pagerList = (<int>[]).obs;

  @override
  void onInit() {
    onInitPagerList();
    onLoad();
    super.onInit();
  }

  void onInitPagerList() {
    var _temp = [10, 15, 25, 50];
    pagerList.assignAll(_temp);
    pager(_temp.first);
  }

  Future<void> onLoad() async {
    isLoading(true);
    var _offset = ((currentPage.value - 1) * pager.value);
    var _pagingation = "\$count=true&\$skip=$_offset&\$top=${pager.value}";
    var _filter =
        "&\$filter=is_deleted eq false and created_by eq '${AppService.currentUser?.fullname}' and sale_date eq '${AppService.currentStartSale?.date}'";
    var _query =
        "sale?keyword=${keywordCtrl.text}&$_pagingation&\$expand=table$_filter&\$orderby=created_date desc";

    var _resp = await APIService.oDataGet(_query);
    if (_resp.isSuccess) {
      totalRecords(_resp.count);
      totalPage((_resp.count / pager.value).ceil());

      List<dynamic> _dyn = [];
      _dyn = jsonDecode(_resp.content);
      var _dataList = _dyn.map((e) => SaleModel.fromJson(e)).toList();
      reportList.assignAll(_dataList);
    }
    isLoading(false);
  }

  void onKeywordSearch() {
    onLoad();
  }

  void onPagerChanged(int? value) {
    pager(value);
    currentPage(1);
    onLoad();
  }

  List<Map<String, dynamic>> get dataSource {
    List<Map<String, dynamic>> temp = [];
    for (var report in reportList) {
      Map<String, dynamic> p = jsonDecode(jsonEncode(report));
      temp.add(p);
    }
    return temp;
  }

  void onPagePressed(int page) {
    currentPage(page);
    onLoad();
  }

  String get getResultPageInfo {
    return "${"show".tr}: ${((currentPage.value - 1) * pager.value) + 1} - ${(currentPage.value * pager.value)} ${"show".tr} ${totalRecords.value}";
  }
}
