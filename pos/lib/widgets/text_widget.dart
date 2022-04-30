import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color? color;
  final FontWeight? fontWeight;
  final double fontSize;
  final double? height;
  final FontStyle? fontStyle;
  final TextAlign textAlign;
  final TextDecoration? textDecoration;
  const TextWidget({
    Key? key,
    required this.text,
    this.fontFamily,
    this.color,
    this.fontWeight,
    this.fontSize = 14,
    this.height,
    this.fontStyle,
    this.textAlign = TextAlign.left,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color ?? Colors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize,
        fontFamily: fontFamily,
        height: height,
        decoration: textDecoration,
        fontStyle: fontStyle,
      ),
    );
  }
}
