import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class ReportDetailWidget extends StatelessWidget {
  final String? description;
  final int? qty;
  final String? subTable;
  final String? discount;
  final String? grandTotal;
  const ReportDetailWidget({
    Key? key,
    this.description,
    this.qty,
    this.subTable,
    this.discount,
    this.grandTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: TextWidget(
            text: description ?? "".tr,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: HexColor("#333440"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: TextWidget(
            text: qty.toString().tr,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: HexColor("#333440"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: TextWidget(
            text: subTable ?? "".tr,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: HexColor("#333440"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: TextWidget(
            text: discount ?? "".tr,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: HexColor("#333440"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: TextWidget(
            text: grandTotal ?? "".tr,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: HexColor("#333440"),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
