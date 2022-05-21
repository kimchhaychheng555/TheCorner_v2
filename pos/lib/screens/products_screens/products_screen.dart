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
        title: Text("Products".tr),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              width: 1200,
              height: 800,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 0.2,
                      offset: const Offset(0, 2),
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor("#F16023"),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 0.2,
                                  offset: const Offset(0, 2),
                                  color: HexColor("#898989").withOpacity(0.2),
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: HexColor("#ffffff"),
                              ),
                              const SizedBox(width: 5),
                              TextWidget(
                                text: "Add Products",
                                color: HexColor("#ffffff"),
                                fontSize: 15,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SizedBox(
                      width: 1000,
                      height: 500,
                      child: ListView(children: [
                        DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                            (states) {
                              return HexColor("#F1F1F1");
                            },
                          ),
                          columns: [
                            DataColumn(
                                label: TextWidget(
                              text: "No",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HexColor("#000000"),
                            )),
                            DataColumn(
                                label: TextWidget(
                              text: "Name",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HexColor("#000000"),
                            )),
                            DataColumn(
                                label: TextWidget(
                              text: "Price",
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: HexColor("#000000"),
                            )),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(TextWidget(
                                  text: "1",
                                  fontSize: 15,
                                  fontFamily: 'Siemreap',
                                  color: HexColor("#000000"))),
                              DataCell(
                                TextWidget(
                                    text: "បង្គាឆាពងទាប្រៃ",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                              DataCell(
                                TextWidget(
                                    text: "3.00",
                                    fontSize: 15,
                                    fontFamily: 'Siemreap',
                                    color: HexColor("#000000")),
                              ),
                            ]),
                          ],
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
