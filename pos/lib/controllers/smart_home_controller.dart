import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/screens/products_screens/products_screen.dart';
import 'package:pos/screens/sale_table_screens/sale_table_screen.dart';
import 'package:pos/services/app_alert.dart';

class SmartHomeController extends GetxController {
  var isStartSale = false.obs;

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
              onPressed: () => _onStartSaleProcess,
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

  void _onStartSaleProcess() {}

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
  void onSettingPressed() {}
}
