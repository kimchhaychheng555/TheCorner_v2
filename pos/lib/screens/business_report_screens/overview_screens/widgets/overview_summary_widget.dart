import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:get/get.dart';

class OverviewSummaryWidget extends StatelessWidget {
  final String name;
  final int value;
  const OverviewSummaryWidget(
      {Key? key, required this.name, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: name.tr,
                fontFamily: 'Siemreap',
                fontSize: 17,
                color: HexColor("#104984"),
              ),
              TextWidget(
                text: "$value",
                fontFamily: 'Siemreap',
                fontSize: 17,
                color: HexColor("#D98D0D"),
              ),
            ],
          ),
        ),
        Divider(
          color: HexColor("#92A5BA"),
          height: 0.5,
        ),
      ],
    );
  }
}
