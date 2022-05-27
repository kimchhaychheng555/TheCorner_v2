import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleProductItemWidget extends StatelessWidget {
  final int keyValue;
  final SaleProductModel saleProduct;
  final Function()? onPressed, onDeletePressed;
  const SaleProductItemWidget({
    Key? key,
    required this.keyValue,
    required this.saleProduct,
    this.onPressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Slidable(
        key: ValueKey(keyValue),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                if (onDeletePressed != null) {
                  onDeletePressed!();
                }
              },
              backgroundColor: errorColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Material(
          child: ListTile(
            onTap: onPressed,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            leading: CachedNetworkImage(
              imageUrl: "${AppService.baseUrl}uploads/${saleProduct.image}",
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  "${AppService.baseUrl}uploads/${saleProduct.image}",
                ),
              ),
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(
                  "${AppService.baseUrl}uploads/noimage.png",
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: saleProduct.product_name ?? "",
                  color: Colors.black,
                  fontFamily: "Siemreap",
                ),
                TextWidget(
                  text:
                      "${saleProduct.quantity} x ${AppService.currencyFormat(saleProduct.price)}",
                  color: textColor,
                  fontSize: 12,
                  fontFamily: "Siemreap",
                ),
              ],
            ),
            trailing: TextWidget(
              text: (saleProduct.is_free)
                  ? "free".tr
                  : AppService.currencyFormat(
                      ((saleProduct.price ?? 0) * (saleProduct.quantity ?? 1))),
              color: (saleProduct.is_free) ? successColor : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
