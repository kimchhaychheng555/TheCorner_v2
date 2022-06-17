import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/product_controllers/product_detail_controller.dart';
import 'package:get/get.dart';
import 'package:pos/services/app_service.dart';
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
                onPressed: () => _controller.onEditablePressed(),
                icon: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: Center(
            child: Container(
              height: double.infinity,
              constraints: const BoxConstraints(maxWidth: 600),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Visibility(
                      visible: _controller.isEditable.value,
                      child: TextWidget(
                        text: _controller.titleScreen.value.tr,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CachedNetworkImage(
                      imageUrl:
                          "${AppService.baseUrl}uploads/${_controller.productDetail.value.image}",
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: CachedNetworkImageProvider(
                          "${AppService.baseUrl}uploads/${_controller.productDetail.value.image}",
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        maxRadius: 60,
                        backgroundImage: AssetImage(
                          "assets/images/noimage.png",
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: _controller.isEditable.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ButtonWidget(
                            onPressed: () => _controller.onUploadPressed(),
                            child: TextWidget(text: "upload".tr),
                            backgroundColor: infoColor,
                          ),
                          const SizedBox(width: 10),
                          ButtonWidget(
                            onPressed: () => _controller.onClearImagePressed(),
                            child: TextWidget(text: "clear".tr),
                            backgroundColor: errorColor,
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
                            value: _controller.productDetail.value.stockable,
                            onChanged: (_) => _controller.onStockableChanged(_),
                          ),
                        ),
                        TextWidget(
                          text: "use_stock".tr,
                          color: textColor,
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextFormFieldWidget(
                      readOnly: !_controller.isEditable.value,
                      label: "product_name".tr,
                      value: _controller.productDetail.value.name,
                      fontFamily: "Siemreap",
                    ),
                    const SizedBox(height: 10),
                    TextFormFieldWidget(
                      readOnly: !_controller.isEditable.value,
                      label: "cost".tr,
                      value: "${_controller.productDetail.value.cost ?? 0}",
                    ),
                    const SizedBox(height: 10),
                    TextFormFieldWidget(
                      readOnly: !_controller.isEditable.value,
                      label: "price".tr,
                      value: "${_controller.productDetail.value.price ?? 0}",
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
                      onChanged: (_) {
                        // print(_?.name);
                      },
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
