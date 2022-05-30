import 'package:flutter/material.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleTableModelWidget extends StatelessWidget {
  const SaleTableModelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [TextWidget(text: "")],
    );
  }
}
