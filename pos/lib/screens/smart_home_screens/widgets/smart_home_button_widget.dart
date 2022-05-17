import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class SmartHomeButtonWidget extends StatelessWidget {
  // Set Paramater For Widget
  final String? title;
  final Color? backgroundColor;
  final Icon? icon;
  final Icon? iconColor;
  const SmartHomeButtonWidget({
    Key? key,
    this.title,
    this.backgroundColor,
    this.icon,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: HexColor("#ffffff"),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 0.3,
              offset: const Offset(0, 2),
              color: Colors.grey.withOpacity(0.2),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    spreadRadius: 0.3,
                    offset: const Offset(0, 2),
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]),
            child: icon,
          ),
          const SizedBox(height: 20),
          TextWidget(
            text: title ?? "",
            color: Colors.black,
            fontSize: 15,
          ),
        ],
      ),
    );
  }
}
