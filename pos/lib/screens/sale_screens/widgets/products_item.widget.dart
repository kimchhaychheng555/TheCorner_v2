import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductsItemWidget extends StatelessWidget {
  final String? name;
  final double? price;
  final String? imaes;
  const ProductsItemWidget({
    Key? key,
    this.name,
    this.price,
    this.imaes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // fit: StackFit.passthrough,
        children: <Widget>[
          // Max Size Widget
          Container(
            height: 170,
            decoration: BoxDecoration(
              color: HexColor("#FFFFFF"),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: HexColor("#F16023"),
                width: 2,
              ),
            ),
            child: Center(
              child: Image.network(
                "https://cdn.tasteatlas.com//images/toplistarticles/fc20fbcfe5cd4690ba0cb9614192303a.jpg?w=375&h=280",
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                  color: HexColor("#F16023"),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  )),
              child: Center(
                  child: TextWidget(
                text: price.toString(),
                fontSize: 18,
              )),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                  color: HexColor("#F16023"),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: TextWidget(
                    text: name ?? "",
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
