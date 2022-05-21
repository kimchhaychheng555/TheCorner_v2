import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/services/app_service.dart';

class AppTheme {
  // Light Mode
  static ThemeData get getTheme => ThemeData(
        fontFamily: AppService.getFont,
        backgroundColor: primaryColor,
        primarySwatch: AppService.buildMaterialColor(primaryColor),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.normal,
          ),
          iconTheme: IconThemeData(
            size: 20,
            color: Colors.white,
          ),
        ),
      );
}
