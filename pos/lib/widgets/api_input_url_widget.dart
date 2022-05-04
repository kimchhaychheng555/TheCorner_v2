import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/main_controller.dart';
import 'package:pos/widgets/text_widget.dart';

class APIInputUrlWidget extends StatelessWidget {
  const APIInputUrlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainController _controller = Get.find();
    return Material(
      color: primaryColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(text: "url_server".tr),
              const SizedBox(height: 20),
              TextField(
                controller: _controller.urlServerCtrl,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  filled: true,
                  isCollapsed: true,
                  hintText: "url_server".tr,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _controller.onConnectPressed,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  child: TextWidget(
                    text: "connect".tr,
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
