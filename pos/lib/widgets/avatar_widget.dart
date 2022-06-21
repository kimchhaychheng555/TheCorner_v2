import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final double maxRadius;
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  const AvatarWidget({
    Key? key,
    this.maxRadius = 50,
    this.child,
    this.backgroundColor,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: padding,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(maxRadius),
        ),
        width: maxRadius,
        height: maxRadius,
        child: child,
      ),
    );
  }
}
