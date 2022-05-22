import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleProductWidget extends StatelessWidget {
  final String? imageUrl, productName;
  final double? price;
  const SaleProductWidget({
    Key? key,
    this.imageUrl,
    this.productName,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        border: Border.all(color: secondaryColor, width: 2),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        image: DecorationImage(
          image: CachedNetworkImageProvider(
            imageUrl ?? "",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextWidget(
              text: "\$ ${price?.toDouble().toString()}",
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(5),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: TextWidget(
              text: productName ?? "",
              fontSize: 16,
              fontFamily: "Siemreap",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
