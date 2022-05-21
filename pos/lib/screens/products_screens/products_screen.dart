import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/screens/products_screens/widgets/product_screen_item.dart';
import 'package:pos/screens/products_screens/widgets/product_screen_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductScren extends GetResponsiveView<dynamic> {
  ProductScren({Key? key}) : super(key: key);

  static const String routeName = "/products";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products".tr),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              width: 1200,
              height: 800,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2,
                      spreadRadius: 0.2,
                      offset: const Offset(0, 2),
                      color: Colors.grey.withOpacity(0.2),
                    )
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 130,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: HexColor("#F16023"),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 0.2,
                                  offset: const Offset(0, 2),
                                  color: HexColor("#898989").withOpacity(0.2),
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 20,
                                color: HexColor("#ffffff"),
                              ),
                              const SizedBox(width: 5),
                              TextWidget(
                                text: "add_product".tr,
                                color: HexColor("#ffffff"),
                                fontSize: 15,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductScreenWidget(
                          isRowHeader: true, flex: 2, value: "n_o".tr),
                      ProductScreenWidget(
                          isRowHeader: true,
                          flex: 3,
                          value: "name_of_product".tr),
                      ProductScreenWidget(
                          isRowHeader: true, flex: 3, value: "price".tr),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                      child: ListView.separated(
                    itemCount: 25,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(),
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: const [
                          ProductScreenItem(
                              isRowHeader: true, flex: 2, value: "1"),
                          ProductScreenItem(
                              isRowHeader: true,
                              flex: 3,
                              value: "បង្គាឆាពងទាប្រៃ"),
                          ProductScreenItem(
                              isRowHeader: true, flex: 3, value: "3.00"),
                        ],
                      );
                    },
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
