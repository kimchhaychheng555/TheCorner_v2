import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';

class IconTextButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final Widget? label, icon;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  const IconTextButtonWidget({
    Key? key,
    this.label,
    this.icon,
    this.padding,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          padding ?? const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          backgroundColor ?? primaryColor,
        ),
      ),
      icon: icon ?? Container(),
      label: label ?? Container(),
      onPressed: onPressed,
    );
  }
}
