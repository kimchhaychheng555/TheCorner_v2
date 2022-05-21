import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/sale_controllers/sale_controller.dart';

class SaleScreen extends GetResponsiveView<dynamic> {
  SaleScreen({Key? key}) : super(key: key);

  static const String routeName = "/sale";

  @override
  Widget builder() {
    SaleController _controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("sale".tr),
      ),
    );
  }
}
