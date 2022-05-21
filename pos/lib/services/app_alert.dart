import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class AppAlert {
  static SnackbarController? errorAlert({String? title, String? description}) {
    if (!Get.isSnackbarOpen) {
      return Get.snackbar(
        title ?? "",
        description ?? "",
        margin: const EdgeInsets.only(top: 5),
        backgroundColor: HexColor("#fad4d8"),
        maxWidth: 500,
        borderRadius: 5,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        titleText: TextWidget(
          text: title ?? "",
          color: HexColor('#7b1620'),
          height: 1,
        ),
        borderColor: HexColor("#f7c1c9"),
        borderWidth: 0.5,
        colorText: Colors.white,
        messageText: Container(),
      );
    }
    return null;
  }
}
