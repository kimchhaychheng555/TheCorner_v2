import 'package:get/get.dart';
import 'package:pos/controllers/login_controllers/login_controller.dart';
import 'package:pos/controllers/main_controller.dart';
import 'package:pos/controllers/product_controllers/category_controller.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/controllers/product_controllers/product_detail_controller.dart';
import 'package:pos/controllers/report_controllers/report_controller.dart';
import 'package:pos/controllers/sale_controllers/sale_controller.dart';
import 'package:pos/controllers/sale_controllers/sale_table_controller.dart';
import 'package:pos/controllers/smart_home_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SmartHomeController>(() => SmartHomeController());
    Get.lazyPut<SaleController>(() => SaleController());
    Get.lazyPut<SaleTableController>(() => SaleTableController());
    Get.lazyPut<ReportController>(() => ReportController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
    Get.lazyPut<CategoryController>(() => CategoryController());
  }
}
