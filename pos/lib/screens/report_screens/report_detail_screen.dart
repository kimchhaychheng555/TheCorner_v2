import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/report_controllers/report_detail_controller.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';

class ReportDetailScreen extends GetResponsiveView<dynamic> {
  ReportDetailScreen({Key? key}) : super(key: key);

  static const String routeName = "/reports-detail";

  @override
  Widget builder() {
    ReportDetailController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("report_detail".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: Container(),
        ),
      ),
    );
  }
}
