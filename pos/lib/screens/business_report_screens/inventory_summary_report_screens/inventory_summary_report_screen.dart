import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/business_controllers/inventory_summary_report_controller/inventory_summary_report_controller.dart';
import 'package:pos/screens/business_report_screens/inventory_summary_report_screens/widgets/inventory_filter_widget.dart';
import 'package:pos/screens/business_report_screens/inventory_summary_report_screens/widgets/inventory_summary_report_table_widget.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class InventorySummaryReportScreen extends GetResponsiveView<dynamic> {
  InventorySummaryReportScreen({Key? key}) : super(key: key);

  static String routeName = "/inventory-summary-report";

  @override
  Widget builder() {
    InventorySummaryReportController _controller = Get.find();
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Obx(
      () => Scaffold(
        key: _key,
        endDrawer: const InventoryFilterWidget(),
        appBar: AppBar(
          title: Text("inventory_summary_report".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
          actions: [
            IconButton(
              splashRadius: 30,
              onPressed: () {
                _controller.onLoad();
              },
              icon: const Icon(Icons.refresh_outlined),
            ),
            IconButton(
              splashRadius: 30,
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.filter_list_rounded),
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
                    PopupMenuButton(
                      color: primaryColor,
                      tooltip: "export".tr,
                      onSelected: (item) => _controller.onExportPressed(item),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                          value: "pdf",
                          child: TextWidget(
                            text: 'pdf'.tr,
                            color: Colors.white,
                          ),
                        ),
                        PopupMenuItem<String>(
                          value: "excel",
                          child: TextWidget(
                            text: 'excel'.tr,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: primaryColor,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: TextWidget(text: "export".tr),
                      ),
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
      ),
    );
  }
}
