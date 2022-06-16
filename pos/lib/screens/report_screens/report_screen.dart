import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/screens/report_screens/data_page.dart';
import 'package:pos/widgets/text_widget.dart';

class ReportScreen extends GetResponsiveView<dynamic> {
  ReportScreen({Key? key}) : super(key: key);

  static String routeName = "/reports";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "report".tr,
        ),
      ),
      body: const DataPage(),
    );
  }
}
