import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/user_controllers/user_detail_controller.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/dropdown_button_form_field_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_form_field_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class UserDetailScreen extends GetResponsiveView<dynamic> {
  UserDetailScreen({Key? key}) : super(key: key);

  static const String routeName = "/user-detail";

  @override
  Widget builder() {
    UserDetailController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("user_detail".tr),
          actions: [
            Visibility(
              visible: !(_controller.titleScreen.value == "add_product"),
              child: IconButton(
                tooltip: "edit".tr,
                onPressed: () => _controller.onEditablePressed(),
                icon: const Icon(Icons.edit),
              ),
            ),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Form(
                  key: _controller.formKey,
                  child: Column(
                    children: [
                      Visibility(
                        visible: _controller.isEditable.value,
                        child: TextWidget(
                          text: _controller.titleScreen.value.tr,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      _controller.getImageWidget,
                      const SizedBox(height: 10),
                      Visibility(
                        visible: _controller.isEditable.value,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonWidget(
                              onPressed: () =>
                                  _controller.onClearImagePressed(),
                              child: TextWidget(text: "clear".tr),
                              backgroundColor: errorColor,
                            ),
                            const SizedBox(width: 10),
                            ButtonWidget(
                              onPressed: () => _controller.onUploadPressed(),
                              child: TextWidget(text: "upload".tr),
                              backgroundColor: infoColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        controller: _controller.fullNameCtrl,
                        readOnly: !_controller.isEditable.value,
                        label: "fullname".tr,
                        fontFamily: "Siemreap",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_fullname'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        controller: _controller.usernameCtrl,
                        label: "username".tr,
                        readOnly: !_controller.isEditable.value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_username'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormFieldWidget(
                        suffixIcon: IconButton(
                          splashRadius: 15,
                          onPressed: () => _controller.onVisibilityPassword(),
                          icon: Icon(
                            _controller.visibilityPassword.value
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ),
                        ),
                        isPassword: !_controller.visibilityPassword.value,
                        controller: _controller.passwordCtrl,
                        readOnly: !_controller.isEditable.value,
                        label: "password".tr,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_password'.tr;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormFieldWidget<String>(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_select_role'.tr;
                          }
                          return null;
                        },
                        readOnly: !_controller.isEditable.value,
                        value: _controller.userDetail.value.role_id,
                        items: [
                          ..._controller.roleList.map(
                            (category) => DropdownMenuItem(
                              value: category.id,
                              child: TextWidget(
                                text: category.name ?? "",
                                color: textColor,
                              ),
                            ),
                          ),
                        ],
                        label: "role".tr,
                        onChanged: (_) => _controller.onDropdownValueChanged(_),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: _controller.isEditable.value,
                        child: ButtonActionWidget(
                          cancelText: "cancel".tr,
                          confirmText: "save".tr,
                          onCancelPressed: () =>
                              _controller.onCancelProductDetail(),
                          onConfirmPressed: () =>
                              _controller.onSaveProductDetail(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
