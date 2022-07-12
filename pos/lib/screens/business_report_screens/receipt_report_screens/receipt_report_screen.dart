import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/business_controllers/receipt_report_controller/receipt_report_controller.dart';
import 'package:pos/screens/report_screens/widgets/report_table_widget.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ReceiptReportScreen extends GetResponsiveView<dynamic> {
  ReceiptReportScreen({Key? key}) : super(key: key);

  static String routeName = "/receipt-report";

  @override
  Widget builder() {
    ReceiptReportController _controller = Get.find();
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Obx(
      () => Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text("report".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
          actions: [
            IconButton(
              onPressed: () => _controller.onLoad(),
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 500,
                      child: ButtonWidget(
                        onPressed: () => _controller.onFilterDatePressed(
                          context: Get.context!,
                        ),
                        child: const TextWidget(text: "Pressed"),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 300,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller.keywordCtrl,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 20,
                                ),
                                filled: true,
                                isCollapsed: true,
                                hintText: "search".tr,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onSubmitted: (_) => _controller.onKeywordSearch(),
                            ),
                          ),
                          const SizedBox(width: 5),
                          ButtonPaginationWidget(
                            onPressed: () => _controller.onKeywordSearch(),
                            backgroundColor: primaryColor,
                            child: const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Expanded(
                  child: ReportTableWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
