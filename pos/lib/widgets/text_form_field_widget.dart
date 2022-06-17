import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/text_widget.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? value;
  final String? fontFamily;
  final bool readOnly, isNumberic;
  final TextInputType? keyboardType;
  const TextFormFieldWidget({
    Key? key,
    this.controller,
    this.label,
    this.value,
    this.fontFamily,
    this.readOnly = false,
    this.isNumberic = false,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: isNumberic
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            ]
          : null,
      keyboardType: keyboardType,
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
