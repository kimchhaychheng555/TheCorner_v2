import 'package:flutter/material.dart';
import 'package:pos/widgets/button_widget.dart';

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
        child: ButtonWidget(
          radius: radius,
          child: child,
          padding: padding,
          border: border,
          onPressed: onPressed,
          backgroundColor: backgroundColor,
          margin: margin,
        ),
      ),
    );
  }
}
