import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/text_widget.dart';

class TablePageWidget extends StatelessWidget {
  const TablePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: TextWidget(
                text: "Name",
                color: textColor,
              ),
            ),
            Expanded(
              child: TextWidget(
                text: "Price",
                color: textColor,
              ),
            ),
            Expanded(
              child: TextWidget(
                text: "Category",
                color: textColor,
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}
