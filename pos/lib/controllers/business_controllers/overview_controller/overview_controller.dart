import 'dart:convert';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos/services/api_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pos/widgets/date_range_picker_widget.dart' as date_picker;

class OverviewController extends GetxController {
  var isLoading = false.obs;
  var firstDate = (DateTime.now().subtract(const Duration(days: 7))).obs;
  var lastDate = (DateTime.now()).obs;

  //
  var totalSale = 0.obs;
  var totalOrder = 0.obs;
  var totalRevenue = (0.0).obs;
  var totalProfit = (0.0).obs;

  // Chart
  RxList<ChartData> data = (<ChartData>[]).obs;
  var tooltip = TooltipBehavior();
  var tooltipBehavior = TooltipBehavior();

  // get dataSource => null;
  RxList<PiaData> dataSource = (<PiaData>[]).obs;

  @override
  void onInit() async {
    onLoad();
    super.onInit();
  }

  void onLoad() async {
    isLoading(true);

    print(DateFormat("yyyy-MM-dd").format(firstDate.value));
    print(DateFormat("yyyy-MM-dd").format(lastDate.value));

    await _onLoadKPI();
    await _onLoadChartData();
    await _onLoadTotalInvoice();
    isLoading(false);
  }

  Future<void> _onLoadKPI() async {
    await _onLoadTotalSale();
    await _onLoadTotalOrder();
    await _onLoadRevenue();
  }

  Future<void> _onLoadTotalSale() async {
    var thisMonthDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    var thisMonthStr = DateFormat("yyyy-MM-dd").format(thisMonthDate);
    var _resp = await APIService.oDataGet(
        "sale?\$count=true&\$filter=sale_date ge '$thisMonthStr' and is_paid eq true");
    if (_resp.isSuccess) {
      totalSale(_resp.count);
    }
  }

  Future<void> _onLoadTotalOrder() async {
    var thisMonthDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    var thisMonthStr = DateFormat("yyyy-MM-dd").format(thisMonthDate);
    var _resp = await APIService.oDataGet(
        "sale?\$count=true&\$filter=sale_date ge '$thisMonthStr' and is_paid eq false");
    if (_resp.isSuccess) {
      totalOrder(_resp.count);
    }
  }

  Future<void> _onLoadRevenue() async {
    var thisMonthDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    var thisMonthStr = DateFormat("yyyy-MM-dd").format(thisMonthDate);
    var _resp = await APIService.oDataGet(
        "sale?\$count=true&\$filter=sale_date ge '$thisMonthStr' and is_paid eq true&\$select=grand_total");
    if (_resp.isSuccess) {
      List<dynamic> _dyn = jsonDecode(_resp.content);
      double _total = 0;
      for (var a in _dyn) {
        _total += a["grand_total"];
      }
      totalRevenue(_total);
    }
  }

  Future<void> _onLoadTotalInvoice() async {}

  Future<void> _onLoadChartData() async {
    data([
      ChartData('Jan', 34),
      ChartData('Feb', 43),
      ChartData('Mar', 45),
      ChartData('Apr', 50),
      ChartData('May', 52),
      ChartData('Jun', 45),
      ChartData('Jul', 73),
      ChartData('Aug', 35),
      ChartData('Sep', 82),
      ChartData('Oct', 86),
      ChartData('Nov', 90),
      ChartData('Dec', 98),
    ]);
    dataSource([
      // Bind data source
      PiaData('ងាវឆាអំពិលទំ', 35),
      PiaData('ខាត់ណាទឹកភ្នែក', 28),
      PiaData('Angkor Beer', 34),
      PiaData('ឆាក្ដៅមាន់', 3),
    ]);
    tooltipBehavior = TooltipBehavior(enable: true);
    tooltip = TooltipBehavior(enable: true);
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
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

class PiaData {
  final String x;
  final double y;

  PiaData(this.x, this.y);
}
