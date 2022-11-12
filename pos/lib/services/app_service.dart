// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/excel_export_models/excel_export_model.dart';
import 'package:pos/models/payment_method_models/payment_method_model.dart';
import 'package:pos/models/permission_models/permission_model.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/models/start_sale_modesl/start_sale_model.dart';
import 'package:pos/models/user_models/login_model.dart';
import 'package:pos/models/user_models/user_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/encrypter_service.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';
import 'package:uuid/uuid.dart';

class AppService {
  static String apiApp = "http://10.10.9.10:9090/api/";
  static String baseUrl = apiApp.substring(0, apiApp.length - 4);
  static bool isApiConnected = true;
  static String currentLanguage = "en";
  static UserModel? currentUser;
  static LoginModel? loginUser;
  static GetStorage storage = GetStorage("setting");
  static StartSaleModel? currentStartSale;
  static List<PaymentMethodModel> paymentMethodList = [];
  static List<ProductModel> productList = [];
  static List<CategoryModel> categoryList = [];

  static Locale get getLanguage {
    switch (currentLanguage) {
      case "en":
        return const Locale('en');
      case "kh":
        return const Locale('kh');
      default:
        return const Locale('en');
    }
  }

  static String get getFont {
    switch (currentLanguage) {
      case "en":
        return "Roboto";
      case "kh":
        return "Siemreap";
      default:
        return "Roboto";
    }
  }

  static Screen get screen {
    if (Get.width < 480) {
      return Screen.isMobile;
    }
    return Screen.isDesktop;
  }

  static void back() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }

    if (Get.isSnackbarOpen) {
      Get.back(closeOverlays: true);
    }

    if (Get.isOverlaysOpen) {
      Get.back();
    }

    Get.back();
  }

  static Future<bool> onTestConnectionApi() async {
    var _resp = await APIService.get("connection");
    if (_resp.isSuccess) {
      return true;
    }
    return false;
  }

  static Future<void> onSaveConnectionApi() async {
    await AppService.storage.write("api", AppService.apiApp);
  }

  static Future<void> onAppStartUpConfiguration() async {
    // await onSaveConnectionApi();
    await onLanguageStartUp();
    await _onAPIUrlLoadStartUp();
    await _onLoadLoginUserStartUp();
    await _onLoadPaymentMethod();
    await _onLoadCategory();
    await _onLoadProduct();
  }

  static Future<void> onRefreshSale() async {
    await _onLoadCategory();
    await _onLoadProduct();
  }

  static Future<void> _onLoadProduct() async {
    var _query = "product?\$filter=is_deleted eq false";

    var _resp = await APIService.oDataGet(_query);
    if (_resp.isSuccess) {
      List<dynamic> _products = jsonDecode(_resp.content) ?? [];
      var _datas = _products.map((p) => ProductModel.fromJson(p)).toList();
      productList.assignAll(_datas);
    }
  }

  static Future<void> _onLoadCategory() async {
    var _resp =
        await APIService.oDataGet("category?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _categories = jsonDecode(_resp.content) ?? [];
      var _datas = _categories.map((c) => CategoryModel.fromJson(c)).toList();

      var _category = CategoryModel(id: Uuid.NAMESPACE_NIL, name: "all".tr);
      _datas.insert(0, _category);
      categoryList.assignAll(_datas);
    }
  }

  static Future<void> _onLoadPaymentMethod() async {
    var _resp =
        await APIService.oDataGet("paymentMethod?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _dynamic = jsonDecode(_resp.content);
      var _data = _dynamic.map((e) => PaymentMethodModel.fromJson(e)).toList();
      paymentMethodList.assignAll(_data);
    }
  }

  static Future<void> _onLoadLoginUserStartUp() async {
    if (AppService.storage.hasData("account_store")) {
      var _loginUser =
          EncrypterService.decrypt(AppService.storage.read("account_store"));
      AppService.loginUser = LoginModel.fromJson(jsonDecode(_loginUser));
    }
  }

  static Future<void> onLanguageStartUp() async {
    if (AppService.storage.hasData("language")) {
      AppService.currentLanguage = AppService.storage.read("language");
    } else {
      await AppService.storage.write("language", AppService.currentLanguage);
    }
  }

  static Future<void> _onAPIUrlLoadStartUp() async {
    if (AppService.storage.hasData("api")) {
      AppService.apiApp = await AppService.storage.read("api");
      var _resp = await APIService.get("connection");
      if (_resp.isSuccess) {
        AppService.isApiConnected = true;
      } else {
        AppService.isApiConnected = false;
      }
    }
  }

  static String currencyFormat(double? price) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    var number = oCcy.format(price ?? 0);
    return "\$ $number";
  }

  static bool hasPermission(String? permission) {
    for (PermissionModel p in (AppService.currentUser?.permissions ?? [])) {
      if (p.slug == permission) {
        return true;
      }
    }
    return false;
  }

//   // ===========================================================
//   // Language Option

  static Future<void> onChangeLanguage({String lang = ""}) async {
    if (lang != "") {
      AppService.currentLanguage = lang;
    } else {
      if (AppService.currentLanguage == "kh") {
        AppService.currentLanguage = "en";
      } else {
        AppService.currentLanguage = "kh";
      }
    }
    // Write Storage
    await AppService.storage.write("language", AppService.currentLanguage);
    // Re update translatation
    await Get.updateLocale(AppService.getLanguage);
  }

  // Build Material Color
  static MaterialColor buildMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  //
  static Future<void> onExportProcess({
    required String fileName,
    required List<ExcelExportModel> excelExportList,
    required String title,
    required String description,
  }) async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    final Style style = workbook.styles.add('Style1');
    style.bold = true;
    style.hAlign = HAlignType.center;
    sheet.getRangeByName("A1").setText(title);
    sheet.getRangeByName("A1").cellStyle = style;
    // Title
    sheet
        .getRangeByName(
            '${colNumToLetter(1)}1:${colNumToLetter(excelExportList.length)}1')
        .merge();
    sheet.getRangeByName("A2").setText(description);
    sheet.getRangeByName("A2").cellStyle = style;
    // Title
    sheet
        .getRangeByName(
            '${colNumToLetter(1)}2:${colNumToLetter(excelExportList.length)}2')
        .merge();
    // Loop Header
    for (var i = 0; i < excelExportList.length; i++) {
      var header = excelExportList[i].header;
      sheet.getRangeByName('${colNumToLetter(i + 1)}3').setText(header);
      sheet.getRangeByName('${colNumToLetter(i + 1)}3').cellStyle.bold = true;

      // Loop Content
      List<String> contentList = (excelExportList[i].contentList) ?? [];
      for (var j = 0; j < contentList.length; j++) {
        sheet
            .getRangeByName('${colNumToLetter(i + 1)}${j + 4}')
            .setText(contentList[j]);
      }
    }

    final List<int> sheets = workbook.saveAsStream();
    workbook.dispose();

    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Save file',
      lockParentWindow: true,
      type: FileType.custom,
      fileName: '$fileName.xlsx',
      allowedExtensions: ['xlsx'],
    );

    try {
      File returnedFile = File('$outputFile');
      await returnedFile.writeAsBytes(sheets);
    } catch (e) {
      AppAlert.errorAlert(title: e.toString());
    }
  }

  static String colNumToLetter(dynamic columnNu) {
    var temp, letter = '';
    while (columnNu > 0) {
      temp = (columnNu - 1) % 26;
      letter = String.fromCharCode(temp + 65) + letter;
      columnNu = (columnNu - temp - 1) / 26;
    }
    return letter;
  }
}
