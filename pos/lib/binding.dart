import 'package:get/get.dart';
import 'package:pos/controllers/login_controllers/login_controller.dart';
import 'package:pos/controllers/main_controller.dart';

class CustomBinding extends Bindings {
  @override
  void dependencies() {
    // All Controller
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
