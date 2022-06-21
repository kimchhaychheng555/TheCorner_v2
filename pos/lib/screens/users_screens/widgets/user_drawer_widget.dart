import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/dropdown_button_form_field_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:get/get.dart';

class ProductDrawerWidget extends StatelessWidget {
  const ProductDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController _controller = Get.find();
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              TextWidget(
                text: "filter".tr,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                  controller: ScrollController(keepScrollOffset: true),
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 20),
                    DropdownButtonFormFieldWidget<String>(
                      label: "status".tr,
                      value: _controller.tempStatus,
                      items: [
                        DropdownMenuItem(
                          child: TextWidget(
                            text: "active".tr,
                            color: textColor,
                          ),
                          value: "active",
                        ),
                        DropdownMenuItem(
                          child: TextWidget(
                            text: "deleted".tr,
                            color: textColor,
                          ),
                          value: "deleted",
                        ),
                      ],
                      onChanged: (_) => _controller.onStatusFilterChanged(_),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormFieldWidget<String>(
                      value: _controller.currentCategoryId.value,
                      label: "category".tr,
                      items: [
                        ..._controller.categoryList.map(
                          (category) => DropdownMenuItem(
                            child: TextWidget(
                              text: category.name ?? "",
                              color: textColor,
                              fontFamily: "Siemreap",
                            ),
                            value: category.id,
                          ),
                        ),
                      ],
                      onChanged: (_) => _controller.onCategoryFilterChanged(_),
                    )
                  ],
                ),
              ),
              ButtonWidget(
                onPressed: () => _controller.onFilterPressed(),
                backgroundColor: infoColor,
                child: TextWidget(text: "filter".tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
