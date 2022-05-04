import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/main_controller.dart';
import 'package:pos/screens/splash_screen.dart';
import 'package:pos/widgets/api_input_url_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  static const String routeName = "/config";

  @override
  Widget build(BuildContext context) {
    MainController _controller = Get.find();
    return Obx(
      () => _controller.isLoading.value
          ? const SplashScreen()
          : const APIInputUrlWidget(),
    );
  }
}
