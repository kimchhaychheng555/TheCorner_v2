import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/models/table_models/table_model.dart';
import 'package:pos/screens/sale_screens/sale_screen.dart';
import 'package:pos/screens/sale_table_screens/widgets/sale_table_add_table_widget.dart';
import 'package:pos/screens/sale_table_screens/widgets/sale_table_modal_widget.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:uuid/uuid.dart';

class SaleTableController extends GetxController {
  var isLoading = false.obs;
  RxList<TableModel> tableList = (<TableModel>[]).obs;
  RxList<SaleModel> tempSaleList = (<SaleModel>[]).obs;
  var addTableText = TextEditingController();

  @override
  void onInit() {
    onLoadTable();
    super.onInit();
  }

  Future<void> onLoadTable() async {
    var _sales = await APIService.oDataGet(
        "sale?\$filter=is_deleted eq false and is_paid eq false&\$expand=table");
    if (_sales.isSuccess) {
      List<dynamic> _data = jsonDecode(_sales.content);
      var _dataList = _data.map((s) => SaleModel.fromJson(s)).toList();
      tempSaleList.assignAll(_dataList);
    }

    var _resp = await APIService.oDataGet("table");
    if (_resp.isSuccess) {
      List<dynamic> _data = jsonDecode(_resp.content);
      var _dataList = _data.map((t) => TableModel.fromJson(t)).toList();
      for (var t in _dataList) {
        if (tempSaleList.where((s) => s.table_id == t.id).isNotEmpty) {
          t.isActive = true;
        }
      }
      tableList.assignAll(_dataList);
    }
  }

  void onTablePressed(TableModel table) async {
    Get.toNamed(
      SaleScreen.routeName,
      arguments: {
        "table": jsonEncode(table),
      },
    );
  }

  void onTableLongPressed(TableModel table) async {
    Get.defaultDialog(
      radius: 5,
      title: table.name ?? "",
      content: const SaleTableModelWidget(),
    );
  }

  void onAddTablePressed() {
    addTableText.clear();
    Get.defaultDialog(
      radius: 5,
      title: "add_table".tr,
      content: SaleTableAddTableWidget(onSubmited: () => onAddTableSubmited()),
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () => onAddTableSubmited(),
        ),
      ],
    );
  }

  void onAddTableSubmited() async {
    if (Get.isSnackbarOpen) {
      Get.closeAllSnackbars();
    }
    Get.back();
    isLoading(true);
    var newTable = TableModel(
      id: Uuid.NAMESPACE_NIL,
      name: addTableText.text,
      created_by: AppService.currentUser?.fullname,
    );

    var _resp = await APIService.post(
      "table/save",
      jsonEncode(newTable),
    );

    if (_resp.isSuccess) {
      AppAlert.successAlert(title: "add_table_success".tr);
    } else {
      AppAlert.errorAlert(title: "add_table_error".tr);
    }

    onLoadTable();
    isLoading(false);
  }

  Stream<void> stream() async* {
    while (true) {
      await Future<void>.delayed(const Duration(milliseconds: 100));
      await onLoadTable();
    }
  }
}
