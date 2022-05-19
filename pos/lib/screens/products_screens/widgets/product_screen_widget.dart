import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductScreenWidget extends StatelessWidget {
  final String? nummer, name;
  final double fontSize;
  final Color? color;

  const ProductScreenWidget({
    Key? key,
    this.nummer,
    this.name,
    this.color,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      DataTable(
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
                fontSize: fontSize,
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
    ]);
  }
}
