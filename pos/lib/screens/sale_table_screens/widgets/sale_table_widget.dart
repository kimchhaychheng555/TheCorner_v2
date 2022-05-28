import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleTableWidget extends StatelessWidget {
  final String title;
  final double? amount;
  final bool active;
  final Function()? onPressed, onLongPressed;
  const SaleTableWidget({
    Key? key,
    this.title = "",
    this.amount,
    this.active = false,
    this.onPressed,
    this.onLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
      child: InkWell(
        onLongPress: onLongPressed,
        borderRadius: BorderRadius.circular(5),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: active ? secondaryColor : secondaryShadeColor,
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != "")
                TextWidget(
                  text: title,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: active ? secondaryColor : secondaryShadeColor,
                ),
              SvgPicture.asset(
                "assets/svg/table.svg",
                color: active ? secondaryColor : secondaryShadeColor,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
