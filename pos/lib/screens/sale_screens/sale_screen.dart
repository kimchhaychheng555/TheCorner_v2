import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/screens/sale_screens/widgets/products_item.widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SaleScreen extends GetResponsiveView<dynamic> {
  SaleScreen({Key? key}) : super(key: key);

  static const String routeName = "/sale";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: "sale".tr,
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: HexColor("#FFFFFF"),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                        color: HexColor("#B3CBFA"),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Center(
                            child: TextWidget(
                              text: "specail_offer".tr,
                              color: HexColor("#091124"),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                  Expanded(
                    child: _buildItemGridList(),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: 350,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.18),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemGridList() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child:
          ResponsiveGridList(desiredItemWidth: 150, minSpacing: 10, children: [
        ProductsItemWidget(
          name: "ឆាក្ដៅ",
          price: 3.00,
        ),
        ProductsItemWidget(
          name: "ឆាក្ដៅ",
          price: 3.00,
        ),
        ProductsItemWidget(
          name: "ឆាក្ដៅ",
          price: 3.00,
        ),
        ProductsItemWidget(
          name: "ឆាក្ដៅ",
          price: 3.00,
        ),
        ProductsItemWidget(
          name: "ឆាក្ដៅ",
          price: 3.00,
        ),
        ProductsItemWidget(
          name: "ឆាក្ដៅ",
          price: 3.00,
        ),
        ProductsItemWidget(
          name: "ឆាក្ដៅ",
          price: 3.00,
        ),
      ]),
    );
  }
}
