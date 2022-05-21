import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/services/app_service.dart';

class AppTheme {
  // Light Mode
  static ThemeData get getTheme => ThemeData(
        fontFamily: AppService.getFont,
        backgroundColor: primaryColor,
        primarySwatch: myColorSwatch,
      );
}
