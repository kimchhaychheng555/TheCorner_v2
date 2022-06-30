import 'package:get/get.dart';
import 'package:pos/helper/app_bindings.dart';
import 'package:pos/main_screen.dart';
import 'package:pos/screens/business_report_screens/inventory_summary_report_screens/inventory_summary_report_screen.dart';
import 'package:pos/screens/business_report_screens/overview_screens/overview_screen.dart';
import 'package:pos/screens/login_screens/login_screen.dart';
import 'package:pos/screens/permission_screens/permission_screen.dart';
import 'package:pos/screens/products_screens/category_screen.dart';
import 'package:pos/screens/products_screens/products_screen.dart';
import 'package:pos/screens/products_screens/widgets/product_detail_screen.dart';
import 'package:pos/screens/report_screens/report_detail_screen.dart';
import 'package:pos/screens/report_screens/report_screen.dart';
import 'package:pos/screens/sale_screens/sale_screen.dart';
import 'package:pos/screens/sale_table_screens/sale_table_screen.dart';
import 'package:pos/screens/setting_screens/setting_screen.dart';
import 'package:pos/screens/smart_home_screens/smart_home_screen.dart';
import 'package:pos/screens/users_screens/user_detail_screen.dart';
import 'package:pos/screens/users_screens/users_screen.dart';

class AppRoute {
  static String initialRoute = MainScreen.routeName;

  static List<GetPage<dynamic>> get getPages => [
        GetPage(
          page: () => const MainScreen(),
          name: MainScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => LoginScreen(),
          name: LoginScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => SmartHomeScreen(),
          name: SmartHomeScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => SaleTableScreen(),
          name: SaleTableScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => SaleScreen(),
          name: SaleScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => ProductScren(),
          name: ProductScren.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => SettingScreen(),
          name: SettingScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => ReportScreen(),
          name: ReportScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => ReportDetailScreen(),
          name: ReportDetailScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => ProductDetailScreen(),
          name: ProductDetailScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => CategoryScreen(),
          name: CategoryScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => OverviewScreen(),
          name: OverviewScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => UsersScreen(),
          name: UsersScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => UserDetailScreen(),
          name: UserDetailScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => PermissionScreen(),
          name: PermissionScreen.routeName,
          binding: AppBindings(),
        ),
        GetPage(
          page: () => InventorySummaryReportScreen(),
          name: InventorySummaryReportScreen.routeName,
          binding: AppBindings(),
        ),
      ];
}
