import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAlert {
  static SnackbarController? errorAlert({String? title, String? description}) {
    if (!Get.isSnackbarOpen) {
      return Get.snackbar(
        title ?? "",
        description ?? "",
        backgroundColor: Colors.red.withOpacity(0.8),
        maxWidth: 500,
        colorText: Colors.white,
      );
    }
    return null;
  }
}
