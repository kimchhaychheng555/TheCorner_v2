import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/controllers/report_controllers/report_detail_controller.dart';
import 'package:pos/screens/report_screens/widgets/report_detail_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Invoice".tr,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: HexColor("#1E1E1E"),
                    ),
                    TextWidget(
                      text: "july-06-2022".tr,
                      fontSize: 15,
                      color: HexColor("#1E1E1E"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ReportDetailWidget(),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
