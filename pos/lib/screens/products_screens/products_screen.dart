import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/icon_text_button_widget.dart';
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
      body: Column(
        children: [
          Row(
            children: [
              IconTextButtonWidget(
                onPressed: () {},
                label: TextWidget(text: "add_category".tr),
                backgroundColor: primaryColor,
                icon: const Icon(Icons.add_rounded),
              ),
              IconTextButtonWidget(
                onPressed: () {},
                label: TextWidget(text: "add_product".tr),
                backgroundColor: primaryColor,
                icon: const Icon(Icons.add_rounded),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: const [],
            ),
          ),
        ],
      ),
    );
  }
}
