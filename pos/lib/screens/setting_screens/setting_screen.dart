import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class SettingScreen extends GetResponsiveView<dynamic> {
  SettingScreen({Key? key}) : super(key: key);

  static const String routeName = "/setting";

  @override
  Widget builder() {
    return Scaffold(
        appBar: AppBar(
          title: TextWidget(text: "setting".tr),
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: 1000,
                height: 800,
                // height: 700,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: HexColor("#ffffff"),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 2,
                        spreadRadius: 0.2,
                        offset: const Offset(0, 2),
                        color: HexColor("#000000").withOpacity(0.2),
                      )
                    ]),

                // child: Stack(
                //   children: [
                //     Positioned(
                //       top: 0,
                //       left: 0,
                //       child: Container(
                //         width: 400,
                //         height: 800,
                //         decoration: BoxDecoration(
                //             borderRadius: const BorderRadius.only(
                //               topLeft: Radius.circular(15),
                //               bottomLeft: Radius.circular(15),
                //             ),
                //             color: Colors.red,
                //             boxShadow: [
                //               BoxShadow(
                //                 blurRadius: 2,
                //                 spreadRadius: 0.2,
                //                 offset: const Offset(0, 2),
                //                 color: HexColor("#000000").withOpacity(0.2),
                //               )
                //             ]),
                //       ),
                //     ),
                //     Positioned(
                //       top: 0,
                //       right: 0,
                //       child: Container(
                //         width: 600,
                //         height: 800,
                //         decoration: BoxDecoration(
                //             borderRadius: const BorderRadius.only(
                //               topRight: Radius.circular(15),
                //               bottomRight: Radius.circular(15),
                //             ),
                //             color: Colors.green,
                //             boxShadow: [
                //               BoxShadow(
                //                 blurRadius: 2,
                //                 spreadRadius: 0.2,
                //                 offset: const Offset(0, 2),
                //                 color: HexColor("#000000").withOpacity(0.2),
                //               )
                //             ]),
                //       ),
                //     ),
                //   ],
                // ),
              ),
            ),
          ],
        ));
  }
}
