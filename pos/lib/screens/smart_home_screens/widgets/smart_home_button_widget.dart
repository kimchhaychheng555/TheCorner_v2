import 'package:flutter/material.dart';
import 'package:pos/widgets/text_widget.dart';

class SmartHomeButtonWidget extends StatelessWidget {
  // Set Paramater For Widget
  final String? title;
  final Color? backgroundColor, flatColor, textColor;
  final Icon? icon;
  final Icon? iconColor;
  final Function()? onPressed;
  final double borderRadius;
  final bool visible;
  const SmartHomeButtonWidget({
    Key? key,
    this.title,
    this.backgroundColor,
    this.textColor,
    this.flatColor,
    this.icon,
    this.iconColor,
    this.onPressed,
    this.borderRadius = 0,
    this.visible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              spreadRadius: 0.3,
              color: Colors.grey.withOpacity(0.2),
            ),
          ],
        ),
        child: Material(
          borderRadius: BorderRadius.circular(borderRadius),
          color: flatColor ?? Colors.white,
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            onTap: onPressed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 0.3,
                        offset: const Offset(0, 2),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ],
                  ),
                  child: icon,
                ),
                const SizedBox(height: 20),
                TextWidget(
                  text: title ?? "",
                  color: textColor ?? Colors.black,
                  fontSize: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
