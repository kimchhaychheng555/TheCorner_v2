import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/screens/sale_table_screens/widgets/sale_table_widget_screen.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SaleTableScreen extends GetResponsiveView<dynamic> {
  SaleTableScreen({Key? key}) : super(key: key);

  static const String routeName = "/tale";

  @override
  Widget builder() {
    return Scaffold(
        appBar: AppBar(
          title: Text("table".tr),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: HexColor("#F16023"),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            spreadRadius: 0.2,
                            offset: const Offset(0, 2),
                            color: HexColor("#898989").withOpacity(0.2),
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          size: 20,
                          color: HexColor("#ffffff"),
                        ),
                        const SizedBox(width: 5),
                        TextWidget(
                          text: "Add Table",
                          color: HexColor("#ffffff"),
                          fontSize: 15,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: _buildGridList(),
            ),
          ],
        ));
  }

  Widget _buildGridList() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child:
          ResponsiveGridList(desiredItemWidth: 100, minSpacing: 10, children: [
        SaleTableWidgetScreen(
          title: "1",
        ),
        SaleTableWidgetScreen(
          title: "2",
        ),
        SaleTableWidgetScreen(
          title: "3",
        ),
        SaleTableWidgetScreen(
          title: "4",
        ),
        SaleTableWidgetScreen(
          title: "5",
        ),
        SaleTableWidgetScreen(
          title: "6",
        ),
        SaleTableWidgetScreen(
          title: "7",
        ),
        SaleTableWidgetScreen(
          title: "8",
        ),
        SaleTableWidgetScreen(
          title: "9",
        ),
        SaleTableWidgetScreen(
          title: "10",
        ),
      ]),
    );
  }
}
