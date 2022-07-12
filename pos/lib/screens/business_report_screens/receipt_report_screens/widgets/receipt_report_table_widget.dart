import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/business_controllers/receipt_report_controller/receipt_report_controller.dart';
import 'package:pos/screens/report_screens/report_detail_screen.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/dropdown_button_form_field_widget.dart';
import 'package:pos/widgets/status_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_table/responsive_table.dart';

class ReceiptReportTableWidget extends StatelessWidget {
  const ReceiptReportTableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReceiptReportController _controller = Get.find();
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
                    value: "invoice_number",
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
                    text: "table".tr,
                    value: "table",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: "${"table".tr}: ${value["name"]}",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "sub_total".tr,
                    value: "sub_total",
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
                    text: "discount".tr,
                    value: "discount",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      String _dis = "";
                      if (row["discount_type"] == "percent") {
                        _dis = "$value %";
                      } else {
                        _dis = AppService.currencyFormat(value);
                      }
                      return TextWidget(
                        text: _dis,
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "grand_total".tr,
                    value: "grand_total",
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
                    value: "is_paid",
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
                source: _controller.dataSource,
                selecteds: _controller.dataSource,
                autoHeight: false,
                onSort: (value) {
                  print(value);
                },
                isExpandRows: false,
                onTabRow: (_) {
                  Get.toNamed(ReportDetailScreen.routeName, arguments: _);
                },
                expanded: [
                  ..._controller.dataSource.map((e) => false),
                ],
                sortAscending: false,
                sortColumn: "",
                isLoading: false,
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
            Row(
              children: [
                const SizedBox(
                  width: 2.5,
                ),
                ButtonPaginationWidget(
                  onPressed: _controller.currentPage.value == 1
                      ? null
                      : () => _controller
                          .onPagePressed(_controller.currentPage.value - 1),
                  backgroundColor: HexColor("#eaeaea"),
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: _controller.currentPage.value == 1
                        ? HexColor("#AAAAAA")
                        : null,
                  ),
                ),
                for (var i = 1; i <= _controller.totalPage.value; i++)
                  ButtonPaginationWidget(
                    onPressed: () => _controller.onPagePressed(i),
                    backgroundColor: _controller.currentPage.value == i
                        ? infoColor
                        : HexColor("#eaeaea"),
                    child: TextWidget(
                      text: "$i",
                      color: _controller.currentPage.value == i
                          ? Colors.white
                          : textColor,
                    ),
                  ),
                ButtonPaginationWidget(
                  onPressed: _controller.currentPage.value ==
                          _controller.totalPage.value
                      ? null
                      : () => _controller
                          .onPagePressed(_controller.currentPage.value + 1),
                  backgroundColor: HexColor("#eaeaea"),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: _controller.currentPage.value ==
                            _controller.totalPage.value
                        ? HexColor("#AAAAAA")
                        : null,
                  ),
                ),
                const SizedBox(
                  width: 2.5,
                ),
                const Spacer(),
                TextWidget(
                  text: _controller.getResultPageInfo,
                  color: textColor,
                ),
                const SizedBox(width: 10),
                SizedBox(
                  height: 40,
                  width: 65,
                  child: DropdownButtonFormFieldWidget<int>(
                    items: [
                      ..._controller.pagerList.map(
                        (p) => DropdownMenuItem<int>(
                          child: TextWidget(
                            text: "$p",
                            color: textColor,
                          ),
                          value: p,
                        ),
                      ),
                    ],
                    value: _controller.pager.value,
                    onChanged: (_) => _controller.onPagerChanged(_),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
