import 'package:flutter/material.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/button_widget.dart';

class SalePaymentWidget extends StatelessWidget {
  const SalePaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            ButtonWidget(),
            ButtonWidget(),
            ButtonWidget(),
          ],
        ),
        const SizedBox(height: 20),
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {},
        ),
      ],
    );
  }
}
