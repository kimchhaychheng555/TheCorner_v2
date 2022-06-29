import 'package:get/get.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewController extends GetxController {
  var totalSale = 0.obs;
  var totalOrder = 0.obs;
  var totalRevenue = (0.0).obs;
  var totalProfit = (0.0).obs;

  // Chart
  RxList<ChartData> data = (<ChartData>[]).obs;
  // var tooltip = TooltipBehavior();
  // var tooltipBehavior = TooltipBehavior();

  // get dataSource => null;
  RxList<PiaData> dataSource = (<PiaData>[]).obs;

  @override
  void onInit() {
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
    // tooltipBehavior = TooltipBehavior(enable: true);
    // tooltip = TooltipBehavior(enable: true);
    super.onInit();
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
