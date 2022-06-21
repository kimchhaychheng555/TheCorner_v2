import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/text_widget.dart';

class DropdownButtonFormFieldWidget<T> extends StatelessWidget {
  final String? label;
  final T? value;
  final bool readOnly;
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  final String? Function(T?)? validator;
  const DropdownButtonFormFieldWidget({
    Key? key,
    this.label,
    this.value,
    this.readOnly = false,
    required this.items,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: readOnly,
      child: DropdownButtonFormField<T>(
        validator: validator,
        items: items,
        onChanged: onChanged,
        value: value,
        focusColor: Colors.transparent,
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
      ),
    );
  }
}
