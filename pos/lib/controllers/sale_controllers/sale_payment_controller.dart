import 'package:get/get.dart';
import 'package:pos/models/payment_method_models/payment_method_model.dart';
import 'package:pos/services/app_service.dart';

class SalePaymentController extends GetxController {
  var paymentMethod = Rxn<PaymentMethodModel>();
  RxList<PaymentMethodModel> paymentMethodList = (<PaymentMethodModel>[]).obs;

  @override
  void onInit() {
    super.onInit();
    _onLoadPaymentMethod();
  }

  void _onLoadPaymentMethod() async {
    paymentMethodList.assignAll(AppService.paymentMethodList);
  }

  void onPaymentMethodPressed(PaymentMethodModel pm) {
    paymentMethod(pm);
  }
}
