import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/expense_controllers/add_expense_controller.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';

class AddExpenseScreen extends GetResponsiveView<dynamic> {
  AddExpenseScreen({Key? key}) : super(key: key);

  static const String routeName = "/add-expense";

  @override
  Widget builder() {
    var _controller = Get.find<AddExpenseController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("product_detail".tr),
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
