import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/report_controllers/report_detail_controller.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/status_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ReportDetailScreen extends GetResponsiveView<dynamic> {
  ReportDetailScreen({Key? key}) : super(key: key);

  static const String routeName = "/reports-detail";

  @override
  Widget builder() {
    ReportDetailController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("report_detail".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
          actions: [
            if (_controller.saleModel.value?.is_paid == false)
              IconButton(
                splashRadius: 30,
                onPressed: _controller.onEditSale,
                icon: const Icon(Icons.edit),
              ),
            IconButton(
              splashRadius: 30,
              onPressed: _controller.onPrintInvoicePressed,
              icon: const Icon(Icons.print),
            ),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 900, minWidth: 900),
              width: 1000,
              height: 800,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 100,
                          ),
                          const Spacer(),
                          TextWidget(
                            text: "invoice".tr.toUpperCase(),
                            fontSize: 30,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              StatusWidget(
                                backgroundColor:
                                    (_controller.saleModel.value?.is_paid ??
                                            false)
                                        ? successColor
                                        : warningColor,
                                child: TextWidget(
                                  text: (_controller.saleModel.value?.is_paid ??
                                          false)
                                      ? "paid".tr
                                      : "unpaid".tr,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextWidget(
                                text:
                                    "${"invoice".tr}# ${_controller.saleModel.value?.invoice_number}",
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              TextWidget(
                                text:
                                    "${"date".tr}: ${_controller.saleModel.value?.sale_date}",
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            color: Colors.black54,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "Nº".tr,
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "description".tr,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "qty".tr,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "price".tr,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "dis".tr,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextWidget(
                                    textAlign: TextAlign.center,
                                    text: "amount".tr,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          for (var i = 0;
                              i < (_controller.saleProducts).length;
                              i++)
                            _item(index: i, sp: _controller.saleProducts[i]),
                        ],
                      ),
                      const Divider(),
                      if ((_controller.saleModel.value?.discount ?? 0) > 0)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: summaryData(
                            TextWidget(
                              textAlign: TextAlign.right,
                              text: "discount".tr,
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget(
                              textAlign: TextAlign.left,
                              text: discountSummary(
                                _controller.saleModel.value?.discount ?? 0,
                                _controller.saleModel.value?.discount_type ??
                                    "",
                              ),
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: summaryData(
                          TextWidget(
                            textAlign: TextAlign.right,
                            text: "sub_total".tr,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            textAlign: TextAlign.center,
                            text: AppService.currencyFormat(
                              _controller.saleModel.value?.sub_total,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: summaryData(
                          TextWidget(
                            textAlign: TextAlign.right,
                            text: "grand_total".tr,
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          TextWidget(
                            textAlign: TextAlign.center,
                            text: AppService.currencyFormat(
                              _controller.saleModel.value?.grand_total,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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

Widget summaryData(Widget label, Widget value) {
  return Row(
    children: [
      Expanded(
        flex: 10,
        child: label,
      ),
      Expanded(
        flex: 2,
        child: Container(),
      ),
      Expanded(
        flex: 2,
        child: value,
      ),
    ],
  );
}

Widget _item({SaleProductModel? sp, int? index}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "${index ?? 0 + 1}",
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 5,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "${sp?.product_name}",
            fontFamily: "Siemreap",
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "${sp?.quantity}",
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: AppService.currencyFormat(sp?.price),
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: discountSummary(sp?.discount ?? 0, sp?.discount_type ?? ""),
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: AppService.currencyFormat(getAmount(sp!)),
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

String discountSummary(double discount, String type) {
  if (discount > 0) {
    if (type == "percent") {
      return "$discount %";
    } else {
      return AppService.currencyFormat(discount);
    }
  } else {
    return "-";
  }
}

double getAmount(SaleProductModel sp) {
  var _subTotal = 0.0;
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
  return _subTotal;
}
