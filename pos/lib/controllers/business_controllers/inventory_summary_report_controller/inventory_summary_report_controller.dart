import 'dart:convert';
import 'dart:io';
// import 'dart:html';
import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos/models/others_models/inventory_summary_report_model.dart';
import 'package:pos/models/stock_inventory_models/stock_inventory_model.dart';
import 'package:pos/models/stock_transaction_models/stock_transaction_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:universal_html/html.dart' show AnchorElement;
import 'package:flutter/foundation.dart' show kIsWeb;

class InventorySummaryReportController extends GetxController {
  var isLoading = false.obs;
  var keywordCtrl = TextEditingController();
  RxList<InventorySummaryReportModel> inventorySummaryReportList =
      (<InventorySummaryReportModel>[]).obs;

  // Temp
  RxList<StockInventoryModel> tempStockList = (<StockInventoryModel>[]).obs;
  RxList<StockTransactionModel> tempStockTransactionList =
      (<StockTransactionModel>[]).obs;

  //Pagination
  var totalPage = 0.obs;
  var topCount = 0.obs;
  var currentPage = 1.obs;
  var totalRecords = 0.obs;
  var pager = 5.obs;
  RxList<int> pagerList = (<int>[]).obs;

  @override
  void onInit() async {
    onInitPagerList();
    await onLoad();
    super.onInit();
  }

  Future<void> onLoad() async {
    isLoading(true);
    await _onLoadStockInventory();
    await _onLoadStockTransaction();
    await _onAnalyzeDataForReport();
    isLoading(false);
  }

  Future<void> _onLoadStockInventory() async {
    var _offset = ((currentPage.value - 1) * pager.value);
    var _pagingation = "\$count=true&\$skip=$_offset&\$top=${pager.value}";
    var _query =
        "StockInventory?$_pagingation&\$expand=product&\$filter=is_deleted eq false";

    var _resp = await APIService.oDataGet(_query);
    if (_resp.isSuccess) {
      totalRecords(_resp.count);
      totalPage((_resp.count / pager.value).ceil());

      List<dynamic> _dyn = jsonDecode(_resp.content);
      var _data = _dyn.map((e) => StockInventoryModel.fromJson(e)).toList();
      tempStockList(_data);
    }
  }

  Future<void> _onLoadStockTransaction() async {
    var _resp = await APIService.oDataGet("stockTransaction?\$expand=product");
    if (_resp.isSuccess) {
      List<dynamic> _dyn = jsonDecode(_resp.content);
      var _data = _dyn.map((e) => StockTransactionModel.fromJson(e)).toList();
      tempStockTransactionList(_data);
    }
  }

  Future<void> _onAnalyzeDataForReport() async {
    List<InventorySummaryReportModel> _tempReport = [];
    for (var stock in tempStockList) {
      _tempReport.add(
        InventorySummaryReportModel(
          item_name: stock.product?.name,
          cost: stock.product?.cost,
          price: stock.product?.price,
          qty_on_hand: stock.quantity_stock,
          qty_on_hold: tempStockTransactionList
              .where((st) =>
                  st.type == "hold" && st.product_id == stock.product_id)
              .toList()
              .sum((p) => p.quantity ?? 0),
          qty_sold: tempStockTransactionList
              .where((st) =>
                  st.type == "sold" && st.product_id == stock.product_id)
              .toList()
              .sum((p) => p.quantity ?? 0),
          adjustment: tempStockTransactionList
              .where((st) =>
                  st.type == "adjustment" && st.product_id == stock.product_id)
              .toList()
              .sum((p) => p.quantity ?? 0),
        ),
      );
    }

    inventorySummaryReportList.assignAll(_tempReport);
  }

  void onPagePressed(int page) {
    currentPage(page);
    onLoad();
  }

  void onKeywordSearch() {
    onLoad();
  }

  void onInitPagerList() {
    var _temp = [10, 15, 25, 50];
    pagerList.assignAll(_temp);
    pager(_temp.first);
  }

  void onPagerChanged(int? value) {
    pager(value);
    currentPage(1);
    onLoad();
  }

// Convert to map for Table Responsive
  List<Map<String, dynamic>> get dataSource {
    List<Map<String, dynamic>> temp = [];
    for (var product in inventorySummaryReportList) {
      Map<String, dynamic> p = jsonDecode(jsonEncode(product));
      temp.add(p);
    }
    return temp;
  }

  String get getResultPageInfo {
    return "${"show".tr}: ${((currentPage.value - 1) * pager.value) + 1} - ${(currentPage.value * pager.value)} ${"show".tr} ${totalRecords.value}";
  }

  void onExportPressed() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    sheet.getRangeByName('A1').setText('Name');
    sheet.getRangeByName('A1').cellStyle.bold = true;
    sheet.getRangeByName('A2').setText('Amy');
    sheet.getRangeByName('A3').setText('Jack');
    sheet.getRangeByName('A4').setText('Tiya');
    sheet.getRangeByName('A5').setText('Tiya');
    sheet.getRangeByName('A6').setText('Tiya');
    sheet.getRangeByName('B1').setText('Age');
    sheet.getRangeByName('B1').cellStyle.bold = true;
    sheet.getRangeByName('B2').setNumber(12);
    sheet.getRangeByName('B3').setNumber(20);
    sheet.getRangeByName('B4').setNumber(21);
    sheet.getRangeByName('B5').setNumber(21);
    sheet.getRangeByName('C1').setText('Year');
    sheet.getRangeByName('C1').cellStyle.bold = true;
    sheet.getRangeByName('C2').setNumber(2022);
    sheet.getRangeByName('C3').setNumber(2022);
    sheet.getRangeByName('C4').setNumber(2022);
    sheet.getRangeByName('C5').setNumber(2022);
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    if (kIsWeb) {
      AnchorElement(
          href:
              'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
        ..setAttribute('download', 'Output.xlsx')
        ..click();
    } else {
      final String part = (await getApplicationSupportDirectory()).path;
      final String fileName =
          Platform.isWindows ? '$part\\Output.xlsx' : '$part/Output.xlsx';
      final File file = File(fileName);
      await file.writeAsBytes(bytes, flush: true);
      OpenFile.open(fileName);
    }
  }

  void onFilterPressed() {}
}
