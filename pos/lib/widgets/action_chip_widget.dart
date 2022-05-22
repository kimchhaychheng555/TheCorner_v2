import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';

class ActionChipWidget extends StatelessWidget {
  final double radius;
  final Widget? child;
  final EdgeInsetsGeometry? padding, margin;
  final BoxBorder? border;
  final Function()? onPressed;
  final Color? backgroundColor;

  const ActionChipWidget({
    Key? key,
    this.radius = 5,
    this.child,
    this.padding,
    this.border,
    this.onPressed,
    this.backgroundColor,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin ?? const EdgeInsets.only(right: 5),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            radius: radius,
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                border: border ?? Border.all(color: secondaryColor),
              ),
              padding: padding ??
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
