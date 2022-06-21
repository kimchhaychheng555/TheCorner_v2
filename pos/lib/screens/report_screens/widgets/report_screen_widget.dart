import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/screens/products_screens/widgets/product_detail_screen.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/dropdown_button_form_field_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_table/responsive_table.dart';

class ReportScreenWidget extends StatelessWidget {
  const ReportScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController _controller = Get.find();
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
                    text: "Receipt Number",
                    value: "receipt_number",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: row["receipt_number"],
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "Data & Time",
                    value: "data_time",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: AppService.currencyFormat(row["data_time"]),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "Table Number",
                    value: "table_number",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: AppService.currencyFormat(row["table_number"]),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "Grand Total",
                    value: "grand_total",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: AppService.currencyFormat(row["grand_total"]),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "Payment Status",
                    value: "payment_status",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: AppService.currencyFormat(row["payment_status"]),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                  DatatableHeader(
                    text: "Other",
                    value: "other",
                    show: true,
                    textAlign: TextAlign.center,
                    sourceBuilder: (value, row) {
                      return TextWidget(
                        text: AppService.currencyFormat(row["other"]),
                        fontFamily: "Siemreap",
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      );
                    },
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
                  Get.toNamed(ProductDetailScreen.routeName, arguments: _);
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
