import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/models/api_models/response_model.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/product_group_models/product_group_model.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/avatar_widget.dart';
import 'package:uuid/uuid.dart';

class ProductDetailController extends GetxController {
  var titleScreen = "".obs;
  var isLoading = false.obs;
  var isEditable = false.obs;
  //
  var isUploadImage = false.obs;
  var imageFile = Rxn<File>();
  var imageFileRaw = Rxn<Uint8List>();
  var productDetail = ProductModel().obs;
  var tempProductDetail = ProductModel().obs;
  RxList<CategoryModel> categoryList = (<CategoryModel>[]).obs;
  RxList<ProductGroupModel> productGroupList = (<ProductGroupModel>[]).obs;
  //
  var productNameCtrl = TextEditingController();
  var minQuantityCtrl = TextEditingController();
  var costCtrl = TextEditingController();
  var priceCtrl = TextEditingController();

  @override
  void onInit() async {
    super.onInit();
    await onLoadCategory();
    await onLoadProductGroup();
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

  Future<void> onLoadProductGroup() async {
    isLoading(true);

    var _resp =
        await APIService.oDataGet("productGroup?\$filter=is_deleted eq false");
    if (_resp.isSuccess) {
      List<dynamic> _dynamic = [];
      _dynamic = jsonDecode(_resp.content);
      var _dataList =
          _dynamic.map((e) => ProductGroupModel.fromJson(e)).toList();
      _dataList.insert(
          0,
          ProductGroupModel(
              id: Uuid.NAMESPACE_NIL, group_name: "unselected".tr));
      productGroupList.assignAll(_dataList);
    }

    isLoading(false);
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
      if (kIsWeb) {
        Uint8List? fileBytes = result.files.first.bytes;
        imageFileRaw(fileBytes);
      } else {
        File file = File(result.files.single.path ?? "");
        imageFile(file);
      }

      isUploadImage(true);
    }
  }

  void onClearImagePressed() {
    isUploadImage(false);
    productDetail.value.image = "noimage.png";
  }

  Widget get getImageWidget {
    Widget _backgroundImage = Image.asset("assets/images/noimage.png");

    if (isUploadImage.value) {
      if (kIsWeb) {
        _backgroundImage = Image.memory(
          imageFileRaw.value!,
          fit: BoxFit.cover,
        );
      } else {
        _backgroundImage = Image.file(
          imageFile.value!,
          fit: BoxFit.cover,
        );
      }
    } else {
      return CachedNetworkImage(
        imageUrl: "${AppService.baseUrl}uploads/${productDetail.value.image}",
        imageBuilder: (context, imageProvider) => AvatarWidget(
          maxRadius: 140,
          child: CachedNetworkImage(
            imageUrl:
                "${AppService.baseUrl}uploads/${productDetail.value.image}",
            fit: BoxFit.cover,
          ),
        ),
        placeholder: (context, url) => const AvatarWidget(
          maxRadius: 140,
          padding: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        errorWidget: (context, url, error) => AvatarWidget(
          maxRadius: 140,
          child: Image.asset(
            "assets/images/noimage.png",
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return AvatarWidget(
      maxRadius: 140,
      child: _backgroundImage,
    );
  }

  void onCategoryValueChanged(String? value) {
    tempProductDetail.value.category_id = value;
  }

  void onProductGroupValueChanged(String? value) {
    if (value == Uuid.NAMESPACE_NIL) {
      tempProductDetail.value.product_group_id = null;
      return;
    }
    tempProductDetail.value.product_group_id = value;
  }

  void onCancelProductDetail() => Get.back();
  void onSaveProductDetail() async {
    isLoading(true);
    var imageName = "noimage.png";
    if (isUploadImage.value) {
      POSTResponse _uploadImage;
      if (kIsWeb) {
        _uploadImage = await APIService.uploadFile(
          uint8list: imageFileRaw.value,
          fileName: const Uuid().v4(),
        );
      } else {
        _uploadImage = await APIService.uploadFile(file: imageFile.value!);
        if (!_uploadImage.isSuccess) {
          AppAlert.errorAlert(title: "upload_file_error".tr);
          return;
        }
      }
      imageName = imageFileRaw.value == null
          ? _uploadImage.message
          : _uploadImage.message + ".jpg";
    } else {
      imageName = tempProductDetail.value.image ?? "noimage.png";
    }

    if (productDetail.value.id == null) {
      var _product = ProductModel(
        id: Uuid.NAMESPACE_NIL,
        name: productNameCtrl.text,
        min_quantity: double.tryParse(minQuantityCtrl.text) ?? 0,
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

      _product.min_quantity = double.tryParse(minQuantityCtrl.text) ?? 0;
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
