import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/user_controllers/user_controller.dart';
import 'package:pos/models/role_models/role_model.dart';
import 'package:pos/models/user_models/user_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:uuid/uuid.dart';

class UserDetailController extends GetxController {
  var titleScreen = "".obs;
  var isLoading = false.obs;
  var isEditable = false.obs;
  var visibilityPassword = false.obs;
  var formKey = GlobalKey<FormState>();
  //
  var isUploadImage = false.obs;
  var imageFile = Rxn<File>();
  var userDetail = UserModel().obs;
  var tempUserDetail = UserModel().obs;
  RxList<RoleModel> roleList = (<RoleModel>[]).obs;
  //
  var fullNameCtrl = TextEditingController();
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await onLoadRole();
    onGetArgument();
  }

  @override
  void onClose() {
    UserController userCtrl = Get.find();
    userCtrl.onLoadUser();
  }

  Future<void> onGetArgument() async {
    var arg = Get.arguments;
    if (arg != null) {
      var _data = UserModel.fromJson(arg);
      userDetail(_data);
      fullNameCtrl.text = userDetail.value.fullname ?? "";
      usernameCtrl.text = "${userDetail.value.username ?? 0}";
      passwordCtrl.text = "${userDetail.value.password ?? 0}";
      tempUserDetail(_data);
    }

    if (userDetail.value.id == null) {
      titleScreen("add_user");
      isEditable(true);
    }
  }

  void onVisibilityPassword() {
    visibilityPassword(!visibilityPassword.value);
  }

  Future<void> onLoadRole() async {
    isLoading(true);

    var _resp = await APIService.oDataGet("role?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _dynamic = [];
      _dynamic = jsonDecode(_resp.content);
      var _dataList = _dynamic.map((e) => RoleModel.fromJson(e)).toList();
      roleList.assignAll(_dataList);
    }

    isLoading(false);
  }

  void onEditablePressed() {
    titleScreen("edit_user");
    isEditable(!isEditable.value);
  }

  void onUploadPressed() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path ?? "");
      isUploadImage(true);
      imageFile(file);
    }
  }

  void onClearImagePressed() {
    isUploadImage(false);
    userDetail.value.profile = "noimage.png";
  }

  Widget get getImageWidget {
    ImageProvider _backgroundImage =
        const AssetImage("assets/images/noimage.png");
    if (isUploadImage.value) {
      _backgroundImage = FileImage(imageFile.value!);
    } else {
      return CachedNetworkImage(
        imageUrl: "${AppService.baseUrl}uploads/${userDetail.value.profile}",
        imageBuilder: (context, imageProvider) => CircleAvatar(
          maxRadius: 70,
          backgroundImage: CachedNetworkImageProvider(
            "${AppService.baseUrl}uploads/${userDetail.value.profile}",
          ),
        ),
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const CircleAvatar(
          maxRadius: 70,
          backgroundImage: AssetImage(
            "assets/images/noimage.png",
          ),
        ),
      );
    }

    return CircleAvatar(
      maxRadius: 70,
      backgroundImage: _backgroundImage,
    );
  }

  void onDropdownValueChanged(String? value) {
    tempUserDetail.value.role_id = value;
  }

  void onCancelProductDetail() => Get.back();
  void onSaveProductDetail() async {
    isLoading(true);
    if (formKey.currentState!.validate()) {
      var imageName = "noimage.png";
      if (isUploadImage.value) {
        var _uploadImage = await APIService.uploadFile(file: imageFile.value!);
        if (!_uploadImage.isSuccess) {
          AppAlert.errorAlert(title: "upload_file_error".tr);
          return;
        }
        imageName = _uploadImage.message;
      } else {
        imageName = tempUserDetail.value.profile ?? "noimage.png";
      }

      if (userDetail.value.id == null) {
        var _user = UserModel(
          id: Uuid.NAMESPACE_NIL,
          fullname: fullNameCtrl.text,
          username: usernameCtrl.text,
          password: passwordCtrl.text,
          role_id: tempUserDetail.value.role_id,
          created_by: AppService.currentUser?.fullname,
          profile: imageName,
        );
        userDetail(_user);
      } else {
        var _user =
            UserModel.fromJson(jsonDecode(jsonEncode(tempUserDetail.value)));
        _user.fullname = fullNameCtrl.text;
        _user.username = usernameCtrl.text;
        _user.password = passwordCtrl.text;
        _user.profile = imageName;
        _user.role_id = tempUserDetail.value.role_id;

        tempUserDetail(_user);
        userDetail(tempUserDetail.value);
      }

      var _resp =
          await APIService.post("user/save", jsonEncode(userDetail.value));
      if (_resp.isSuccess) {
        Get.back();
        AppAlert.successAlert(title: "save_user_success".tr);
      } else {
        AppAlert.errorAlert(title: _resp.message.tr);
      }
    }
    isLoading(false);
  }
}
