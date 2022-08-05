import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/sale_controllers/sale_table_controller.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/payment_method_models/payment_method_model.dart';
import 'package:pos/models/print_models/print_model.dart';
import 'package:pos/models/product_group_models/product_group_model.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/models/sale_models/sale_model.dart';
import 'package:pos/models/sale_payment_models/sale_payment_model.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:pos/models/stock_transaction_models/stock_transaction_model.dart';
import 'package:pos/models/table_models/table_model.dart';
import 'package:pos/screens/sale_screens/widgets/sale_discount_widget.dart';
import 'package:pos/screens/sale_screens/widgets/sale_payment_widget.dart';
import 'package:pos/screens/sale_screens/widgets/sale_product_item_modify_widget.dart';
import 'package:pos/services/api_service.dart';
import 'package:pos/services/app_alert.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/services/log_service.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:uuid/uuid.dart';

class SaleController extends GetxController {
  var isLoading = false.obs;
  var saleCrossAxisCount = 3.obs;
  SaleTableController saleTableCtrl = Get.find();
  var categorySelected = Rxn<CategoryModel>();
  var sale = Rxn<SaleModel>();
  var table = Rxn<TableModel>();

  //
  RxList<ProductModel> productList = (<ProductModel>[]).obs;
  RxList<CategoryModel> categoryList = (<CategoryModel>[]).obs;
  RxList<ProductGroupModel> productGroupList = (<ProductGroupModel>[]).obs;

  @override
  void onInit() {
    onInitLoad();
    super.onInit();
  }

  void onRefreshPressed() async {
    isLoading(true);
    await AppService.onRefreshSale();
    onInitLoad();
    isLoading(false);
  }

  void onInitLoad() async {
    isLoading(true);
    _onSaleCrossAxisCount();
    await _onLoadCategory();
    await _onLoadProduct();
    await _onLoadProductGroup();
    await _onInitController();
    if (table.value?.isActive == false) {
      _onSaleInitValue();
    }
    isLoading(false);
  }

  @override
  void onClose() async {
    saleTableCtrl.onLoadTable();
    super.onClose();
  }

  void _onSaleCrossAxisCount() {
    if (AppService.storage.hasData("saleCount")) {
      var _saleCount = AppService.storage.read("saleCount");
      saleCrossAxisCount(_saleCount);
    }
  }

  Future<void> _onLoadProductGroup() async {
    var _query = "productGroup?\$filter=is_deleted eq false";
    var _resp = await APIService.oDataGet(_query);
    if (_resp.isSuccess) {
      List<dynamic> _data = jsonDecode(_resp.content);
      var _dataSale = _data.map((s) => ProductGroupModel.fromJson(s)).toList();
      if (_dataSale.isNotEmpty) {
        productGroupList.assignAll(_dataSale);
      }
    }
  }

  Future<void> _onInitController() async {
    table(TableModel.fromJson(jsonDecode(Get.arguments["table"])));
    if (table.value?.isActive == true) {
      var _query =
          "sale?\$filter=is_deleted eq false and is_paid eq false and table_id eq ${table.value?.id} &\$expand=sale_products";
      var _resp = await APIService.oDataGet(_query);
      if (_resp.isSuccess) {
        List<dynamic> _data = jsonDecode(_resp.content);
        var _dataSale = _data.map((s) => SaleModel.fromJson(s)).toList();
        if (_dataSale.isNotEmpty) {
          sale(_dataSale.first);
          sale.refresh();
        }
      }
    }
  }

  void onTableChanged(String? tableId) {
    table(saleTableCtrl.tableList.where((t) => t.id == tableId).first);
  }

  Future<void> _onLoadProduct() async {
    if (categorySelected.value?.id != Uuid.NAMESPACE_NIL) {
      productList.assignAll(AppService.productList
          .where((p) => p.category_id == categorySelected.value?.id));
    } else {
      productList.assignAll(AppService.productList);
    }
    productList.refresh();
  }

