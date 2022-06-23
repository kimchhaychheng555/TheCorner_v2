import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewController extends GetxController {
  var totalSale = 0.obs;
  var totalOrder = 0.obs;
  var totalRevenue = (0.0).obs;
  var totalProfit = (0.0).obs;

  // Chart
  RxList<ChartData> data = (<ChartData>[]).obs;
  var tooltip = TooltipBehavior();
  var tooltipBehavior = TooltipBehavior();

  get dataSource => null;

  @override
  void onInit() {
    data([
      ChartData('CHdN', 12),
      ChartData('CHeN', 12),
      ChartData('CHsN', 12),
      ChartData('CHN', 12),
      ChartData('GER', 15),
      ChartData('RUS', 30),
      ChartData('BRZ', 6.4),
      ChartData('IND', 14)
    ]);
    dataSource:
    [
      // Bind data source
      ChartData('Jan', 35),
      ChartData('Feb', 28),
      ChartData('Mar', 34),
      ChartData('Apr', 32),
      ChartData('May', 40)
    ];

    tooltip = TooltipBehavior(enable: true);
    super.onInit();
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
