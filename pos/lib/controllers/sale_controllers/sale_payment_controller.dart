import 'dart:convert';
import 'package:get/get.dart';
import 'package:pos/models/payment_method_models/payment_method_model.dart';
import 'package:pos/services/api_service.dart';

class SalePaymentController extends GetxController {
  var paymentMethod = Rxn<PaymentMethodModel>();
  RxList<PaymentMethodModel> paymentMethodList = (<PaymentMethodModel>[]).obs;

  @override
  void onInit() {
    super.onInit();
    _onLoadPaymentMethod();
  }

  void _onLoadPaymentMethod() async {
    var _resp =
        await APIService.oDataGet("paymentMethod?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _dynamic = jsonDecode(_resp.content);
      var _data = _dynamic.map((e) => PaymentMethodModel.fromJson(e)).toList();
      paymentMethodList.assignAll(_data);
    }
  }

  void onPaymentMethodPressed(PaymentMethodModel pm) {
    paymentMethod(pm);
  }
}
