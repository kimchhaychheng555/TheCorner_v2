import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/login_controllers/login_controller.dart';
import 'package:pos/widgets/change_language_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class LoginScreen extends GetResponsiveView<dynamic> {
  LoginScreen({Key? key}) : super(key: key);

  static const String routeName = "/login";

  @override
  Widget builder() {
    LoginController _controller = Get.find();
    return Obx(
      () => LoadingOverlayWidget(
        isLoading: _controller.isLoading.value,
        child: Scaffold(
          body: Material(
            color: primaryColor,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: "welcome".tr,
                          textAlign: TextAlign.center,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _controller.usernameCtrl,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            filled: true,
                            isCollapsed: true,
                            hintText: "username".tr,
                            fillColor: Colors.white,
                            border: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _controller.passwordCtrl,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            filled: true,
                            isCollapsed: true,
                            hintText: "password".tr,
                            fillColor: Colors.white,
                            border: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          onSubmitted: (_) {
                            _controller.onLoginPressed();
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    color: Colors.white, width: 1.5),
                              ),
                              value: _controller.isRememberMe.value,
                              onChanged: _controller.onRememberMeChanged,
                            ),
                            TextWidget(
                              text: "remember_me".tr,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: _controller.onLoginPressed,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            child: TextWidget(
                              text: "login".tr,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w500,
                              color: textColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const ChangeLanguageWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
