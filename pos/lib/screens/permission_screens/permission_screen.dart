import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/role_controllers/role_controller.dart';
import 'package:pos/screens/permission_screens/widgets/permission_table_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';

class PermissionScreen extends GetResponsiveView<dynamic> {
  PermissionScreen({Key? key}) : super(key: key);

  static const String routeName = "/role-permission";

  @override
  Widget builder() {
    RoleController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("permission".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
          actions: [
            IconButton(
              onPressed: () => _controller.onLoad(),
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: Column(
            children: const [
              Expanded(
                child: PermissionTableWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
