import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/product_controllers/product_group_controller.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductGroupScreen extends GetResponsiveView<dynamic> {
  ProductGroupScreen({Key? key}) : super(key: key);

  static const String routeName = "/product-group";
  @override
  Widget builder() {
    ProductGroupController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("product_group".tr),
          actions: [
            IconButton(
              onPressed: () => _controller.onAddCategoryPressed(),
              icon: const Icon(Icons.add_rounded),
            )
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    TextWidget(
                      text: "active".tr,
                      color: textColor,
                    ),
                    ..._controller.productGroupList
                        .where((c) => !(c.is_deleted ?? false))
                        .map(
                          (category) => _categoryItem(
                            name: category.group_name ?? "",
                            onEditPressed: () =>
                                _controller.onEditPressed(category),
                            onDeletePressed: () =>
                                _controller.onDeletePressed(category),
                          ),
                        ),
                    if (_controller.productGroupList
                        .where((c) => (c.is_deleted ?? false))
                        .isNotEmpty)
                      const Divider(),
                    if (_controller.productGroupList
                        .where((c) => (c.is_deleted ?? false))
                        .isNotEmpty)
                      TextWidget(
                        text: "restore".tr,
                        color: textColor,
                      ),
                    ..._controller.productGroupList
                        .where((c) => (c.is_deleted ?? false))
                        .map(
                          (pg) => _categoryItem(
                            name: pg.group_name ?? "",
                            isRestore: pg.is_deleted ?? false,
                            onRestorePressed: () =>
                                _controller.onRestorePressed(pg),
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _categoryItem({
  required String name,
  Function()? onEditPressed,
  Function()? onDeletePressed,
  Function()? onRestorePressed,
  bool isRestore = false,
}) {
  return Row(
    children: [
      Expanded(
        child: TextWidget(
          text: name,
          color: textColor,
          fontFamily: "Siemreap",
        ),
      ),
      if (!isRestore)
        IconButton(
          tooltip: "edit".tr,
          splashRadius: 20,
          onPressed: onEditPressed,
          icon: Icon(
            Icons.edit_rounded,
            color: infoColor,
          ),
        ),
      if (!isRestore)
        IconButton(
          tooltip: "delete".tr,
          splashRadius: 20,
          onPressed: onDeletePressed,
          icon: Icon(
            Icons.delete_rounded,
            color: errorColor,
          ),
        ),
      if (isRestore)
        IconButton(
          tooltip: "restore".tr,
          splashRadius: 20,
          onPressed: onRestorePressed,
          icon: Icon(
            Icons.replay_rounded,
            color: successColor,
          ),
        ),
    ],
  );
}
