import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/business_controllers/inventory_summary_report_controller/inventory_summary_report_controller.dart';
import 'package:pos/screens/business_report_screens/inventory_summary_report_screens/widgets/inventory_summary_report_table_widget.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/icon_text_button_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class InventorySummaryReportScreen extends GetResponsiveView<dynamic> {
  InventorySummaryReportScreen({Key? key}) : super(key: key);

  static String routeName = "/inventory-summary-report";

  @override
  Widget builder() {
    InventorySummaryReportController _controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("inventory_summary_report".tr),
      ),
      body: LoadingOverlayWidget(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
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
                  const Spacer(),
                  IconTextButtonWidget(
                    onPressed: () => _controller.onExportPressed(),
                    label: TextWidget(text: "export_to_excel".tr),
                    backgroundColor: primaryColor,
                    icon: const Icon(Icons.file_download_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Expanded(
                child: InventorySummaryReportTablewidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
