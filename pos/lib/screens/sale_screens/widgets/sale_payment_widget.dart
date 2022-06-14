import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/sale_controllers/sale_payment_controller.dart';
import 'package:pos/models/payment_method_models/payment_method_model.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class SalePaymentWidget extends StatelessWidget {
  final Function(PaymentMethodModel)? onAcceptPressed;
  const SalePaymentWidget({
    Key? key,
    this.onAcceptPressed,
  }) : super(key: key);

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
                  border: Border.all(color: secondaryColor),
                  backgroundColor:
                      _controller.paymentMethod.value?.id == paymentMethod.id
                          ? primaryColor
                          : null,
                  onPressed: () =>
                      _controller.onPaymentMethodPressed(paymentMethod),
                  child: TextWidget(
                    text: paymentMethod.payment_method_name ?? "",
                    color:
                        _controller.paymentMethod.value?.id == paymentMethod.id
                            ? Colors.white
                            : textColor,
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
            onConfirmPressed: () {
              if (_controller.paymentMethod.value == null) {
                AppAlert.errorAlert(title: "please_choose_payment".tr);
                return;
              }
              onAcceptPressed!(_controller.paymentMethod.value!);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
