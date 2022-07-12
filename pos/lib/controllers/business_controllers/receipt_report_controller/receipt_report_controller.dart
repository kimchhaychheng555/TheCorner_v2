import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/widgets/date_range_picker_widget.dart' as datePicker;

class ReceiptReportController extends GetxController {
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

  Future<void> onFilterDatePressed({required BuildContext context}) async {
    late List<DateTime>? picked = [
      DateTime.now().subtract(const Duration(days: 7)),
      DateTime.now(),
    ];

    picked = await datePicker.showDatePicker(
      context: context,
      initialFirstDate: DateTime.now().subtract(const Duration(days: 7)),
      initialLastDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    print(picked);
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
    var _filter = "&\$filter=is_deleted eq false";
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
