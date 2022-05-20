import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleTableScreen extends GetResponsiveView<dynamic> {
  SaleTableScreen({Key? key}) : super(key: key);

  static const String routeName = "/tale";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text("table".tr),
      ),
      body: Container(),
    );
  }
}
