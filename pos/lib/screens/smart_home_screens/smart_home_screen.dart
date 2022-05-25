import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/controllers/smart_home_controller.dart';

import 'package:pos/screens/smart_home_screens/widgets/smart_home_button_widget.dart';
import 'package:pos/widgets/drawer_widget.dart';

class SmartHomeScreen extends GetResponsiveView<dynamic> {
  SmartHomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget builder() {
    SmartHomeController _controller = Get.find();
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        drawer: const DrawerWidget(),
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: 'menu'.tr,
              );
            },
          ),
          title: Text(
            "the_corner".tr,
          ),
          actions: [
            IconButton(
              tooltip: "logout".tr,
              onPressed: _controller.onLogoutPressed,
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              constraints: const BoxConstraints(maxWidth: 450),
              height: double.infinity,
              alignment: Alignment.center,
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  if (!_controller.isStartSale.value)
                    SmartHomeButtonWidget(
                      onPressed: _controller.onStartSalePressed,
                      icon: Icon(
                        Icons.play_circle,
                        size: 30,
                        color: HexColor("#1f994c"),
                      ),
                      backgroundColor: HexColor("#c0e1c3"),
                      title: "start_sale".tr,
                      borderRadius: 5,
                    ),
                  if (_controller.isStartSale.value)
                    SmartHomeButtonWidget(
                      flatColor: HexColor("#af231e"),
                      onPressed: _controller.onStopSalePressed,
                      icon: Icon(
                        Icons.stop_circle,
                        size: 25,
                        color: HexColor("#af231e"),
                      ),
                      backgroundColor: HexColor("#ededed"),
                      title: "stop_sale".tr,
                      textColor: Colors.white,
                      borderRadius: 5,
                    ),
                  SmartHomeButtonWidget(
                    onPressed: _controller.onSalePressed,
                    icon: Icon(
                      Icons.shopping_cart_rounded,
                      size: 25,
                      color: HexColor("#309398"),
                    ),
                    backgroundColor: HexColor("#D5ECEC"),
                    title: "sale".tr,
                    borderRadius: 5,
                  ),
                  SmartHomeButtonWidget(
                    onPressed: _controller.onProductPressed,
                    icon: Icon(
                      Icons.format_list_bulleted,
                      size: 25,
                      color: HexColor("#DF6260"),
                    ),
                    backgroundColor: HexColor("#F7D6D5"),
                    title: "products".tr,
                    borderRadius: 5,
                  ),
                  SmartHomeButtonWidget(
                    onPressed: _controller.onReportPressed,
                    icon: Icon(
                      Icons.feed,
                      size: 25,
                      color: HexColor("#E9A268"),
                    ),
                    backgroundColor: HexColor("#FCEBDE"),
                    title: "report".tr,
                    borderRadius: 5,
                  ),
                  SmartHomeButtonWidget(
                    onPressed: _controller.onPermissionPressed,
                    icon: Icon(
                      Icons.lock_reset,
                      size: 25,
                      color: HexColor("#50B403"),
                    ),
                    backgroundColor: HexColor("#DCFAC5"),
                    title: "permission".tr,
                    borderRadius: 5,
                  ),
                  SmartHomeButtonWidget(
                    onPressed: _controller.onBusinessReportPressed,
                    icon: Icon(
                      Icons.insights,
                      size: 25,
                      color: HexColor("#9190B1"),
                    ),
                    backgroundColor: HexColor("#E9E9F3"),
                    title: "business_report".tr,
                    borderRadius: 5,
                  ),
                  SmartHomeButtonWidget(
                    onPressed: _controller.onUsersPressed,
                    icon: Icon(
                      Icons.supervisor_account,
                      size: 25,
                      color: HexColor("#0FCD9E"),
                    ),
                    backgroundColor: HexColor("#D2F6EA"),
                    title: "users".tr,
                    borderRadius: 5,
                  ),
                  SmartHomeButtonWidget(
                    onPressed: _controller.onSettingPressed,
                    icon: Icon(
                      Icons.tune,
                      size: 25,
                      color: HexColor("#E0CD65"),
                    ),
                    backgroundColor: HexColor("#FBF6D8"),
                    title: "setting".tr,
                    borderRadius: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
