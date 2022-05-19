import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductScren extends GetResponsiveView<dynamic> {
  ProductScren({Key? key}) : super(key: key);

  static const String routeName = "/products";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: "Products".tr),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
                width: 1200,
                // height: 300,
                // color: Colors.red,
                child: ListView(children: <Widget>[
                  const SizedBox(height: 5),
                  DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) {
                        return HexColor('#F2F5FA');
                      },
                    ),
                    columns: [
                      DataColumn(
                          label: TextWidget(
                        text: "No",
                        fontSize: 16,
                        color: HexColor("#000000"),
                      )),
                      DataColumn(
                          label: TextWidget(
                        text: "Name",
                        fontSize: 16,
                        color: HexColor("#000000"),
                      )),
                      DataColumn(
                          label: TextWidget(
                        text: "Price",
                        fontSize: 16,
                        color: HexColor("#000000"),
                      )),
                    ],
                    rows: [
                      DataRow(cells: [
                        DataCell(TextWidget(
                            text: "1",
                            fontSize: 15,
                            color: HexColor("#000000"))),
                        DataCell(
                          TextWidget(
                              text: "បង្គាឆាពងទាប្រៃ",
                              fontSize: 15,
                              color: HexColor("#000000")),
                        ),
                        DataCell(
                          TextWidget(
                              text: "3.00",
                              fontSize: 15,
                              color: HexColor("#000000")),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(TextWidget(
                            text: "1",
                            fontSize: 15,
                            color: HexColor("#000000"))),
                        DataCell(
                          TextWidget(
                              text: "បង្គាឆាពងទាប្រៃ",
                              fontSize: 15,
                              color: HexColor("#000000")),
                        ),
                        DataCell(
                          TextWidget(
                              text: "3.00",
                              fontSize: 15,
                              color: HexColor("#000000")),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(TextWidget(
                            text: "1",
                            fontSize: 15,
                            color: HexColor("#000000"))),
                        DataCell(
                          TextWidget(
                              text: "បង្គាឆាពងទាប្រៃ",
                              fontSize: 15,
                              color: HexColor("#000000")),
                        ),
                        DataCell(
                          TextWidget(
                              text: "3.00",
                              fontSize: 15,
                              color: HexColor("#000000")),
                        ),
                      ]),
                      DataRow(cells: [
                        DataCell(TextWidget(
                            text: "1",
                            fontSize: 15,
                            color: HexColor("#000000"))),
                        DataCell(
                          TextWidget(
                              text: "បង្គាឆាពងទាប្រៃ",
                              fontSize: 15,
                              color: HexColor("#000000")),
                        ),
                        DataCell(
                          TextWidget(
                              text: "3.00",
                              fontSize: 15,
                              color: HexColor("#000000")),
                        ),
                      ]),
                    ],
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}
