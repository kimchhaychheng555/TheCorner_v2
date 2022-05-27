import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/models/table_models/table_model.dart';
import 'package:pos/screens/sale_screens/sale_screen.dart';
import 'package:pos/services/api_service.dart';

class SaleTableController extends GetxController {
  var isLoading = false.obs;
  RxList<TableModel> tableList = (<TableModel>[]).obs;
  RxList<SaleModel> tempSaleList = (<SaleModel>[]).obs;

  @override
  void onInit() {
    onLoadTable();
    super.onInit();
  }

  Future<void> onLoadTable() async {
    isLoading(true);
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
    isLoading(false);
  }

  void onTablePressed(TableModel table) async {
    Get.toNamed(
      SaleScreen.routeName,
      arguments: {
        "table": jsonEncode(table),
      },
    );
  }
}
