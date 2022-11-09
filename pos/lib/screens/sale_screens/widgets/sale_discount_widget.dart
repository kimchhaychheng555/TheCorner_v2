import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/sale_controllers/sale_discount_controller.dart';
import 'package:pos/models/product_group_models/product_group_model.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class SaleDiscountWidget extends StatelessWidget {
  final Function(String, String, List<ProductGroupModel>?) onAccept;
  final String? type;
  final String? value;
  const SaleDiscountWidget({
    Key? key,
    required this.onAccept,
    this.type,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SaleDiscountController());
    _controller.discountType(type);
    _controller.discountValueCtrl.text = value ?? "";
    return Obx(
      () => SizedBox(
        width: 500,
        child: Column(
          children: [
            Wrap(
              runSpacing: 10,
              spacing: 10,
              alignment: WrapAlignment.center,
              children: [
                _getProductGroupButton(
                  onPressed: () => _controller.onSelectedAllProductGroup(),
                  productGroup: ProductGroupModel(
                    id: Uuid.NAMESPACE_NIL,
                    group_name: "all".tr,
                  ),
                  isActive: _controller.selectedAllProductGroup,
                ),
                ..._controller.saleCtrl.productGroupList.map(
                  (pg) => _getProductGroupButton(
                    productGroup: pg,
                    onPressed: () => _controller.onProductGroupPressed(pg),
                    isActive: _controller.selectedProductGroup.contains(pg),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  onPressed: () => _controller.onDiscountTypePressed("percent"),
                  backgroundColor: _controller.discountType.value == "percent"
                      ? primaryColor
                      : null,
                  border: _controller.discountType.value == "percent"
                      ? Border.all(color: primaryColor)
                      : Border.all(color: secondaryColor),
                  child: TextWidget(
                    text: "${"percent".tr} (%)",
                    color: _controller.discountType.value == "percent"
                        ? null
                        : primaryColor,
                  ),
                ),
                const SizedBox(width: 10),
                ButtonWidget(
                  onPressed: () => _controller.onDiscountTypePressed("amount"),
                  backgroundColor: _controller.discountType.value == "amount"
                      ? primaryColor
                      : null,
                  border: _controller.discountType.value == "amount"
                      ? Border.all(color: primaryColor)
                      : Border.all(color: secondaryColor),
                  child: TextWidget(
                    text: "${"amount".tr} (\$)",
                    color: _controller.discountType.value == "amount"
                        ? null
                        : primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              width: 300,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: TextField(
                controller: _controller.discountValueCtrl,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  filled: true,
                  isCollapsed: true,
                  hintText: "discount".tr,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ButtonActionWidget(
              confirmText: "yes".tr,
              cancelText: "no".tr,
              onCancelPressed: () => Get.back(),
              onConfirmPressed: () {
                if (_controller.discountType.value == null ||
                    _controller.discountValueCtrl.text == "") {
                  AppAlert.errorAlert(title: "discount_no_value");
                } else {
                  onAccept(
                    _controller.discountType.value ?? "",
                    _controller.discountValueCtrl.text,
                    _controller.selectedProductGroup,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getProductGroupButton(
      {required ProductGroupModel productGroup,
      bool isActive = false,
      Function()? onPressed}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Material(
        color: isActive ? Colors.red : Colors.white,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: TextWidget(
              text: productGroup.group_name ?? "",
              color: isActive ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
