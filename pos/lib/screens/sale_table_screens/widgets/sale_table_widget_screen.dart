import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleTableWidgetScreen extends StatelessWidget {
  final String? title;
  const SaleTableWidgetScreen({
    Key? key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        color: HexColor("#FFFFFF"),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: HexColor("#F16023"),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.3,
            offset: const Offset(0, 2),
            color: Colors.grey.withOpacity(0.2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                TextWidget(
                  text: title ?? "",
                  fontSize: 20,
                  color: HexColor("#F16023"),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Image.asset(
            "assets/images/tableOrange.png",
            width: 70,
          ),
        ],
      ),
    );
  }
}
