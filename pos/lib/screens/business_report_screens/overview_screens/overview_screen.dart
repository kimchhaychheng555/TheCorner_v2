import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/business_controllers/overview_controller/overview_controller.dart';
import 'package:pos/screens/business_report_screens/overview_screens/widgets/overview_screen_widget.dart';
import 'package:pos/screens/business_report_screens/overview_screens/widgets/overview_summary_widget.dart';
import 'package:pos/screens/report_screens/report_detail_screen.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/status_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pie_chart/pie_chart.dart' as pie_chart;

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
          actions: [
            Center(
              child: ButtonWidget(
                border: Border.all(
                  color: Colors.black,
                ),
                onPressed: () => _controller.onFilterDatePressed(),
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 10),
                    TextWidget(
                      text: _controller.getDateFilterText,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: SingleChildScrollView(
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
                        title: "total_expense".tr,
                        subtitle: "per_month".tr,
                        total: AppService.currencyFormat(
                            _controller.totalExpense.value),
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
                                Expanded(
                                  child: _controller.maxBarChartValue.value > 0
                                      ? SfCartesianChart(
                                          // Initialize category axis
                                          primaryXAxis: CategoryAxis(),
                                          primaryYAxis: NumericAxis(
                                            minimum: 0,
                                            maximum: _controller
                                                .maxBarChartValue.value,
                                            interval: _controller
                                                .intervalBarChart.value,
                                          ),
                                          tooltipBehavior: _controller.tooltip,
                                          series: [
                                            ColumnSeries<ChartData, String>(
                                              enableTooltip: true,
                                              dataSource:
                                                  _controller.dataBarChart,
                                              xValueMapper:
                                                  (ChartData data, _) => data.x,
                                              yValueMapper:
                                                  (ChartData data, _) => data.y,
                                              name: 'total_amount'.tr,
                                            )
                                          ],
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator(),
                                        ),
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
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextWidget(
                                      text: "top_sale".tr,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    ButtonWidget(
                                      backgroundColor: textColor,
                                      child: Icon(
                                        _controller.showPieChartPercent.value
                                            ? Icons.attach_money_rounded
                                            : Icons.percent_rounded,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        _controller.showPieChartPercent(
                                            !_controller
                                                .showPieChartPercent.value);
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: _controller.dataPieChart.isEmpty
                                      ? Center(
                                          child: TextWidget(
                                            text: "empty".tr,
                                            color: Colors.black,
                                          ),
                                        )
                                      : Center(
                                          child: pie_chart.PieChart(
                                            dataMap:
                                                _controller.getDataPieChart,
                                            chartRadius: Get.width / 5.7,
                                            legendOptions:
                                                const pie_chart.LegendOptions(
                                              legendPosition: pie_chart
                                                  .LegendPosition.bottom,
                                              showLegendsInRow: true,
                                              legendTextStyle: TextStyle(
                                                fontFamily: "Siemreap",
                                              ),
                                            ),
                                            chartValuesOptions:
                                                pie_chart.ChartValuesOptions(
                                              chartValueStyle: const TextStyle(
                                                fontFamily: "Roboto",
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              showChartValuesInPercentage:
                                                  _controller
                                                      .showPieChartPercent
                                                      .value,
                                              showChartValueBackground: true,
                                              showChartValues: true,
                                              showChartValuesOutside: false,
                                              decimalPlaces: 0,
                                            ),
                                          ),
                                        ),
                                ),
                              ],
                            ),
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
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Card(
                                    borderOnForeground: true,
                                    elevation: 0,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ResponsiveDatatable(
                                            reponseScreenSizes: const [
                                              ScreenSize.xs
                                            ],
                                            headers: [
                                              DatatableHeader(
                                                text: "invoice_number".tr,
                                                value: "invoice_number",
                                                show: true,
                                                textAlign: TextAlign.center,
                                                sourceBuilder: (value, row) {
                                                  return TextWidget(
                                                    text: value,
                                                    color: Colors.black,
                                                    textAlign: TextAlign.center,
                                                  );
                                                },
                                              ),
                                              DatatableHeader(
                                                text: "table".tr,
                                                value: "table",
                                                show: true,
                                                textAlign: TextAlign.center,
                                                sourceBuilder: (value, row) {
                                                  return TextWidget(
                                                    text:
                                                        "${"table".tr}: ${value["name"]}",
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    textAlign: TextAlign.center,
                                                  );
                                                },
                                              ),
                                              DatatableHeader(
                                                text: "sub_total".tr,
                                                value: "sub_total",
                                                show: true,
                                                textAlign: TextAlign.center,
                                                sourceBuilder: (value, row) {
                                                  return TextWidget(
                                                    text: AppService
                                                        .currencyFormat(value),
                                                    fontFamily: "Siemreap",
                                                    color: Colors.black,
                                                    textAlign: TextAlign.center,
                                                  );
                                                },
                                              ),
                                              DatatableHeader(
                                                text: "discount".tr,
                                                value: "discount",
                                                show: true,
                                                textAlign: TextAlign.center,
                                                sourceBuilder: (value, row) {
                                                  String _dis = "";
                                                  if (row["discount_type"] ==
                                                      "percent") {
                                                    _dis = "$value %";
                                                  } else {
                                                    _dis = AppService
                                                        .currencyFormat(value);
                                                  }
                                                  return TextWidget(
                                                    text: _dis,
                                                    fontFamily: "Siemreap",
                                                    color: Colors.black,
                                                    textAlign: TextAlign.center,
                                                  );
                                                },
                                              ),
                                              DatatableHeader(
                                                text: "grand_total".tr,
                                                value: "grand_total",
                                                show: true,
                                                textAlign: TextAlign.center,
                                                sourceBuilder: (value, row) {
                                                  return TextWidget(
                                                    text: AppService
                                                        .currencyFormat(value),
                                                    fontFamily: "Siemreap",
                                                    color: Colors.black,
                                                    textAlign: TextAlign.center,
                                                  );
                                                },
                                              ),
                                              DatatableHeader(
                                                text: "sale_date".tr,
                                                value: "sale_date",
                                                show: true,
                                                textAlign: TextAlign.center,
                                                sourceBuilder: (value, row) {
                                                  return TextWidget(
                                                    text: (value),
                                                    fontFamily: "Siemreap",
                                                    color: Colors.black,
                                                    textAlign: TextAlign.center,
                                                  );
                                                },
                                              ),
                                              DatatableHeader(
                                                text: "payment_status".tr,
                                                value: "is_paid",
                                                show: true,
                                                textAlign: TextAlign.center,
                                                sourceBuilder: (value, row) {
                                                  return value
                                                      ? StatusWidget(
                                                          backgroundColor:
                                                              successColor,
                                                          child: TextWidget(
                                                            text: "paid".tr,
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      : StatusWidget(
                                                          backgroundColor:
                                                              warningColor,
                                                          child: TextWidget(
                                                            text: "unpaid".tr,
                                                            color: Colors.white,
                                                          ),
                                                        );
                                                },
                                              ),
                                            ],
                                            footers: [
                                              if (_controller
                                                  .dataSource.isEmpty)
                                                Expanded(
                                                  child: Container(
                                                    color: HexColor("#ededed"),
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 15),
                                                    child: TextWidget(
                                                      text:
                                                          "no_data_available_in_table"
                                                              .tr,
                                                      color: textColor,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                            source: _controller.dataSource,
                                            onTabRow: (_) {
                                              Get.toNamed(
                                                  ReportDetailScreen.routeName,
                                                  arguments: _);
                                            },
                                            expanded: [
                                              ..._controller.dataSource
                                                  .map((e) => false),
                                            ],
                                            selecteds: _controller.dataSource,
                                            autoHeight: false,
                                            onSort: (value) {
                                              print(value);
                                            },
                                            isExpandRows: false,
                                            sortAscending: false,
                                            sortColumn: "",
                                            isLoading: false,
                                            headerDecoration:
                                                const BoxDecoration(
                                              color: Colors.white,
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey)),
                                            ),
                                            selectedDecoration:
                                                const BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.grey)),
                                              color: Colors.green,
                                            ),
                                            headerTextStyle: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            rowTextStyle: const TextStyle(
                                                color: Colors.black),
                                            selectedTextStyle: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
                                //
                                ..._controller.getSummaryData.map(
                                  (s) => OverviewSummaryWidget(
                                    name: s.name,
                                    value: s.value,
                                  ),
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
      ),
    );
  }
}
