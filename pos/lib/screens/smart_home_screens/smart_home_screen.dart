import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/screens/sale_table_screens/sale_table_screen.dart';

import 'package:pos/screens/smart_home_screens/widgets/smart_home_button_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class SmartHomeScreen extends GetResponsiveView<dynamic> {
  SmartHomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  @override
  Widget builder() {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2FE),
      appBar: AppBar(
        title: TextWidget(
          text: "home".tr,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            constraints: const BoxConstraints(maxWidth: 500),
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
                InkWell(
                  onTap: (() {
                    Get.offAndToNamed(SaleTableScreen.routeName);
                  }),
                  child: SmartHomeButtonWidget(
                    icon: Icon(
                      Icons.play_circle,
                      size: 40,
                      color: HexColor("#AC059F"),
                    ),
                    backgroundColor: HexColor("#F7C3F3"),
                    title: "Start Sale".tr,
                  ),
                ),
                SmartHomeButtonWidget(
                  icon: Icon(
                    Icons.shopping_cart_rounded,
                    size: 40,
                    color: HexColor("#309398"),
                  ),
                  backgroundColor: HexColor("#D5ECEC"),
                  title: "Sale".tr,
                ),
                SmartHomeButtonWidget(
                  icon: Icon(
                    Icons.format_list_bulleted,
                    size: 40,
                    color: HexColor("#DF6260"),
                  ),
                  backgroundColor: HexColor("#F7D6D5"),
                  title: "Products".tr,
                ),
                SmartHomeButtonWidget(
                  icon: Icon(
                    Icons.feed,
                    size: 40,
                    color: HexColor("#E9A268"),
                  ),
                  backgroundColor: HexColor("#FCEBDE"),
                  title: "Report".tr,
                ),
                SmartHomeButtonWidget(
                  icon: Icon(
                    Icons.lock_reset,
                    size: 40,
                    color: HexColor("#50B403"),
                  ),
                  backgroundColor: HexColor("#DCFAC5"),
                  title: "Permission".tr,
                ),
                SmartHomeButtonWidget(
                  icon: Icon(
                    Icons.insights,
                    size: 40,
                    color: HexColor("#9190B1"),
                  ),
                  backgroundColor: HexColor("#E9E9F3"),
                  title: "Business Report".tr,
                ),
                SmartHomeButtonWidget(
                  icon: Icon(
                    Icons.supervisor_account,
                    size: 40,
                    color: HexColor("#0FCD9E"),
                  ),
                  backgroundColor: HexColor("#D2F6EA"),
                  title: "Users".tr,
                ),
                SmartHomeButtonWidget(
                  icon: Icon(
                    Icons.tune,
                    size: 40,
                    color: HexColor("#E0CD65"),
                  ),
                  backgroundColor: HexColor("#FBF6D8"),
                  title: "Setting".tr,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
