import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductScreenWidget extends StatelessWidget {
  final int flex;
  final String value;
  final bool isRowHeader;
  const ProductScreenWidget({
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
            fontSize: 16,
            fontWeight: FontWeight.w500,
            textAlign: TextAlign.center,
          )
          // Text(
          //   value,
          //   style:
          //       isRowHeader ? const TextStyle(fontWeight: FontWeight.w200) : null,
          // ),
          ),
    );
  }
}
