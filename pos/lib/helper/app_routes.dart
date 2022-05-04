import 'package:get/get.dart';
import 'package:pos/helper/app_bindings.dart';
import 'package:pos/main_screen.dart';
import 'package:pos/screens/login_screens/login_screen.dart';
import 'package:pos/screens/smart_home_screens/smart_home_screen.dart';

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
          page: () => LoginScreen(),
          name: SmartHomeScreen.routeName,
          binding: AppBindings(),
        ),
      ];
}
