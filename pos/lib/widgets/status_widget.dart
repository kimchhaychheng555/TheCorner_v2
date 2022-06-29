import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final Widget? child;
  final Color? backgroundColor;
  const StatusWidget({
    Key? key,
    this.child,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
