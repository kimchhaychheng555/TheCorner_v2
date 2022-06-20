import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverviewScreen extends GetResponsiveView<dynamic> {
  OverviewScreen({Key? key}) : super(key: key);
  static const String routeName = "/business-overview";

  @override
  Widget builder() {
    return Scaffold(
        appBar: AppBar(
      title: Text("business_overview".tr),
    ));
  }
}
