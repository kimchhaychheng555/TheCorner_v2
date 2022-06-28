import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/controllers/business_controllers/overview_controller/overview_controller.dart';
import 'package:pos/screens/business_report_screens/overview_screens/widgets/overview_screen_widget.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/text_widget.dart';

class OverviewScreen extends GetResponsiveView<dynamic> {
  OverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/business-overview";

  @override
  Widget builder() {
    OverviewController _controller = Get.find();
    return Scaffold(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
