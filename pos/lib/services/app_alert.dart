import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/text_widget.dart';

class AppAlert {
  static SnackbarController? errorAlert({String? title}) {
    if (!Get.isSnackbarOpen) {
      _alert(
        backgroundColor: errorColor,
        title: title,
        foregroundColor: Colors.white,
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
      );
    }
    return null;
  }

  static SnackbarController? infoAlert({String? title}) {
    if (!Get.isSnackbarOpen) {
      _alert(
        backgroundColor: infoColor,
        title: title,
        foregroundColor: Colors.white,
        icon: const Icon(
          Icons.info_outline,
          color: Colors.white,
        ),
      );
    }
    return null;
  }

  static SnackbarController? warningAlert({String? title}) {
    if (!Get.isSnackbarOpen) {
      _alert(
        backgroundColor: warningColor,
        title: title,
        foregroundColor: Colors.white,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        ),
      );
    }
    return null;
  }

  static SnackbarController? successAlert({String? title}) {
    if (!Get.isSnackbarOpen) {
      _alert(
        backgroundColor: successColor,
        title: title,
        foregroundColor: Colors.white,
        icon: const Icon(
          Icons.done,
          color: Colors.white,
        ),
      );
    }
    return null;
  }

  static SnackbarController? _alert({
    String? title,
    Icon? icon,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    return Get.snackbar(
      title ?? "",
      "",
      backgroundColor: (backgroundColor ?? errorColor).withOpacity(0.75),
      maxWidth: 500,
      duration: const Duration(seconds: 1),
      borderRadius: 5,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      titleText: TextWidget(
        text: title ?? "",
        color: foregroundColor ?? Colors.white,
        height: 2,
      ),
      onTap: (_) {
        Get.back();
      },
      leftBarIndicatorColor: backgroundColor ?? errorColor,
      shouldIconPulse: false,
      snackStyle: SnackStyle.FLOATING,
      icon: icon ??
          Icon(
            Icons.close,
            color: foregroundColor ?? Colors.white,
          ),
      borderColor: backgroundColor ?? errorColor,
      borderWidth: 0.5,
      colorText: foregroundColor ?? Colors.white,
      messageText: Container(),
    );
  }
}
