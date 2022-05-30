import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/smart_home_controller.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/text_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SmartHomeController _controller = Get.find();
    return Obx(
      () => SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                color: primaryColor,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "${AppService.baseUrl}uploads/${AppService.currentUser?.profile}",
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          maxRadius: 30,
                          minRadius: 30,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => CircleAvatar(
                          maxRadius: 30,
                          minRadius: 30,
                          backgroundImage: NetworkImage(
                              "${AppService.baseUrl}uploads/noimage.png"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      TextWidget(
                        text: AppService.currentUser?.fullname ?? "",
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
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
                      onPressed: () {
                        Get.back();
                        _controller.onProductPressed();
                      },
                    ),
                    tile(
                      icon: Icons.feed,
                      text: "report".tr,
                      onPressed: () {
                        Get.back();
                        _controller.onReportPressed();
                      },
                    ),
                    expandTile(
                      title: "business_report".tr,
                      icon: Icons.insights,
                      children: [
                        tile(
                          text: "overview".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onOverviewBusinessReportPressed();
                          },
                        ),
                        tile(
                          text: "inventory_summary_report".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onInventorySummaryReportPressed();
                          },
                        ),
                        tile(
                          text: "sale_summary_report".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onSaleSummaryReportPressed();
                          },
                        ),
                        tile(
                          text: "receipt_report".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onReceiptReportPressed();
                          },
                        ),
                        tile(
                          text: "expense_report".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onExpenseReportPressed();
                          },
                        ),
                      ],
                    ),
                    expandTile(
                      title: "inventory".tr,
                      icon: Icons.storage_outlined,
                      children: [
                        tile(
                          text: "purchase_order".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onPurchaseOrderPressed();
                          },
                        ),
                        tile(
                          text: "adjustment_inventory".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onAdjustmentInventoryPressed();
                          },
                        ),
                        tile(
                          text: "inventory_transaction".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onInventoryTransactionPressed();
                          },
                        ),
                      ],
                    ),
                    expandTile(
                      title: "expense".tr,
                      icon: Icons.bookmark_added_outlined,
                      children: [
                        tile(
                          text: "add_expense".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onAddExpensePressed();
                          },
                        ),
                        tile(
                          text: "view_expense".tr,
                          onPressed: () {
                            Get.back();
                            _controller.onViewExpensePressed();
                          },
                        ),
                      ],
                    ),
                    tile(
                      icon: Icons.lock_outlined,
                      text: "permission".tr,
                      onPressed: () {
                        Get.back();
                        _controller.onPermissionPressed();
                      },
                    ),
                    tile(
                      icon: Icons.people,
                      text: "users".tr,
                      onPressed: () {
                        Get.back();
                        _controller.onUserPressed();
                      },
                    ),
                    tile(
                      icon: Icons.settings_rounded,
                      text: "setting".tr,
                      onPressed: () {
                        Get.back();
                        _controller.onSettingPressed();
                      },
                    ),
                    tile(
                      icon: Icons.logout_rounded,
                      text: "logout".tr,
                      iconColor: errorColor,
                      textColor: errorColor,
                      onPressed: () {
                        Get.back();
                        _controller.onLogoutPressed();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
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
