import 'dart:async';

import 'package:get/get.dart';

class MainController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() async {
    print("==========> On Init");
    isLoading(true);
    await Future.delayed(const Duration(seconds: 5));
    isLoading(false);
    super.onInit();
  }
}
