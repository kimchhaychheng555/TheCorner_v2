import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/report_controllers/report_detail_controller.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/status_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ReportDetailScreen extends GetResponsiveView<dynamic> {
  ReportDetailScreen({Key? key}) : super(key: key);

  static const String routeName = "/reports-detail";

  @override
  Widget builder() {
    ReportDetailController _controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("report_detail".tr),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.keyboard_backspace),
        ),
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
                              backgroundColor: warningColor,
                              child: TextWidget(text: "balance".tr),
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
                            i < (_controller.sale_products).length;
                            i++)
                          _item(index: i, sp: _controller.sale_products[i]),
                      ],
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

Widget _item({SaleProductModel? sp, int? index}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "$index",
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 5,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "description".tr,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "qty".tr,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "price".tr,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "dis".tr,
            color: Colors.black,
          ),
        ),
        Expanded(
          flex: 2,
          child: TextWidget(
            textAlign: TextAlign.center,
            text: "amount".tr,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
