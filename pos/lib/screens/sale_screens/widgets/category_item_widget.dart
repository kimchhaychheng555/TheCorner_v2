import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class CategoryItemWidgets extends StatelessWidget {
  final String? name;
  final Color? background;
  final double? width, height;

  const CategoryItemWidgets({
    Key? key,
    this.name,
    this.background,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // color: Colors.red,
        border: Border.all(
          color: HexColor("#F16023"),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextWidget(
          text: name ?? "",
          fontSize: 15,
          color: HexColor("#000000"),
        ),
      ),
    );

    // );
  }
}
