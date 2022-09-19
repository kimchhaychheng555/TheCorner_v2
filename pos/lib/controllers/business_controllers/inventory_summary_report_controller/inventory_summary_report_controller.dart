import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/excel_export_models/excel_export_model.dart';
import 'package:pos/models/others_models/inventory_summary_report_model.dart';
import 'package:pos/models/stock_transaction_models/stock_transaction_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/date_range_picker_widget.dart' as date_picker;

class InventorySummaryReportController extends GetxController {
  var isLoading = false.obs;
  var keywordCtrl = TextEditingController();
  RxList<InventorySummaryReportModel> inventorySummaryReportList =
      (<InventorySummaryReportModel>[]).obs;

  // Temp
  RxList<StockTransactionModel> tempStockTransactionList =
      (<StockTransactionModel>[]).obs;

  // FIlter
  var groupBy = "group_by_product".obs;
  var startDate = (DateTime.now().subtract(const Duration(days: 7))).obs;
  var endDate = (DateTime.now()).obs;

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
    await _onLoadInventorySummary();
    isLoading(false);
  }

  Future<void> _onLoadInventorySummary() async {
    var _offset = ((currentPage.value - 1) * pager.value);
    var _startDate = (DateFormat("yyyy-MM-dd").format(startDate.value));
    var _endDate = (DateFormat("yyyy-MM-dd").format(endDate.value));
    var _resp = await APIService.storeProcedure(
        procedureName: "spGetInventorySummaryReport",
        parameterName: [
          "@groupBy",
          "@keyword",
          "@startDate",
          "@endDate",
          "@offset",
          "@limit"
        ],
        parameterValue: [
          groupBy.value,
          keywordCtrl.text,
          _startDate,
          _endDate,
          "$_offset",
          "${pager.value}",
        ]);

    if (_resp.isSuccess) {
      var _data = jsonDecode(_resp.content);
      totalRecords(_data["totalRecords"]);
      totalPage((_data["totalRecords"] / pager.value).ceil());

      if (totalRecords.value > 0) {
        List<dynamic> _reportDecode = _data["records"];
        List<InventorySummaryReportModel> _reports = _reportDecode
            .map((e) => InventorySummaryReportModel.fromJson(e))
            .toList();

        inventorySummaryReportList.assignAll(_reports);
      }
    }
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

  Future<void> onExportPressed() async {
    List<ExcelExportModel> export = [
      ExcelExportModel(
        header: "Name",
        contentList: ["Name1", "Name2"],
      ),
      ExcelExportModel(
        header: "Age",
        contentList: ["20", "14"],
      ),
    ];

    await AppService.onExportProcess(
        fileName: "inventory-summary-report", excelExportList: export);
  }

  void onFilterPressed() {
    if (_tempGroupBy != "") {
      groupBy(_tempGroupBy);
    }
    startDate(tempStartdate.value);
    endDate(tempEnddate.value);
    Get.back();
    onLoad();
  }

  String _tempGroupBy = "";
  void onGroupByFilterPressed(String? _val) {
    if ((_val ?? "") == "") {
      _tempGroupBy = groupBy.value;
    } else {
      _tempGroupBy = _val!;
    }
  }

  var tempStartdate = (DateTime.now().subtract(const Duration(days: 7))).obs;
  var tempEnddate = (DateTime.now()).obs;
  Future<void> onFilterDatePressed() async {
    tempStartdate(startDate.value);
    tempEnddate(endDate.value);
    List<DateTime>? picked = [tempStartdate.value, tempEnddate.value];

    picked = await date_picker.showDatePicker(
      context: Get.context!,
      initialFirstDate: picked.first,
      initialLastDate: picked.last,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    tempStartdate(picked?.first);
    tempEnddate(picked?.last);
    onLoad();
  }

  String get getDateFilterText {
    if (startDate.value == endDate.value) {
      return DateFormat("dd/MMM/yyyy").format(startDate.value);
    }
    return "${DateFormat("dd/MMM/yyyy").format(startDate.value)} - ${DateFormat("dd/MMM/yyyy").format(endDate.value)}";
  }
}
