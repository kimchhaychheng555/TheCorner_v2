import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/main_controller.dart';
import 'package:pos/screens/login_screens/login_screen.dart';
import 'package:pos/screens/splash_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController _controller = Get.find();
    return Obx(() {
      return _controller.isLoading.value ? const SplashScreen() : LoginScreen();
    });
  }
}
