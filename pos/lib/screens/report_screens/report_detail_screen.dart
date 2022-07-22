import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/controllers/report_controllers/report_detail_controller.dart';
import 'package:pos/screens/report_screens/widgets/report_detail_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
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
            constraints: const BoxConstraints(minWidth: 600),
            height: double.infinity,
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              width: 1000,
              height: 800,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: ListView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: "Logo".tr,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#005FF2"),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                        horizontal: 50,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HexColor("#FC9403"),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextWidget(
                                        text: "unpaid".tr,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              TextWidget(
                                                text: "invoice_#".tr,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: HexColor("#333440"),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              TextWidget(
                                                text: "124578".tr,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: HexColor("#333440"),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: "invoice_date".tr,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#333440"),
                                          ),
                                          const SizedBox(width: 20),
                                          TextWidget(
                                            text: "july-09-2022".tr,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#333440"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: "invoice_bold".tr,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#333440"),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 50),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: TextWidget(
                                        text: "description".tr,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#333440"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "qty".tr,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#333440"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "sub_table".tr,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#333440"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "discount".tr,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#333440"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "grand_total".tr,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#333440"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30),
                              const ReportDetailWidget(
                                description: "ឆាក្ដៅសាច់គោ",
                                qty: 2,
                                subTable: "1.20\$",
                                discount: "0\$",
                                grandTotal: "10.00\$",
                              ),
                              const SizedBox(height: 20),
                              const ReportDetailWidget(
                                description: "ឆាក្ដៅសាច់គោ",
                                qty: 2,
                                subTable: "1.20\$",
                                discount: "0\$",
                                grandTotal: "10.00\$",
                              ),
                              const SizedBox(height: 20),
                              const ReportDetailWidget(
                                description: "ឆាក្ដៅសាច់គោ",
                                qty: 2,
                                subTable: "1.20\$",
                                discount: "0\$",
                                grandTotal: "10.00\$",
                              ),
                              const SizedBox(height: 20),
                              const ReportDetailWidget(
                                description: "ឆាក្ដៅសាច់គោ",
                                qty: 2,
                                subTable: "1.20\$",
                                discount: "0\$",
                                grandTotal: "10.00\$",
                              ),
                              const SizedBox(height: 20),
                              const ReportDetailWidget(
                                description: "ឆាក្ដៅសាច់គោ",
                                qty: 2,
                                subTable: "1.20\$",
                                discount: "0\$",
                                grandTotal: "10.00\$",
                              ),
                              const SizedBox(height: 30),
                              Container(
                                width: double.infinity,
                                height: 2,
                                color: HexColor("#9E9E9E"),
                              ),
                              const SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: TextWidget(
                                        text: "",
                                        color: HexColor("#333440"),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "total".tr,
                                        color: HexColor("#333440"),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "\$ 150.00",
                                        color: HexColor("#333440"),
                                        textAlign: TextAlign.end,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: TextWidget(
                                        text: "",
                                        color: HexColor("#333440"),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "discount".tr,
                                        color: HexColor("#333440"),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "\$ 10.00".tr,
                                        color: HexColor("#333440"),
                                        textAlign: TextAlign.end,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: double.infinity,
                                height: 3,
                                color: HexColor("#9E9E9E"),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: TextWidget(
                                        text: "",
                                        color: HexColor("#333440"),
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "total_amount_due".tr,
                                        fontSize: 20,
                                        color: HexColor("#333440"),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                      child: TextWidget(
                                        text: "\$ 140.00".tr,
                                        fontSize: 20,
                                        color: HexColor("#333440"),
                                        textAlign: TextAlign.end,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 50),
                              const SizedBox(height: 50),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      // body: Container(
      //   constraints: const BoxConstraints(maxWidth: 1000, minWidth: 650),
      //   color: Colors.blueAccent,
      //   child: Column(
      //     children: [
      //       Container(
      //         width: 600,
      //         height: 400,
      //         color: Colors.red,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
