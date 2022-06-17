import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/text_widget.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? value;
  final String? fontFamily;
  final bool readOnly;
  const TextFormFieldWidget({
    Key? key,
    this.controller,
    this.label,
    this.value,
    this.fontFamily,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller ?? TextEditingController(text: value),
      style: TextStyle(fontFamily: fontFamily, color: textColor),
      decoration: InputDecoration(
        isDense: true,
        label: TextWidget(
          text: label ?? "",
          color: textColor,
        ),
        hintText: label,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
