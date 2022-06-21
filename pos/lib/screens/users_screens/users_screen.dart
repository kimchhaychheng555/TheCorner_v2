import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/user_controllers/user_controller.dart';
import 'package:pos/screens/products_screens/widgets/product_drawer_widget.dart';
import 'package:pos/screens/users_screens/widgets/user_table_page_widget.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/icon_text_button_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class UsersScreen extends GetResponsiveView<dynamic> {
  UsersScreen({Key? key}) : super(key: key);

  static const String routeName = "/users";

  @override
  Widget builder() {
    UserController _controller = Get.find();
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Obx(
      () => Scaffold(
        key: _key,
        endDrawer: const ProductDrawerWidget(),
        appBar: AppBar(
          title: Text("users".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
          actions: [
            IconButton(
              onPressed: () => _controller.onLoadUser(),
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
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller.keywordCtrl,
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
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onSubmitted: (_) => _controller.onKeywordSearch(),
                            ),
                          ),
                          const SizedBox(width: 5),
                          ButtonPaginationWidget(
                            onPressed: () => _controller.onKeywordSearch(),
                            backgroundColor: primaryColor,
                            child: const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconTextButtonWidget(
                      onPressed: () => _controller.onCategoryPressed(),
                      label: TextWidget(text: "role".tr),
                      backgroundColor: primaryColor,
                      icon: const Icon(Icons.grid_view_rounded),
                    ),
                    const SizedBox(width: 10),
                    IconTextButtonWidget(
                      onPressed: () => _controller.onAddProductPressed(),
                      label: TextWidget(text: "add_user".tr),
                      backgroundColor: primaryColor,
                      icon: const Icon(Icons.add_rounded),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Expanded(
                  child: UserTablePageWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
