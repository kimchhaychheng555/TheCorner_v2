import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class OverviewScreenWidget extends StatelessWidget {
  // Set Paramater For Widget
  final String? title, subtitle, total;
  final Color? totalColor, textColor, backgroundColor, borderColor, shadowColor;
  final Icon? icon;
  final Icon? iconColor;
  const OverviewScreenWidget({
    Key? key,
    this.title,
    this.totalColor,
    this.textColor,
    this.icon,
    this.iconColor,
    this.subtitle,
    this.total,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor ?? HexColor("#50B402")),
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(3, 3),
            color: shadowColor ?? HexColor("#50B402").withOpacity(0.2),
          )
        ],
        color: HexColor("#FFFFFF"),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: title ?? "",
                      fontSize: 16,
                      color: HexColor("7D7D7D"),
                    ),
                    TextWidget(
                      text: subtitle ?? "",
                      fontSize: 12,
                      color: HexColor("7D7D7D"),
                    ),
                  ],
                ),
                TextWidget(
                  text: total ?? "",
                  fontSize: 25,
                  color: totalColor,
                ),
              ],
            ),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: backgroundColor,
              ),
              child: icon ??
                  const Icon(
                    Icons.shopping_cart,
                  ),
            )
          ],
        ),
      ),
    ));
  }
}
