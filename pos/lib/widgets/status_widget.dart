import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin;
  const StatusWidget({
    Key? key,
    this.child,
    this.backgroundColor,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      ),
    );
  }
}
