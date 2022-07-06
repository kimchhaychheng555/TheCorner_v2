import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleProductWidget extends StatelessWidget {
  final ProductModel product;
  final Function(ProductModel)? onPressed;

  const SaleProductWidget({
    Key? key,
    required this.product,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: "${AppService.baseUrl}uploads/${product.image}",
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => _containerImage(
            imageProvider: const AssetImage("assets/images/noimage.png"),
            product: product,
          ),
          imageBuilder: (context, image) => _containerImage(
            imageProvider: image,
            product: product,
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onPressed!(product),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _containerImage({
  required ProductModel product,
  required ImageProvider imageProvider,
}) {
  return Container(
    clipBehavior: Clip.hardEdge,
    padding: const EdgeInsets.all(0),
    decoration: BoxDecoration(
      border: Border.all(color: secondaryColor, width: 2),
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
      image: DecorationImage(
        image: imageProvider,
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
            text: "\$ ${product.price?.toDouble().toString()}",
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: secondaryColor,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: TextWidget(
            textAlign: TextAlign.center,
            text: product.name ?? "",
            fontSize: 16,
            fontFamily: "Siemreap",
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
