import 'package:get/get.dart';
import 'package:pos/controllers/login_controllers/login_controller.dart';
import 'package:pos/controllers/main_controller.dart';
import 'package:pos/controllers/sale_controllers/sale_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SaleController>(() => SaleController());
  }
}
