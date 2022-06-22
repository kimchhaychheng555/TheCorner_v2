import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';

class PermissionScreen extends GetResponsiveView<dynamic> {
  PermissionScreen({Key? key}) : super(key: key);

  static const String routeName = "/role-permission";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text("permission".tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_backspace),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh_rounded),
          ),
        ],
      ),
      body: LoadingOverlayWidget(
        child: Container(),
      ),
    );
  }
}
