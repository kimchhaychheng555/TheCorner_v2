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
    print("${Get.width}");
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
        constraints: BoxConstraints(maxWidth: 1000),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Container(
                    color: Colors.blue,
                    width: 650,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
