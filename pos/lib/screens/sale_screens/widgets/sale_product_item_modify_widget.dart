import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/sale_controllers/sale_product_item_modify_controller.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleProductItemModifyWidget extends StatelessWidget {
  final SaleProductModel sp;
  final Function(String, String, String?, String) onAccept;
  final Function()? onFreePressed;
  final Function()? onRemoveFreePressed;
  final Function()? onRemoveDiscountPressed;
  const SaleProductItemModifyWidget({
    Key? key,
    required this.sp,
    required this.onAccept,
    this.onFreePressed,
    this.onRemoveFreePressed,
    this.onRemoveDiscountPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(SaleProductItemModifyController());
    _controller.onControllerInit(sp);

    return Obx(
      () => Column(
        children: [
          Get.width < 1000
              ? Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Center(
                            child: TextFormField(
                              controller: _controller.quantityCtrl,
                              decoration: InputDecoration(
                                isDense: true,
                                label: TextWidget(
                                  text: "quantity".tr,
                                  color: textColor,
                                ),
                                hintText: "quantity".tr,
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
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _controller.priceCtrl,
                            decoration: InputDecoration(
                              isDense: true,
                              label: TextWidget(
                                text: "price".tr,
                                color: textColor,
                              ),
                              hintText: "price".tr,
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
                          ),
                          const SizedBox(height: 20),
                          Visibility(
                            visible: sp.is_free == false,
                            child: ElevatedButton(
                              onPressed: onFreePressed,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        successColor),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text("free".tr),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: sp.is_free,
                            child: ElevatedButton(
                              onPressed: onRemoveFreePressed,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        errorColor),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text("remove_free".tr),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonWidget(
                                onPressed: () => _controller
                                    .onDiscountTypePressed("percent"),
                                backgroundColor:
                                    _controller.discountType.value == "percent"
                                        ? primaryColor
                                        : null,
                                border:
                                    _controller.discountType.value == "percent"
                                        ? Border.all(color: primaryColor)
                                        : Border.all(color: secondaryColor),
                                child: TextWidget(
                                  text: "${"percent".tr} (%)",
                                  color: _controller.discountType.value ==
                                          "percent"
                                      ? null
                                      : primaryColor,
                                ),
                              ),
                              const SizedBox(width: 20),
                              ButtonWidget(
                                onPressed: () =>
                                    _controller.onDiscountTypePressed("amount"),
                                backgroundColor:
                                    _controller.discountType.value == "amount"
                                        ? primaryColor
                                        : null,
                                border:
                                    _controller.discountType.value == "amount"
                                        ? Border.all(color: primaryColor)
                                        : Border.all(color: secondaryColor),
                                child: TextWidget(
                                  text: "${"amount".tr} (\$)",
                                  color:
                                      _controller.discountType.value == "amount"
                                          ? null
                                          : primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          Container(
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
                            ),
                          ),
                          const SizedBox(height: 22),
                          ElevatedButton(
                            onPressed: onRemoveDiscountPressed,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(errorColor),
                            ),
                            child: Center(
                              child: SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text("remove_discount".tr),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Center(
                            child: TextFormField(
                              controller: _controller.quantityCtrl,
                              decoration: InputDecoration(
                                isDense: true,
                                label: TextWidget(
                                  text: "quantity".tr,
                                  color: textColor,
                                ),
                                hintText: "quantity".tr,
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
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: _controller.priceCtrl,
                            decoration: InputDecoration(
                              isDense: true,
                              label: TextWidget(
                                text: "price".tr,
                                color: textColor,
                              ),
                              hintText: "price".tr,
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
                          ),
                          const SizedBox(height: 20),
                          Visibility(
                            visible: sp.is_free == false,
                            child: ElevatedButton(
                              onPressed: onFreePressed,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        successColor),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text("free".tr),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: sp.is_free,
                            child: ElevatedButton(
                              onPressed: onRemoveFreePressed,
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        errorColor),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 40,
                                  child: Center(
                                    child: Text("remove_free".tr),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 300,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonWidget(
                                onPressed: () => _controller
                                    .onDiscountTypePressed("percent"),
                                backgroundColor:
                                    _controller.discountType.value == "percent"
                                        ? primaryColor
                                        : null,
                                border:
                                    _controller.discountType.value == "percent"
                                        ? Border.all(color: primaryColor)
                                        : Border.all(color: secondaryColor),
                                child: TextWidget(
                                  text: "${"percent".tr} (%)",
                                  color: _controller.discountType.value ==
                                          "percent"
                                      ? null
                                      : primaryColor,
                                ),
                              ),
                              const SizedBox(width: 20),
                              ButtonWidget(
                                onPressed: () =>
                                    _controller.onDiscountTypePressed("amount"),
                                backgroundColor:
                                    _controller.discountType.value == "amount"
                                        ? primaryColor
                                        : null,
                                border:
                                    _controller.discountType.value == "amount"
                                        ? Border.all(color: primaryColor)
                                        : Border.all(color: secondaryColor),
                                child: TextWidget(
                                  text: "${"amount".tr} (\$)",
                                  color:
                                      _controller.discountType.value == "amount"
                                          ? null
                                          : primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          Container(
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
                            ),
                          ),
                          const SizedBox(height: 22),
                          ElevatedButton(
                            onPressed: onRemoveDiscountPressed,
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(errorColor),
                            ),
                            child: Center(
                              child: SizedBox(
                                height: 40,
                                child: Center(
                                  child: Text("remove_discount".tr),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 20),
          ButtonActionWidget(
            confirmText: "yes".tr,
            cancelText: "no".tr,
            onCancelPressed: () => Get.back(),
            onConfirmPressed: () {
              onAccept(
                _controller.quantityCtrl.text,
                _controller.priceCtrl.text,
                _controller.discountType.value,
                _controller.discountValueCtrl.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
