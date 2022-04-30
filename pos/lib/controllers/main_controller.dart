import 'package:get/get.dart';
import 'package:pos/screens/login_screens/login_screen.dart';

class MainController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 5));
    Get.to(() => LoginScreen());
    super.onInit();
  }
}
