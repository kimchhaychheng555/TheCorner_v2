import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/expense_controllers/view_expense_controller.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/dropdown_button_form_field_widget.dart';
import 'package:pos/widgets/status_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_table/responsive_table.dart';

class ViewExpenseTablePageWidget extends StatelessWidget {
  const ViewExpenseTablePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<ViewExpenseController>();
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
                    text: "ref".tr,
                    value: "ref_number",
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
                    text: "description".tr,
                    value: "description",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: value,
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "amount".tr,
                    value: "amount",
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
                    text: "payment".tr,
                    value: "payment_method_name",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: value,
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "created_date".tr,
                    value: "created_date",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: DateFormat("dd-MM-yyyy")
                            .format(DateTime.parse(value)),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "by".tr,
                    value: "created_by",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: (value),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "note".tr,
                    value: "note",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: value,
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
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
                isExpandRows: true,
                expanded: [
                  ..._controller.dataSource.map((e) => true),
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
