import 'dart:convert';

import 'package:get/get.dart';
import 'package:pos/models/table_models/table_model.dart';
import 'package:pos/services/api_service.dart';

class SaleTableController extends GetxController {
  var isLoading = false.obs;
  RxList<TableModel> tableList = (<TableModel>[]).obs;

  @override
  void onInit() {
    _onLoadTable();
    super.onInit();
  }

  void _onLoadTable() async {
    isLoading(true);
    var _resp = await APIService.oDataGet("table");
    if (_resp.isSuccess) {
      List<dynamic> _data = jsonDecode(_resp.content);
      var _dataList = _data.map((t) => TableModel.fromJson(t));
      tableList.assignAll(_dataList);
    }
    isLoading(false);
  }
}
