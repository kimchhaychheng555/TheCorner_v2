import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';

class ButtonActionWidget extends StatelessWidget {
  final String? confirmText, cancelText;
  final Color? confirmBackground, cancelBackground;
  final Function()? onCancelPressed, onConfirmPressed;
  const ButtonActionWidget({
    Key? key,
    this.cancelText,
    this.confirmText,
    this.confirmBackground,
    this.cancelBackground,
    this.onCancelPressed,
    this.onConfirmPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                cancelBackground ?? errorColor),
          ),
          onPressed: onCancelPressed,
          child: Center(
            child: SizedBox(
              height: 40,
              child: Center(child: Text(cancelText ?? "")),
            ),
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                confirmBackground ?? successColor),
          ),
          onPressed: onConfirmPressed,
          child: SizedBox(
            height: 40,
            child: Center(
              child: Text(confirmText ?? ""),
            ),
          ),
        ),
      ],
    );
  }
}
