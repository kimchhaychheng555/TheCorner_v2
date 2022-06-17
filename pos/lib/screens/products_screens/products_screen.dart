import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/widgets/icon_text_button_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/table_page_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductScren extends GetResponsiveView<dynamic> {
  ProductScren({Key? key}) : super(key: key);

  static const String routeName = "/products";

  @override
  Widget builder() {
    ProductController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("products".tr),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.filter_list),
            )
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
                    SizedBox(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          filled: true,
                          isCollapsed: true,
                          hintText: "search".tr,
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
                    const Spacer(),
                    IconTextButtonWidget(
                      onPressed: () => _controller.onAddCategoryPressed(),
                      label: TextWidget(text: "add_category".tr),
                      backgroundColor: primaryColor,
                      icon: const Icon(Icons.add_rounded),
                    ),
                    const SizedBox(width: 10),
                    IconTextButtonWidget(
                      onPressed: () => _controller.onAddProductPressed(),
                      label: TextWidget(text: "add_product".tr),
                      backgroundColor: primaryColor,
                      icon: const Icon(Icons.add_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Expanded(
                  child: TablePageWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
