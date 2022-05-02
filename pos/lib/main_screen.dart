import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/main_controller.dart';
import 'package:pos/screens/login_screens/login_screen.dart';
import 'package:pos/screens/splash_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.put(MainController());
    return Obx(() {
      return _controller.isLoading.value ? const SplashScreen() : LoginScreen();
    });
  }
}
