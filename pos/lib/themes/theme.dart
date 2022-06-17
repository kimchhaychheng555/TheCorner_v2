import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/services/app_service.dart';

class AppTheme {
  // Light Mode
  static ThemeData get getTheme => ThemeData(
        fontFamily: AppService.getFont,
        backgroundColor: primaryColor,
        primarySwatch: AppService.buildMaterialColor(primaryColor),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontFamily: AppService.getFont,
            color: Colors.white,
          ),
          iconTheme: const IconThemeData(
            size: 20,
            color: Colors.white,
          ),
        ),
      );
}