  Future<void> _onLoadCategory() async {
    categoryList(AppService.categoryList);
    categorySelected(AppService.categoryList.first);
  }

  void _onSaleInitValue() {
    var _sale = SaleModel(
      created_by: AppService.currentUser?.fullname,
      id: Uuid.NAMESPACE_NIL,
      sale_date: AppService.currentStartSale?.date,
      table_id: table.value?.id,
    );
    sale(_sale);
  }

  void onCategoryPressed(CategoryModel category) async {
    isLoading(true);
    categorySelected(category);
    await _onLoadProduct();
    isLoading(false);
  }

  void onCancelBillPressed() {
    Get.defaultDialog(
      radius: 5,
      title: "cancel".tr,
      middleText: "do_you_want_to_cancel_this_bill".tr,
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            AppService.back();
          },
        ),
      ],
    );
  }

  void onHoldBillPressed() async {
    isLoading(true);
    if ((sale.value?.sale_products?.length ?? 0) > 0) {
      await _onHoldProcess();
      //
      LogService.sendLog(
          user: AppService.currentUser?.fullname ?? "",
          logAction:
              "This User is HoldBild Product at Table : ${table.value?.name}");
    } else {
      AppAlert.errorAlert(title: "this_sale_have_no_product".tr);
    }
    isLoading(false);
  }

  void onDiscountPressed() {
    var _discountType = sale.value?.discount_type;
    var _discountValue =
        sale.value?.discount == 0 ? null : sale.value?.discount.toString();
    Get.defaultDialog(
      title: "discount".tr,
      radius: 5,
      content: SaleDiscountWidget(
        type: _discountType,
        value: _discountValue,
        onAccept: (_discountType, _discountValue, pgList) {
          _onDiscountByProductGroup(
            discountType: _discountType,
            discountValue: _discountValue,
            pgList: pgList,
          );
          Get.back();
          sale.refresh();
          //

          LogService.sendLog(
              user: AppService.currentUser?.fullname ?? "",
              logAction:
                  "This User Discount On Bill Table : ${table.value?.name}"
                  "\nDiscount value = $getDiscountSummary");
        },
      ),
    );
  }

  void _onDiscountByProductGroup({
    List<ProductGroupModel>? pgList,
    String? discountType,
    String? discountValue,
  }) {
    bool discountSaleExist = (pgList?.length == productGroupList.length);

    if ((pgList ?? []).isEmpty || discountSaleExist) {
      sale.value?.discount_type = discountType;
      sale.value?.discount = double.tryParse(discountValue ?? "0") ?? 0;
      for (SaleProductModel sp in (sale.value?.sale_products ?? [])) {
        sp.discount_type = "";
        sp.discount = 0;
      }
    } else {
      sale.value?.discount_type = "";
      sale.value?.discount = 0;
      for (SaleProductModel sp in (sale.value?.sale_products ?? [])) {
        sp.discount_type = "";
        sp.discount = 0;

        bool discountSpExist = (pgList ?? [])
            .where((pg) => pg.id == sp.product_group_id)
            .isNotEmpty;

        if (discountSpExist) {
          sp.discount_type = discountType;
          sp.discount = double.tryParse(discountValue ?? "0") ?? 0;
        }
      }
    }
  }

  void onPrintInvoicePressed() async {
    isLoading(true);
    if ((sale.value?.sale_products?.length ?? 0) > 0) {
      var printData = PrintModel(
        created_by: AppService.currentUser?.fullname,
        id: Uuid.NAMESPACE_NIL,
        sale_id: sale.value?.id,
        key: "invoice",
      );

      if (sale.value?.id == Uuid.NAMESPACE_NIL) {
        await _onHoldProcess();
        printData = PrintModel(
          created_by: AppService.currentUser?.fullname,
          id: Uuid.NAMESPACE_NIL,
          sale_id: sale.value?.id,
          key: "invoice",
        );
        var _resp = await APIService.post("print/save", jsonEncode(printData));
        if (_resp.isSuccess) {
          AppAlert.successAlert(title: "print_success".tr);
        } else {
          AppAlert.errorAlert(title: "print_error".tr);
        }
        return;
      }
      var _resp = await APIService.post("print/save", jsonEncode(printData));
      if (_resp.isSuccess) {
        Get.back();
        AppAlert.successAlert(title: "print_success".tr);
      } else {
        AppAlert.errorAlert(title: "print_error".tr);
      }
      await Future.delayed(const Duration(seconds: 1));
      await _onHoldProcess();
    } else {
      AppAlert.errorAlert(title: "this_sale_have_no_product".tr);
    }
    isLoading(false);
  }

  void onPayPressed() {
    if ((sale.value?.sale_products?.length ?? 0) > 0) {
      Get.defaultDialog(
        title: "payment".tr,
        radius: 5,
        content: SalePaymentWidget(
          onAcceptPressed: (payment) {
            _onPaymentProcess(payment);
          },
        ),
      );
    } else {
      AppAlert.errorAlert(title: "this_sale_have_no_product".tr);
    }
  }

  void _onPaymentProcess(PaymentMethodModel model) async {
    List<SalePaymentModel> _salePayments = [];
    _salePayments.add(SalePaymentModel(
      id: Uuid.NAMESPACE_NIL,
      created_by: AppService.currentUser?.fullname,
      exchange_rate: model.exchange_rate,
      payment_amount: getGrandTotal,
      payment_method_name: model.payment_method_name,
      payment_method_id: model.id,
      sale_id: Uuid.NAMESPACE_NIL,
    ));

    sale.value?.sale_payments = [];
    sale.value?.sale_payments?.addAll(_salePayments);

    _onSubmitPaymentProcess();
  }

  void onProductPressed(ProductModel product) {
    var _exists = (sale.value?.sale_products ?? [])
        .where((sp) =>
            sp.product_id == product.id &&
            sp.is_deleted == false &&
            sp.is_free == false)
        .toList();

    if ((_exists).isNotEmpty) {
      _exists.first.quantity = ((_exists.first.quantity ?? 0) + 1);
    } else {
      var _tempSp = SaleProductModel(
        id: Uuid.NAMESPACE_NIL,
        sale_id: sale.value?.id,
        quantity: 1,
        stockable: product.stockable ?? false,
        image: product.image,
        price: product.price,
        product_id: product.id,
        product_name: product.name,
        created_by: AppService.currentUser?.fullname,
        product_group_id: product.product_group_id,
      );
      (sale.value?.sale_products ?? []).add(_tempSp);
    }

    sale.refresh();
  }

  void onSaleProductItemPressed(SaleProductModel sp) {
    var tempSp = (sale.value?.sale_products ?? []).where((_sp) =>
        _sp.id == sp.id &&
        _sp.product_id == sp.product_id &&
        _sp.is_free == sp.is_free &&
        sp.is_deleted == false);

    Get.defaultDialog(
      barrierDismissible: false,
      title: sp.product_name ?? "",
      titleStyle: const TextStyle(fontFamily: "Siemreap"),
      radius: 5,
      content: SaleProductItemModifyWidget(
        sp: sp,
        onAccept: (qty, price, discountType, discountValue) {
          if (tempSp.isNotEmpty) {
            if ((sale.value?.id ?? Uuid.NAMESPACE_NIL) != Uuid.NAMESPACE_NIL) {
              if (tempSp.first.firstChanged == false &&
                  sale.value?.is_paid == true) {
                tempSp.first.old_quantity = tempSp.first.quantity ?? 0;
                tempSp.first.firstChanged = true;
              }
            }
            tempSp.first.quantity = double.parse(qty);
            tempSp.first.price = double.parse(price);
            tempSp.first.discount_type = discountType ?? "";
            tempSp.first.discount = double.tryParse(discountValue) ?? 0;
            sale.refresh();
            Get.back();
          }
        },
        onRemoveDiscountPressed: () {
          if (tempSp.isNotEmpty) {
            tempSp.first.discount = 0;
            tempSp.first.discount_type = "";
          }
          Get.back();
        },
        onFreePressed: () {
          if (tempSp.isNotEmpty) {
            tempSp.first.is_free = true;

            LogService.sendLog(
                user: AppService.currentUser?.fullname ?? "",
                logAction: "Free on = ${tempSp.first.product_name}"
                    "\nQty = ${tempSp.first.quantity}"
                    "\nPrice = ${AppService.currencyFormat((tempSp.first.price ?? 1) * (tempSp.first.quantity ?? 1))}");

            sale.refresh();
            Get.back();
          }
        },
        onRemoveFreePressed: () {
          if (tempSp.isNotEmpty) {
            tempSp.first.is_free = false;
            sale.refresh();
            Get.back();
          }
        },
      ),
    );
  }

  void onSaleProductItemDeletePressed(SaleProductModel sp) {
    Get.defaultDialog(
      radius: 5,
      title: sp.product_name ?? "",
      titleStyle: const TextStyle(fontFamily: "Siemreap"),
      middleText: "do_you_want_to_remove_this_product".tr,
      actions: [
        ButtonActionWidget(
          confirmText: "yes".tr,
          cancelText: "no".tr,
          onCancelPressed: () => Get.back(),
          onConfirmPressed: () {
            _onSaleProductItemDeleteProcess(sp);
          },
        ),
      ],
    );
  }

  void _onSaleProductItemDeleteProcess(SaleProductModel sp) {
    if ((sp.id ?? Uuid.NAMESPACE_NIL) != Uuid.NAMESPACE_NIL) {
      var saleProduct =
          (sale.value?.sale_products ?? []).where((_sp) => _sp.id == sp.id);
      saleProduct.first.is_deleted = true;
    } else {
      (sale.value?.sale_products ?? []).remove(sp);
    }
    sale.refresh();
    Get.back();
  }

  Future<void> _onHoldProcess() async {
    SaleModel _saleProcess = sale.value ?? SaleModel();
    _saleProcess.status = true;
    _saleProcess.table_id = table.value?.id;
    if ((sale.value?.id ?? Uuid.NAMESPACE_NIL) != Uuid.NAMESPACE_NIL) {
      _saleProcess.sale_date = AppService.currentStartSale?.date;
      _saleProcess.created_by = AppService.currentUser?.fullname;
    }
    _saleProcess.sub_total = getSubTotal;
    _saleProcess.grand_total = getGrandTotal;

    await _onSaleSave(_saleProcess, saleType: "hold");
  }

  Future<void> _onSaleSave(
    SaleModel saleProcess, {
    required String saleType,
    bool isPayment = false,
  }) async {
    if (isPayment) {
      if ((saleProcess.id ?? Uuid.NAMESPACE_NIL) != Uuid.NAMESPACE_NIL) {
        await _checkInventoryProcess(saleProcess, isEdit: true, type: saleType);
      } else {
        await _checkInventoryProcess(saleProcess,
            isEdit: false, type: saleType);
      }
    }

    var _jsonStr = jsonEncode(saleProcess.toJson());
    var _resp = await APIService.post("sale/save", _jsonStr);
    if (_resp.isSuccess) {
      sale(SaleModel.fromJson(jsonDecode(_resp.content)));
      sale.refresh();
      Get.back();
      AppAlert.successAlert(title: "save_sale_successfully".tr);
      //
      LogService.sendLog(
          user: AppService.currentUser?.fullname ?? "",
          logAction: "This User Payment at Table : ${table.value?.name}"
              "\n");
    } else {
      AppAlert.errorAlert(title: "save_sale_error".tr);
    }
  }

  Future<void> _checkInventoryProcess(
    SaleModel sale, {
    bool isEdit = false,
    required String type,
  }) async {
    List<StockTransactionModel> _listStockTransaction = [];
    if (isEdit == false) {
      for (SaleProductModel sp in (sale.sale_products ?? [])) {
        if (sp.stockable) {
          var _inventory = StockTransactionModel(
            created_by: AppService.currentUser?.fullname,
            id: Uuid.NAMESPACE_NIL,
            product_id: sp.product_id,
            type: type,
            quantity: sp.quantity,
          );
          _listStockTransaction.add(_inventory);
        }
      }
    } else {
      for (SaleProductModel sp in (sale.sale_products ?? [])) {
        if (sp.stockable) {
          if (sp.old_quantity > 0) {
            var _inventory = StockTransactionModel(
              created_by: AppService.currentUser?.fullname,
              id: Uuid.NAMESPACE_NIL,
              product_id: sp.product_id,
              type: "add",
              quantity: sp.old_quantity,
            );
            _listStockTransaction.add(_inventory);
          }
          var _inventory = StockTransactionModel(
            created_by: AppService.currentUser?.fullname,
            id: Uuid.NAMESPACE_NIL,
            product_id: sp.product_id,
            type: type,
            quantity: sp.quantity,
          );
          _listStockTransaction.add(_inventory);
        }
      }
    }

    var jsonStr = jsonEncode(_listStockTransaction);

    // print("\x1B[32m =================================================");
    await APIService.post("StockTransaction/Save", jsonStr);

    // print(jsonStr);
  }

  Future<void> _onSubmitPaymentProcess() async {
    isLoading(true);
    SaleModel _saleProcess = sale.value ?? SaleModel();
    _saleProcess.status = true;
    _saleProcess.is_paid = true;
    _saleProcess.table_id = table.value?.id;
    if ((sale.value?.id ?? Uuid.NAMESPACE_NIL) != Uuid.NAMESPACE_NIL) {
      _saleProcess.sale_date = AppService.currentStartSale?.date;
      _saleProcess.created_by = AppService.currentUser?.fullname;
    }
    _saleProcess.sub_total = getSubTotal;
    _saleProcess.grand_total = getGrandTotal;

    _onSaleSave(_saleProcess, saleType: "sold", isPayment: true);

    isLoading(false);
  }

  double get getSubTotal {
    var _subTotal = 0.0;
    for (var sp in (sale.value?.sale_products ?? [])) {
      if (sp.is_deleted || sp.is_free) {
        _subTotal += 0;
      } else {
        var getSubTotal = ((sp.price ?? 0) * (sp.quantity ?? 1));

        var _grandTotal = 0.0;
        if (sp.discount_type == "percent") {
          _grandTotal = getSubTotal - (getSubTotal * ((sp.discount) / 100));
        } else if (sp.discount_type == "amount") {
          _grandTotal = getSubTotal - (sp.discount);
        } else {
          _grandTotal = getSubTotal;
        }

        _subTotal += _grandTotal;
      }
    }
    return _subTotal;
  }

  double get getGrandTotal {
    var _grandTotal = 0.0;
    if (sale.value?.discount_type == "percent") {
      _grandTotal =
          getSubTotal - (getSubTotal * ((sale.value?.discount ?? 0) / 100));
    } else if (sale.value?.discount_type == "amount") {
      _grandTotal = getSubTotal - (sale.value?.discount ?? 0);
    } else {
      _grandTotal = getSubTotal;
    }
    return _grandTotal;
  }

  String get getDiscountSummary {
    if (sale.value?.discount_type == "percent") {
      return "${sale.value?.discount} %";
    } else {
      return AppService.currencyFormat(sale.value?.discount);
    }
  }

  void onChangedGridPressed() {
    if (saleCrossAxisCount.value <= 7) {
      saleCrossAxisCount(saleCrossAxisCount.value + 1);
    } else {
      saleCrossAxisCount(1);
    }
    AppService.storage.write("saleCount", saleCrossAxisCount.value);
  }
}
