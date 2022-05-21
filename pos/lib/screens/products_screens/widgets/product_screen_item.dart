import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductScreenItem extends StatelessWidget {
  final int flex;
  final String value;
  final bool isRowHeader;
  const ProductScreenItem({
    Key? key,
    required this.flex,
    required this.value,
    this.isRowHeader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: TextWidget(
            text: value,
            color: HexColor("#000000"),
            fontFamily: "Siemreap",
            fontSize: 15,
            // fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )),
    );
  }
}
