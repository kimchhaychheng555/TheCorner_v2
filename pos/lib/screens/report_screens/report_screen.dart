import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/screens/products_screens/widgets/product_drawer_widget.dart';
import 'package:pos/screens/report_screens/widgets/report_screen_widget.dart';
import 'package:pos/screens/user_screen.dart/widgets/user_screen_widget.dart';
import 'package:pos/widgets/icon_text_button_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/table_page_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ReportScreen extends GetResponsiveView<dynamic> {
  ReportScreen({Key? key}) : super(key: key);

  static const String routeName = "/reports";

  @override
  Widget builder() {
    ProductController _controller = Get.find();
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Obx(
      () => Scaffold(
        key: _key,
        endDrawer: const ProductDrawerWidget(),
        appBar: AppBar(
          title: Text("report".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
          actions: [
            IconButton(
              onPressed: () => _controller.onLoadProduct(),
              icon: const Icon(Icons.refresh_rounded),
            ),
            IconButton(
              onPressed: () {
                _key.currentState!.openEndDrawer();
              },
              icon: const Icon(Icons.filter_list_rounded),
            ),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          filled: true,
                          isCollapsed: true,
                          hintText: "search".tr,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 15),
                const Expanded(
                  child: ReportScreenWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
