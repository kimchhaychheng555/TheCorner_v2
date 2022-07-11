import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/button_action_widget.dart';
import 'package:pos/widgets/button_pagintaion_widget.dart';
import 'package:pos/widgets/text_form_field_widget.dart';
import 'package:get/get.dart';

class SaleTableModelWidget extends StatelessWidget {
  final TextEditingController? textController;
  final Function()? onCancelPressed, onDeletePressed;
  final Function(String)? onConfirmPressed;
  const SaleTableModelWidget({
    Key? key,
    this.textController,
    this.onCancelPressed,
    this.onConfirmPressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormFieldWidget(
                controller: textController,
              ),
            ),
            const SizedBox(width: 5),
            ButtonPaginationWidget(
              onPressed: onDeletePressed,
              backgroundColor: errorColor,
              child: const Icon(
                Icons.delete_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        ButtonActionWidget(
          cancelText: "cancel".tr,
          confirmText: "save".tr,
          onCancelPressed: onCancelPressed,
          onConfirmPressed: () {
            onConfirmPressed!(textController!.text);
          },
        ),
      ],
    );
  }
}
