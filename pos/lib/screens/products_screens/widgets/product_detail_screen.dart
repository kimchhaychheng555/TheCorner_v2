import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/product_controllers/product_detail_controller.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/dropdown_button_form_field_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_form_field_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductDetailScreen extends GetResponsiveView<dynamic> {
  ProductDetailScreen({Key? key}) : super(key: key);

  static const String routeName = "/products-detail";

  @override
  Widget builder() {
    ProductDetailController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("product_detail".tr),
          actions: [
            Visibility(
              visible: !(_controller.titleScreen.value == "add_product"),
              child: IconButton(
                tooltip: "edit".tr,
                onPressed: () => _controller.onEditablePressed(),
                icon: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    Visibility(
                      visible: _controller.isEditable.value,
                      child: TextWidget(
                        text: _controller.titleScreen.value.tr,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _controller.getImageWidget,
                    const SizedBox(height: 10),
                    Visibility(
                      visible: _controller.isEditable.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonWidget(
                            onPressed: () => _controller.onClearImagePressed(),
                            child: TextWidget(text: "clear".tr),
                            backgroundColor: errorColor,
                          ),
                          const SizedBox(width: 10),
                          ButtonWidget(
                            onPressed: () => _controller.onUploadPressed(),
                            child: TextWidget(text: "upload".tr),
                            backgroundColor: infoColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IgnorePointer(
                          ignoring: !_controller.isEditable.value,
                          child: Checkbox(
                            value:
                                _controller.tempProductDetail.value.stockable,
                            onChanged: (_) => _controller.onStockableChanged(_),
                          ),
                        ),
                        TextWidget(
                          text: "use_stock".tr,
                          color: textColor,
                        )
                      ],
                    ),
                    if (_controller.tempProductDetail.value.stockable == true)
                      const SizedBox(height: 10),
                    if (_controller.tempProductDetail.value.stockable == true)
                      TextFormFieldWidget(
                        controller: _controller.minQuantityCtrl,
                        keyboardType: TextInputType.number,
                        isNumberic: true,
                        readOnly: !_controller.isEditable.value,
                        label: "min_quantity".tr,
                      ),
                    const SizedBox(height: 10),
                    TextFormFieldWidget(
                      controller: _controller.productNameCtrl,
                      readOnly: !_controller.isEditable.value,
                      label: "product_name".tr,
                      fontFamily: "Siemreap",
                    ),
                    const SizedBox(height: 10),
                    TextFormFieldWidget(
                      controller: _controller.costCtrl,
                      keyboardType: TextInputType.number,
                      isNumberic: true,
                      readOnly: !_controller.isEditable.value,
                      label: "cost".tr,
                    ),
                    const SizedBox(height: 10),
                    TextFormFieldWidget(
                      controller: _controller.priceCtrl,
                      keyboardType: TextInputType.number,
                      readOnly: !_controller.isEditable.value,
                      label: "price".tr,
                      isNumberic: true,
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormFieldWidget<String>(
                      readOnly: !_controller.isEditable.value,
                      value: _controller.productDetail.value.category?.id,
                      items: [
                        ..._controller.categoryList.map(
                          (category) => DropdownMenuItem(
                            value: category.id,
                            child: TextWidget(
                              text: category.name ?? "",
                              color: textColor,
                              fontFamily: "Siemreap",
                            ),
                          ),
                        ),
                      ],
                      label: "category".tr,
                      onChanged: (_) => _controller.onCategoryValueChanged(_),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormFieldWidget<String>(
                      readOnly: !_controller.isEditable.value,
                      value: _controller.productDetail.value.product_group_id,
                      items: [
                        ..._controller.productGroupList.map(
                          (pg) => DropdownMenuItem(
                            value: pg.id,
                            child: TextWidget(
                              text: pg.group_name ?? "",
                              color: textColor,
                              fontFamily: "Siemreap",
                            ),
                          ),
                        ),
                      ],
                      label: "product_group".tr,
                      onChanged: (_) =>
                          _controller.onProductGroupValueChanged(_),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: _controller.isEditable.value,
                      child: ButtonActionWidget(
                        cancelText: "cancel".tr,
                        confirmText: "save".tr,
                        onCancelPressed: () =>
                            _controller.onCancelProductDetail(),
                        onConfirmPressed: () =>
                            _controller.onSaveProductDetail(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
