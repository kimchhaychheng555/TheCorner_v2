import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/sale_controllers/sale_table_controller.dart';

class SaleTableAddTableWidget extends StatelessWidget {
  final Function()? onSubmited;
  const SaleTableAddTableWidget({
    Key? key,
    this.onSubmited,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SaleTableController _controller = Get.find();
    return Column(
      children: [
        TextField(
          autofocus: true,
          controller: _controller.addTableText,
          onSubmitted: (_) => onSubmited!(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            filled: true,
            isCollapsed: true,
            hintText: "table_name".tr,
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
      ],
    );
  }
}
