import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pos/widgets/date_range_picker_widget.dart' as date_picker;

class OverviewController extends GetxController {
  var isLoading = false.obs;
  var showPieChartPercent = true.obs;
  var firstDate = (DateTime.now().subtract(const Duration(days: 7))).obs;
  var lastDate = (DateTime.now()).obs;
  RxList<SaleModel> receiptList = (<SaleModel>[]).obs;

  //
  var totalSale = 0.obs;
  var totalOrder = 0.obs;
  var totalRevenue = (0.0).obs;
  var totalExpense = (0.0).obs;

  // Chart
  RxList<ChartData> dataBarChart = (<ChartData>[]).obs;
  var maxBarChartValue = (0.0).obs;
  var intervalBarChart = (0.0).obs;
  var tooltip = TooltipBehavior();
  var tooltipBehavior = TooltipBehavior(
      textStyle: const TextStyle(fontFamily: "Roboto"), enable: true);

  // get dataSource => null;
  RxList<PieData> dataPieChart = (<PieData>[]).obs;
  RxList<SummaryData> dataSummaryList = (<SummaryData>[]).obs;

  @override
  void onInit() async {
    onLoad();

    super.onInit();
  }

  void onLoad() async {
    isLoading(true);
    await _onLoadDataOverview();
    await _onReceiptLoad();
    isLoading(false);
  }

  Future<void> _onReceiptLoad() async {
    var _pagingation = "\$top=10";
    var _filter =
        "&\$filter=is_deleted eq false and sale_date ge '${DateFormat("yyyy-MM-dd").format(firstDate.value)}' AND sale_date le '${DateFormat("yyyy-MM-dd").format(lastDate.value)}'";
    var _query =
        "sale?$_pagingation&\$expand=table$_filter&\$orderby=created_date desc";

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
    for (var report in receiptList) {
      Map<String, dynamic> p = jsonDecode(jsonEncode(report));
      temp.add(p);
    }
    return temp;
  }

  Future<void> _onLoadDataOverview() async {
    var _resp = await APIService.storeProcedure(
      procedureName: "spGetOverviewData",
      parameterName: ["@startDate", "@endDate"],
      parameterValue: [
        DateFormat("yyyy-MM-dd").format(firstDate.value),
        DateFormat("yyyy-MM-dd").format(lastDate.value),
      ],
    );

    if (_resp.isSuccess) {
      dynamic dyn = jsonDecode(_resp.content);

      // ASSIGN KPI VALUE
      var _kpiData = jsonDecode(dyn["KPI"]);
      totalSale(_kpiData["total_sale"]);
      totalOrder(_kpiData["total_order"]);
      totalRevenue(_kpiData["total_revenue"]);
      totalExpense(_kpiData["total_expense"]);

      // ASSIGN CHART VALUE
      List<dynamic> _saleOverview = jsonDecode(dyn["saleOverview"] ?? "[]");
      List<ChartData> _chartData = [];
      List<dynamic> _topSaleProduct = jsonDecode(dyn["topSaleProduct"] ?? "[]");
      List<PieData> _pieChart = [];
      _saleOverview.forEach(((e) => _chartData.add(
            ChartData(e['label'], e['value']),
          )));
      _topSaleProduct.forEach(((e) => _pieChart.add(
            PieData(e['name'], e['quantity']),
          )));
      _onLoadChartData(
        barChart: _chartData,
        pieChart: _pieChart,
      );

      // ASSIGN SUMMARY VALUE
      List<dynamic> _summaryData = jsonDecode(dyn["summary"]);
      List<SummaryData> _tempList = [];
      for (var e in _summaryData) {
        _tempList.add(SummaryData(e["name"], e["value"]));
      }
      dataSummaryList.assignAll(_tempList);

      // ASSIGN MAX VALUE CHART
      maxBarChartValue(dyn["maxBarChartValue"]);
      intervalBarChart(maxBarChartValue.value / 10);
    } else {
      AppAlert.errorAlert(
          title: "${"error".tr} storePrcedure: spGetOverviewData");
    }
  }

  Future<void> _onLoadChartData({
    required List<ChartData> barChart,
    required List<PieData> pieChart,
  }) async {
    dataBarChart(barChart);
    dataPieChart(pieChart);
    tooltipBehavior = TooltipBehavior(
      enable: true,
      textStyle: const TextStyle(fontFamily: "Roboto"),
    );
    tooltip = TooltipBehavior(
      enable: true,
      textStyle: const TextStyle(fontFamily: "Roboto"),
    );
  }

  Future<void> onFilterDatePressed() async {
    List<DateTime>? picked = [firstDate.value, lastDate.value];

    picked = await date_picker.showDatePicker(
      context: Get.context!,
      initialFirstDate: picked.first,
      initialLastDate: picked.last,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    firstDate(picked?.first);
    lastDate(picked?.last);
    onLoad();
  }

  String get getDateFilterText {
    if (firstDate.value == lastDate.value) {
      return DateFormat("dd/MMM/yyyy").format(firstDate.value);
    }
    return "${DateFormat("dd/MMM/yyyy").format(firstDate.value)} - ${DateFormat("dd/MMM/yyyy").format(lastDate.value)}";
  }

  Map<String, double> get getDataPieChart {
    Map<String, double> _map = {};
    dataPieChart.toList().forEach((customer) => _map[customer.x] = customer.y);
    return _map;
  }

  List<SummaryData> get getSummaryData {
    return dataSummaryList.toList();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

class PieData {
  final String x;
  final double y;

  PieData(this.x, this.y);
}

class SummaryData {
  final String name;
  final int value;

  SummaryData(this.name, this.value);
}
