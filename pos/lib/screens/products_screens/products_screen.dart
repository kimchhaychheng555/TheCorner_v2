import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/icon_text_button_widget.dart';
import 'package:pos/widgets/table_page_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductScren extends GetResponsiveView<dynamic> {
  ProductScren({Key? key}) : super(key: key);

  static const String routeName = "/products";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products".tr),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
        ],
      ),
      body: Container(
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
                  onPressed: () {},
                  label: TextWidget(text: "add_category".tr),
                  backgroundColor: primaryColor,
                  icon: const Icon(Icons.add_rounded),
                ),
                const SizedBox(width: 10),
                IconTextButtonWidget(
                  onPressed: () {},
                  label: TextWidget(text: "add_product".tr),
                  backgroundColor: primaryColor,
                  icon: const Icon(Icons.add_rounded),
                ),
              ],
            ),
            const Expanded(
              child: TablePageWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
