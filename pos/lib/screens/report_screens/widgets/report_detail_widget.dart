import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/report_controllers/report_controller.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/status_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_table/responsive_table.dart';

class ReportDetailWidget extends StatelessWidget {
  const ReportDetailWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReportController _controller = Get.find();
    return Obx(
      () => Card(
        borderOnForeground: true,
        elevation: 0,
        child: Column(
          children: [
            Expanded(
              child: ResponsiveDatatable(
                reponseScreenSizes: const [ScreenSize.xs],
                headers: [
                  DatatableHeader(
                    text: "invoice_number".tr,
                    value: "invoice",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: value,
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "sub_total".tr,
                    value: "subtotal",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: AppService.currencyFormat(value),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "grand_total".tr,
                    value: "",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: AppService.currencyFormat(value),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "payment_status".tr,
                    value: "",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return value
                          ? StatusWidget(
                              backgroundColor: successColor,
                              child: TextWidget(
                                text: "paid".tr,
                                color: Colors.white,
                              ),
                            )
                          : StatusWidget(
                              backgroundColor: warningColor,
                              child: TextWidget(
                                text: "unpaid".tr,
                                color: Colors.white,
                              ),
                            );
                    },
                  ),
                ],
                footers: [
                  if (_controller.dataSource.isEmpty)
                    Expanded(
                      child: Container(
                        color: HexColor("#ededed"),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: TextWidget(
                          text: "no_data_available_in_table".tr,
                          color: textColor,
                        ),
                      ),
                    ),
                ],
                headerDecoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                selectedDecoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                  color: Colors.green,
                ),
                headerTextStyle: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                rowTextStyle: const TextStyle(color: Colors.black),
                selectedTextStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
