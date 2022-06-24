import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/controllers/business_controllers/overview_chart_controller.dart';
import 'package:pos/controllers/business_controllers/overview_controller/overview_controller.dart';
import 'package:pos/screens/business_report_screens/overview_screens/widgets/overview_screen_widget.dart';
import 'package:pos/screens/business_report_screens/overview_screens/widgets/overview_table_widets.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OverviewScreen extends GetResponsiveView<dynamic> {
  OverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/business-overview";

  @override
  Widget builder() {
    OverviewController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("business_overview".tr),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    OverviewScreenWidget(
                      title: "total_sale".tr,
                      subtitle: "per_month".tr,
                      total: "${_controller.totalSale.value}",
                      totalColor: HexColor("#50B402"),
                      backgroundColor: HexColor("#50B402"),
                      icon: Icon(
                        Icons.sell_sharp,
                        size: 40,
                        color: HexColor("#FFFFFF"),
                      ),
                      shadowColor: HexColor("#50B402").withOpacity(0.1),
                      borderColor: HexColor("#50B402"),
                    ),
                    const SizedBox(width: 20),
                    OverviewScreenWidget(
                      title: "total_order".tr,
                      subtitle: "per_month".tr,
                      total: "${_controller.totalOrder.value}",
                      totalColor: HexColor("#FEA026"),
                      backgroundColor: HexColor("#FEA026"),
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 40,
                        color: HexColor("#FFFFFF"),
                      ),
                      borderColor: HexColor("FEA026"),
                      shadowColor: HexColor("#FEA026").withOpacity(0.1),
                    ),
                    const SizedBox(width: 20),
                    OverviewScreenWidget(
                      title: "total_revenue".tr,
                      subtitle: "per_month".tr,
                      total: AppService.currencyFormat(
                          _controller.totalRevenue.value),
                      totalColor: HexColor("#7E46F1"),
                      backgroundColor: HexColor("#7E46F1"),
                      icon: Icon(
                        Icons.insights,
                        size: 40,
                        color: HexColor("#FFFFFF"),
                      ),
                      borderColor: HexColor("#7E46F1"),
                      shadowColor: HexColor("#7E46F1").withOpacity(0.1),
                    ),
                    const SizedBox(width: 20),
                    OverviewScreenWidget(
                      title: "total_profit".tr,
                      subtitle: "per_month".tr,
                      total: AppService.currencyFormat(
                          _controller.totalProfit.value),
                      totalColor: HexColor("#007CDF"),
                      backgroundColor: HexColor("#007CDF"),
                      borderColor: HexColor("#007CDF"),
                      shadowColor: HexColor("#007CDF").withOpacity(0.1),
                      icon: Icon(
                        Icons.payment,
                        size: 40,
                        color: HexColor("#FFFFFF"),
                      ),
                    ),
                  ],
                ),
              ),
              //Chart
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 200,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: const Offset(0, 2),
                                color: HexColor("#353941").withOpacity(0.2),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: "sales_overview".tr,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  const Icon(Icons.more_horiz),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  TextWidget(
                                    text: "total_amount_per_month".tr,
                                    fontSize: 17,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              SfCartesianChart(
                                // Initialize category axis

                                primaryXAxis: CategoryAxis(),
                                primaryYAxis: NumericAxis(
                                    minimum: 0, maximum: 100, interval: 10),
                                tooltipBehavior: _controller.tooltip,
                                // series: <ColumnSeries>[
                                //   ColumnSeries<ChartData, String>(
                                //       dataSource: _controller.data,
                                //       xValueMapper: (ChartData data, _) =>
                                //           data.x,
                                //       yValueMapper: (ChartData data, _) =>
                                //           data.y),
                                // ]
                                series: <ChartSeries<ChartData, String>>[
                                  ColumnSeries<ChartData, String>(
                                    dataSource: _controller.data,
                                    xValueMapper: (ChartData data, _) => data.x,
                                    yValueMapper: (ChartData data, _) => data.y,
                                    name: 'total_amount'.tr,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                              color: HexColor("#353941").withOpacity(0.2),
                            )
                          ],
                        ),
                        child: SfCircularChart(
                          legend: Legend(
                            iconBorderWidth: 10,
                            isVisible: true,

                            // toggleSeriesVisibility: true,
                            // iconWidth: 30,
                          ),
                          // Enables the tooltip for all the series in chart
                          tooltipBehavior: _controller.tooltipBehavior,
                          series: [
                            PieSeries<PiaData, String>(
                              enableTooltip: true,
                              dataSource: _controller.dataSource,
                              xValueMapper: (PiaData data, _) => data.x,
                              yValueMapper: (PiaData data, _) => data.y,
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //table
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 200,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2,
                                spreadRadius: 2,
                                offset: const Offset(0, 2),
                                color: HexColor("#353941").withOpacity(0.2),
                              )
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: "today_invoice".tr,
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  const Icon(Icons.more_horiz),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Expanded(
                                child: OverviewTableWidget(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2,
                              spreadRadius: 2,
                              offset: const Offset(0, 2),
                              color: HexColor("#353941").withOpacity(0.2),
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              TextWidget(
                                text: "summary".tr,
                                fontFamily: 'Siemreap',
                                fontSize: 20,
                                color: HexColor("#104984"),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "quantity".tr,
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#104984"),
                                    ),
                                    TextWidget(
                                      text: "30",
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#D98D0D"),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: HexColor("#92A5BA"),
                                height: 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "invoice".tr,
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#104984"),
                                    ),
                                    TextWidget(
                                      text: "30",
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#D98D0D"),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              Divider(
                                color: HexColor("#92A5BA"),
                                height: 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "paid".tr,
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#104984"),
                                    ),
                                    TextWidget(
                                      text: "30",
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#D98D0D"),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              Divider(
                                color: HexColor("#92A5BA"),
                                height: 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "unpaid".tr,
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#104984"),
                                    ),
                                    TextWidget(
                                      text: "30",
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#D98D0D"),
                                    ),
                                  ],
                                ),
                              ),
                              //
                              Divider(
                                color: HexColor("#92A5BA"),
                                height: 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "table".tr,
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#104984"),
                                    ),
                                    TextWidget(
                                      text: "30",
                                      fontFamily: 'Siemreap',
                                      fontSize: 17,
                                      color: HexColor("#D98D0D"),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: HexColor("#92A5BA"),
                                height: 0.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
