import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/screens/sale_table_screens/widgets/sale_table_widget_screen.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SaleTableScreen extends StatefulWidget {
  const SaleTableScreen({
    Key? key,
  }) : super(key: key);

  // final String title;
  static const String routeName = "/sale";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SaleTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sale"),
        ),
        body: _buildGridList());
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
