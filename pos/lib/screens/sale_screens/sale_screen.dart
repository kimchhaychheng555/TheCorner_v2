import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/sale_controllers/sale_controller.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleScreen extends GetResponsiveView<dynamic> {
  SaleScreen({Key? key}) : super(key: key);

  static const String routeName = "/sale";

  @override
  Widget builder() {
    SaleController _controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "sale".tr,
        ),
      ),
    );
  }
}
