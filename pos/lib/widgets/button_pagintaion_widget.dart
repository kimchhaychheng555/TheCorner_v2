import 'package:flutter/material.dart';

class ButtonPaginationWidget extends StatelessWidget {
  final Color? backgroundColor;
  final Function()? onPressed;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final double radius, width, height;
  const ButtonPaginationWidget({
    Key? key,
    this.backgroundColor,
    this.onPressed,
    this.child,
    this.margin,
    this.radius = 5,
    this.width = 40,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 2.5),
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onPressed,
          child: SizedBox(
            width: width,
            height: height,
            child: Center(child: child ?? Container()),
          ),
        ),
      ),
    );
  }
}
