import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/text_widget.dart';

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
                color: Color.fromARGB(255, 84, 18, 18),
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
}
