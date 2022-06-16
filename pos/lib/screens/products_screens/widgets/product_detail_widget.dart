import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/product_controllers/product_detail_controller.dart';
import 'package:get/get.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(ProductDetailController());
    return Obx(
      () => SizedBox(
        width: 1000,
        height: MediaQuery.of(context).size.height - 125,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: LoadingOverlayWidget(
                isLoading: _controller.isLoading.value,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      constraints: const BoxConstraints(maxWidth: 600),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                border: Border.all(color: Colors.black),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      "${AppService.baseUrl}uploads/noimage.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ButtonWidget(
                                  onPressed: () =>
                                      _controller.onUploadPressed(),
                                  child: TextWidget(text: "upload".tr),
                                  backgroundColor: infoColor,
                                ),
                                const SizedBox(width: 10),
                                ButtonWidget(
                                  onPressed: () =>
                                      _controller.onClearImagePressed(),
                                  child: TextWidget(text: "clear".tr),
                                  backgroundColor: errorColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _textFormFeild(
                              label: "product_name".tr,
                            ),
                            const SizedBox(height: 10),
                            _textFormFeild(
                              label: "cost".tr,
                            ),
                            const SizedBox(height: 10),
                            _textFormFeild(
                              label: "price".tr,
                            ),
                            const SizedBox(height: 10),
                            _dropdownButtonFormField<String>(
                              items: [],
                              onChanged: (_) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormFeild({
    TextEditingController? controller,
    String? label,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        label: TextWidget(
          text: label ?? "",
          color: textColor,
        ),
        hintText: label,
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
    );
  }

  Widget _dropdownButtonFormField<T>({
    String? label,
    T? value,
    required List<DropdownMenuItem<T>> items,
    required Function(T?)? onChanged,
  }) {
    return DropdownButtonFormField<T>(
      items: items,
      onChanged: onChanged,
      value: value,
      focusColor: Colors.transparent,
      decoration: InputDecoration(
        isDense: true,
        label: TextWidget(
          text: label ?? "",
          color: textColor,
        ),
        hintText: label,
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
    );
  }
}
