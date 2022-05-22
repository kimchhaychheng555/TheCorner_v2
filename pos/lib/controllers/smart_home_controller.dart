import 'dart:convert';

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
import 'package:pos/widgets/button_action_widget.dart';
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
    } else {
      AppService.currentStartSale =
          StartSaleModel(date: DateFormat("yyyy-MM-dd").format(DateTime.now()));
    }
  }

  void onStartSalePressed() async {
    Get.defaultDialog(
      radius: 5,
      title: "start_sale".tr,
      middleText: "are_you_sure_you_want_to_start_sale".tr,
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => AppService.back(),
          onConfirmPressed: () {
            _onStartSaleProcess();
            AppService.back();
          },
        ),
      ],
    );
  }

  void _onStartSaleProcess() async {
    var _startSale = AppService.currentStartSale;
    _startSale?.isStart = true;

    var _model = DocumentModel(
      id: Uuid.NAMESPACE_NIL,
      key_name: "start_sale",
      label: "Start Sale",
      value: jsonEncode(_startSale),
    );

    var _json = jsonEncode(_model);
    var _resp = await APIService.post(
      "document/save",
      _json,
    );

    if (_resp.isSuccess) {
      var _doc = DocumentModel.fromJson(jsonDecode(_resp.content));
      var _ss = StartSaleModel.fromJson(jsonDecode(_doc.value ?? "{}"));
      AppService.currentStartSale = _ss;
      isStartSale(AppService.currentStartSale?.isStart);
      //
      AppAlert.successAlert(title: "start_sale_success".tr);
    }
  }

  void onSalePressed() {
    if (isStartSale.value) {
      Get.toNamed(SaleTableScreen.routeName);
    } else {
      AppAlert.errorAlert(
        title: "please_start_sale".tr,
      );
    }
  }

  void onStopSalePressed() {
    Get.defaultDialog(
      radius: 5,
      title: "stop_sale".tr,
      middleText: "are_you_sure_you_want_to_stop_sale".tr,
      actions: [
        ButtonActionWidget(
          onCancelPressed: () => AppService.back(),
          onConfirmPressed: () {
            _onStopSaleProcess();
            AppService.back();
          },
          confirmText: "yes".tr,
          cancelText: "no".tr,
        ),
      ],
    );
  }

  void _onStopSaleProcess() async {
    var _startSale = AppService.currentStartSale;
    _startSale?.isStart = false;
    var _model = DocumentModel(
      id: Uuid.NAMESPACE_NIL,
      key_name: "start_sale",
      label: "Start Sale",
      value: jsonEncode(_startSale),
    );

    var _json = jsonEncode(_model);
    var _resp = await APIService.post(
      "document/save",
      _json,
    );

    if (_resp.isSuccess) {
      var _doc = DocumentModel.fromJson(jsonDecode(_resp.content));
      var _ss = StartSaleModel.fromJson(jsonDecode(_doc.value ?? "{}"));
      AppService.currentStartSale = _ss;
      isStartSale(AppService.currentStartSale?.isStart);
      //
      AppAlert.successAlert(title: "stop_sale_success".tr);
    }
  }

  void onProductPressed() => Get.toNamed(ProductScren.routeName);
  void onReportPressed() {}
  void onPermissionPressed() {}
  void onBusinessReportPressed() {}
  void onUsersPressed() {}
  void onSettingPressed() => Get.toNamed(SettingScreen.routeName);
}
