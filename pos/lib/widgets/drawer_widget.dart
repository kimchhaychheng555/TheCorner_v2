import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/smart_home_controller.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SmartHomeController _controller = Get.find();
    return Obx(
      () => Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              margin: EdgeInsets.all(0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                child: ListView(
                  controller: ScrollController(keepScrollOffset: true),
                  scrollDirection: Axis.vertical,
                  children: [
                    tile(
                      iconColor: successColor,
                      textColor: successColor,
                      visible: !_controller.isStartSale.value,
                      icon: Icons.play_circle_filled_rounded,
                      text: "start_sale".tr,
                      onPressed: () {
                        Get.back();
                        _controller.onStartSalePressed();
                      },
                    ),
                    tile(
                      iconColor: errorColor,
                      textColor: errorColor,
                      visible: _controller.isStartSale.value,
                      icon: Icons.stop_circle_rounded,
                      text: "stop_sale".tr,
                      onPressed: () {
                        Get.back();
                        _controller.onStopSalePressed();
                      },
                    ),
                    tile(
                      icon: Icons.shopping_cart_rounded,
                      text: "sale".tr,
                      onPressed: () {
                        Get.back();
                        _controller.onSalePressed();
                      },
                    ),
                    tile(
                      icon: Icons.format_list_bulleted,
                      text: "products".tr,
                      onPressed: () {},
                    ),
                    tile(
                      icon: Icons.feed,
                      text: "report".tr,
                      onPressed: () {},
                    ),
                    expandTile(
                      title: "business_report".tr,
                      icon: Icons.insights,
                      children: [
                        tile(
                          text: "overview".tr,
                          onPressed: () {},
                        ),
                        tile(
                          text: "inventory_summary_report".tr,
                          onPressed: () {},
                        ),
                        tile(
                          text: "sale_summary_report".tr,
                          onPressed: () {},
                        ),
                        tile(
                          text: "receipt_report".tr,
                          onPressed: () {},
                        ),
                        tile(
                          text: "expense_report".tr,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    expandTile(
                      title: "inventory".tr,
                      icon: Icons.storage_outlined,
                      children: [
                        tile(
                          text: "purchase_order".tr,
                          onPressed: () {},
                        ),
                        tile(
                          text: "adjustment_inventory".tr,
                          onPressed: () {},
                        ),
                        tile(
                          text: "inventory_transaction".tr,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    expandTile(
                      title: "expense".tr,
                      icon: Icons.bookmark_added_outlined,
                      children: [
                        tile(
                          text: "add_expense".tr,
                          onPressed: () {},
                        ),
                        tile(
                          text: "view_expense".tr,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    tile(
                      icon: Icons.lock_outlined,
                      text: "permission".tr,
                      onPressed: () {},
                    ),
                    tile(
                      icon: Icons.people,
                      text: "user".tr,
                      onPressed: () {},
                    ),
                    tile(
                      icon: Icons.settings_rounded,
                      text: "setting".tr,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget expandTile({
    String title = "",
    IconData icon = Icons.chevron_right_outlined,
    required List<Widget> children,
    bool visible = true,
    bool initiallyExpanded = false,
  }) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          title: Text(title),
          leading: Icon(icon),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: const EdgeInsets.only(left: 20),
          children: children,
        ),
      ),
    );
  }

  Widget tile({
    IconData icon = Icons.chevron_right_outlined,
    String text = "",
    Function()? onPressed,
    bool selected = false,
    bool visible = true,
    Color? textColor,
    Color? iconColor,
  }) {
    return Visibility(
      visible: visible,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          selected: selected,
          dense: false,
          textColor: textColor,
          iconColor: iconColor,
          selectedColor: primaryColor,
          selectedTileColor: HexColor("#C5D5E4").withOpacity(0.5),
          leading: Icon(icon),
          title: Text(text),
          onTap: onPressed,
        ),
      ),
    );
  }
}
