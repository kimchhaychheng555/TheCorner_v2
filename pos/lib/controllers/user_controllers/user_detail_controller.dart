import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:uuid/uuid.dart';

class UserDetailController extends GetxController {
  var titleScreen = "".obs;
  var isLoading = false.obs;
  var isEditable = false.obs;
  //
  var isUploadImage = false.obs;
  var imageFile = Rxn<File>();
  var productDetail = ProductModel().obs;
  var tempProductDetail = ProductModel().obs;
  RxList<CategoryModel> categoryList = (<CategoryModel>[]).obs;
  //
  var productNameCtrl = TextEditingController();
  var costCtrl = TextEditingController();
  var priceCtrl = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await onLoadCategory();
    onGetArgument();
  }

  @override
  void onClose() {
    ProductController productCtrl = Get.find();
    productCtrl.onLoadProduct();
  }

  Future<void> onGetArgument() async {
    var arg = Get.arguments;
    if (arg != null) {
      var _data = ProductModel.fromJson(arg);
      productDetail(_data);
      productNameCtrl.text = productDetail.value.name ?? "";
      costCtrl.text = "${productDetail.value.cost ?? 0}";
      priceCtrl.text = "${productDetail.value.price ?? 0}";
      tempProductDetail(_data);
    }

    if (productDetail.value.id == null) {
      titleScreen("add_product");
      isEditable(true);
    }
  }

  Future<void> onLoadCategory() async {
    isLoading(true);

    var _resp =
        await APIService.oDataGet("category?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _dynamic = [];
      _dynamic = jsonDecode(_resp.content);
      var _dataList = _dynamic.map((e) => CategoryModel.fromJson(e)).toList();
      categoryList.assignAll(_dataList);
    }

    isLoading(false);
  }

  void onEditablePressed() {
    titleScreen("edit_product");
    isEditable(!isEditable.value);
  }

  void onStockableChanged(bool? value) {
    tempProductDetail.value.stockable = value;
    tempProductDetail.refresh();
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
    productDetail.value.image = "noimage.png";
  }

  Widget get getImageWidget {
    ImageProvider _backgroundImage =
        const AssetImage("assets/images/noimage.png");
    if (isUploadImage.value) {
      _backgroundImage = FileImage(imageFile.value!);
    } else {
      return CachedNetworkImage(
        imageUrl: "${AppService.baseUrl}uploads/${productDetail.value.image}",
        imageBuilder: (context, imageProvider) => CircleAvatar(
          maxRadius: 70,
          backgroundImage: CachedNetworkImageProvider(
            "${AppService.baseUrl}uploads/${productDetail.value.image}",
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
    tempProductDetail.value.category_id = value;
  }

  void onCancelProductDetail() => Get.back();
  void onSaveProductDetail() async {
    isLoading(true);
    var imageName = "noimage.png";
    if (isUploadImage.value) {
      var _uploadImage = await APIService.uploadFile(file: imageFile.value!);
      if (!_uploadImage.isSuccess) {
        AppAlert.errorAlert(title: "upload_file_error".tr);
        return;
      }
      imageName = _uploadImage.message;
    } else {
      imageName = tempProductDetail.value.image ?? "noimage.png";
    }

    if (productDetail.value.id == null) {
      var _product = ProductModel(
        id: Uuid.NAMESPACE_NIL,
        name: productNameCtrl.text,
        cost: double.tryParse(costCtrl.text) ?? 0,
        price: double.tryParse(priceCtrl.text) ?? 0,
        category_id: tempProductDetail.value.category_id,
        stockable: tempProductDetail.value.stockable,
        created_by: AppService.currentUser?.fullname,
        image: imageName,
      );
      productDetail(_product);
    } else {
      var _product = ProductModel.fromJson(
          jsonDecode(jsonEncode(tempProductDetail.value)));
      _product.name = productNameCtrl.text;
      _product.cost = double.tryParse(costCtrl.text) ?? 0;
      _product.price = double.tryParse(priceCtrl.text) ?? 0;
      _product.image = imageName;
      _product.category = null;

      tempProductDetail(_product);
      productDetail(tempProductDetail.value);
    }

    var _resp =
        await APIService.post("product/save", jsonEncode(productDetail.value));
    if (_resp.isSuccess) {
      Get.back();
      AppAlert.successAlert(title: "save_product_success".tr);
    } else {
      AppAlert.errorAlert(title: "save_product_error".tr);
    }

    isLoading(false);
  }
}
