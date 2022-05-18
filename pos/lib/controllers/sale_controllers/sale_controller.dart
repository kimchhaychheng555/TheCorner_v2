import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaleController extends GetxController {
  void onClick() {
    Get.defaultDialog(
        content: Container(
      width: 500,
      height: 300,
      // color: Colors.red,
    ));
  }
}
