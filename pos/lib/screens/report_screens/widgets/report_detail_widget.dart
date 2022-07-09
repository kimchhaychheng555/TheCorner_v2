import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class ReportDetailWidget extends StatelessWidget {
  final String? name;
  final String? rate;
  final String? hours;
  final String? total;
  const ReportDetailWidget({
    Key? key,
    this.name,
    this.rate,
    this.hours,
    this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 4,
          child: TextWidget(
            text: name ?? "".tr,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: HexColor("#333440"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: TextWidget(
            text: rate ?? "".tr,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: HexColor("#333440"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: TextWidget(
            text: hours ?? "".tr,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: HexColor("#333440"),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: TextWidget(
            text: total ?? "".tr,
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
