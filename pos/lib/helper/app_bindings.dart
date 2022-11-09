import 'package:get/get.dart';
import 'package:pos/controllers/business_controllers/inventory_summary_report_controller/inventory_summary_report_controller.dart';
import 'package:pos/controllers/business_controllers/overview_controller/overview_controller.dart';
import 'package:pos/controllers/business_controllers/receipt_report_controller/receipt_report_controller.dart';
import 'package:pos/controllers/business_controllers/sale_summary_report_controllers/sale_summary_report_controller.dart';
import 'package:pos/controllers/expense_controllers/add_expense_controller.dart';
import 'package:pos/controllers/expense_controllers/view_expense_controller.dart';
import 'package:pos/controllers/login_controllers/login_controller.dart';
import 'package:pos/controllers/main_controller.dart';
import 'package:pos/controllers/product_controllers/category_controller.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/controllers/product_controllers/product_detail_controller.dart';
import 'package:pos/controllers/product_controllers/product_group_controller.dart';
import 'package:pos/controllers/report_controllers/report_controller.dart';
import 'package:pos/controllers/report_controllers/report_detail_controller.dart';
import 'package:pos/controllers/role_controllers/role_controller.dart';
import 'package:pos/controllers/sale_controllers/sale_controller.dart';
import 'package:pos/controllers/sale_controllers/sale_table_controller.dart';
import 'package:pos/controllers/smart_home_controller.dart';
import 'package:pos/controllers/user_controllers/user_controller.dart';
import 'package:pos/controllers/user_controllers/user_detail_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<SmartHomeController>(() => SmartHomeController());
    Get.lazyPut<SaleController>(() => SaleController());
    Get.lazyPut<SaleTableController>(() => SaleTableController());
    Get.lazyPut<ReportController>(() => ReportController());
    Get.lazyPut<ReportDetailController>(() => ReportDetailController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<ProductDetailController>(() => ProductDetailController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<UserDetailController>(() => UserDetailController());
    Get.lazyPut<RoleController>(() => RoleController());
    Get.lazyPut<OverviewController>(() => OverviewController());
    Get.lazyPut<InventorySummaryReportController>(
        () => InventorySummaryReportController());
    Get.lazyPut<ReceiptReportController>(() => ReceiptReportController());
    Get.lazyPut<ProductGroupController>(() => ProductGroupController());
    Get.lazyPut<SaleSummaryReportController>(
        () => SaleSummaryReportController());
    Get.lazyPut<AddExpenseController>(() => AddExpenseController());
    Get.lazyPut<ViewExpenseController>(() => ViewExpenseController());
  }
}
