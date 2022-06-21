import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/screens/business_report_screens/overview_screens/overview_screen_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class OverviewScreen extends GetResponsiveView<dynamic> {
  OverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/business-overview";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text("business_overview".tr),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  OverviewScreenWidget(
                    title: "Total Sale",
                    subtitle: "per month",
                    total: "1200",
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
                    title: "Total Order",
                    subtitle: "per month",
                    total: "1299",
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
                    title: "Total Revenue",
                    subtitle: "per month",
                    total: "1299",
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
                    title: "Total Profit",
                    subtitle: "per month",
                    total: "1220",
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
            )
          ],
        ),
      ),
    );
  }
}
