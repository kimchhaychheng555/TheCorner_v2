import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/report_controllers/report_detail_controller.dart';

class ReportDetailScreen extends GetResponsiveView<dynamic> {
  ReportDetailScreen({Key? key}) : super(key: key);

  static const String routeName = "/reports-detail";

  @override
  Widget builder() {
    ReportDetailController _controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("report_detail".tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_backspace),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints(maxWidth: 1000, minWidth: 650),
        color: Colors.blueAccent,
        child: Column(
          children: [
            Container(
              width: 600,
              height: 400,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
