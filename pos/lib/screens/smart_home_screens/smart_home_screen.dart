import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/text_widget.dart';

class SmartHomeScreen extends GetResponsiveView<dynamic> {
  SmartHomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "home".tr,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            constraints: const BoxConstraints(maxWidth: 500),
            height: double.infinity,
            alignment: Alignment.center,
            child: GridView(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              children: [
                Container(
                  color: Colors.red,
                  child: const TextWidget(
                    text: "1",
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: const TextWidget(
                    text: "1",
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: const TextWidget(
                    text: "1",
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: const TextWidget(
                    text: "1",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
