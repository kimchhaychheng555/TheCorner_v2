import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/sale_controllers/sale_payment_controller.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class SalePaymentWidget extends StatelessWidget {
  const SalePaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SalePaymentController());
    return Obx(
      () => Column(
        children: [
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ..._controller.paymentMethodList.map(
                (paymentMethod) => ButtonWidget(
                  onPressed: () =>
                      _controller.onPaymentMethodPressed(paymentMethod),
                  child: TextWidget(
                    text: paymentMethod.payment_method_name ?? "",
                    color: textColor,
                  ),
                ),
              )
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
      ),
    );
  }
}
