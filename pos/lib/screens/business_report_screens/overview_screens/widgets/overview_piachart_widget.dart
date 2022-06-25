import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
// import 'package:pos/controllers/business_controllers/overview_controller/overview_controller.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class OverviewPiaChatWidget extends StatelessWidget {
  OverviewPiaChatWidget({Key? key}) : super(key: key);
  Map<String, double> dataMap = {
    "ងាវឆាអំពិលទំ": 35,
    "ខាត់ណាទឹកភ្នែក": 28,
    "Angkor Beer": 34,
    "ឆាក្ដៅមាន់": 20,
  };

  @override
  Widget build(BuildContext context) {
    // OverviewController _controller = Get.find();
    // return SfCircularChart(
    //   legend: Legend(
    //     iconBorderWidth: 10,
    //     isVisible: true,

    //     // toggleSeriesVisibility: true,
    //     // iconWidth: 30,
    //   ),
    //   // Enables the tooltip for all the series in chart
    //   tooltipBehavior: _controller.tooltipBehavior,
    //   series: [
    //     PieSeries<PiaData, String>(
    //       enableTooltip: true,
    //       dataSource: _controller.dataSource,
    //       xValueMapper: (PiaData data, _) => data.x,
    //       yValueMapper: (PiaData data, _) => data.y,

    //       dataLabelSettings: const DataLabelSettings(
    //         isVisible: true,

    //       ),
    //     ),
    //   ],
    // );
    return Center(
      child: PieChart(
        dataMap: dataMap,
        chartRadius: MediaQuery.of(context).size.width / 5.7,
        legendOptions: const LegendOptions(
          legendPosition: LegendPosition.bottom,
          showLegendsInRow: true,
          legendTextStyle: TextStyle(
            fontFamily: "Siemreap",
          ),
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValuesInPercentage: true,
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesOutside: false,
          decimalPlaces: 0,
        ),
      ),
    );
  }
}
