import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pos/models/document_models/document_model.dart';
import 'package:pos/models/start_sale_modesl/start_sale_model.dart';
import 'package:pos/screens/products_screens/products_screen.dart';
import 'package:pos/screens/sale_table_screens/sale_table_screen.dart';
import 'package:pos/screens/setting_screens/setting_screen.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:uuid/uuid.dart';

class SmartHomeController extends GetxController {
  var isStartSale = false.obs;

  @override
  void onInit() {
    _onInitStartSaleChecking();
    super.onInit();
  }

  void _onInitStartSaleChecking() async {
    var _resp = await APIService.get("document/find/start_sale");
    if (_resp.isSuccess) {
      var _doc = DocumentModel.fromJson(jsonDecode(_resp.content));
      var _startSale = StartSaleModel.fromJson(jsonDecode(_doc.value ?? "{}"));
      AppService.currentStartSale = _startSale;
      isStartSale(_startSale.isStart);
    }
  }

  void onStartSalePressed() {
    Get.defaultDialog(
      radius: 5,
      title: "start_sale".tr,
      middleText: "are_you_sure_you_want_to_start_sale".tr,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () => Get.back(),
              child: Center(
                child: SizedBox(
                  height: 40,
                  child: Center(child: Text("no".tr)),
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () => _onStartSaleProcess(),
              child: SizedBox(
                height: 40,
                child: Center(
                  child: Text("yes".tr),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onStartSaleProcess() async {
    var _startSale = StartSaleModel(
      date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      isStart: true,
    );

    var _model = DocumentModel(
        id: Uuid.NAMESPACE_NIL,
        key_name: "start_sale",
        label: "Start Sale",
        value: jsonEncode(_startSale));
    var _json = jsonEncode(_model);
    var _resp = await APIService.post(
      "document/save",
      _json,
    );

    if (_resp.isSuccess) {}
  }

  void onSalePressed() {
    if (isStartSale.value) {
      Get.toNamed(SaleTableScreen.routeName);
    } else {
      AppAlert.errorAlert(
        title: "please_start_sale".tr,
      );
      // Get.snackbar(
      //   "please_start_sale".tr,
      //   "",
      //   backgroundColor: Colors.red,
      //   snackStyle: SnackStyle.FLOATING,
      // );
    }
  }

  void onProductPressed() => Get.toNamed(ProductScren.routeName);
  void onReportPressed() {}
  void onPermissionPressed() {}
  void onBusinessReportPressed() {}
  void onUsersPressed() {}
  void onSettingPressed() => Get.toNamed(SettingScreen.routeName);
}
