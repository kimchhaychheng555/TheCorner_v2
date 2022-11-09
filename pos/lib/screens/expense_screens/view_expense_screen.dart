import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/expense_controllers/view_expense_controller.dart';
import 'package:pos/screens/expense_screens/view_expense_table_page_widget.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ViewExpenseScreen extends GetResponsiveView<dynamic> {
  ViewExpenseScreen({Key? key}) : super(key: key);

  static const String routeName = "/view-expense";

  @override
  Widget builder() {
    var _controller = Get.find<ViewExpenseController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("view_expense".tr),
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
                    ButtonWidget(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      onPressed: () => _controller.onFilterDatePressed(),
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today_rounded),
                          const SizedBox(width: 10),
                          TextWidget(
                            text: _controller.getDateFilterText,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Expanded(
                  child: ViewExpenseTablePageWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
