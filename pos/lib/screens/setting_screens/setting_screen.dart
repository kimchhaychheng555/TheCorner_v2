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
          title: Text("setting".tr),
        ),
        body: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 20.0),
                width: 1000,
                height: 800,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: ListView(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(children: [
                              const CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(
                                    "https://tinypng.com/images/social/website.jpg"),
                              ),
                              Positioned(
                                bottom: 30,
                                right: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: HexColor("#019BDF"),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ]),
                            const SizedBox(height: 10),
                            TextWidget(
                              text: "Phenhchet SURT",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#000000"),
                            ),
                            const SizedBox(height: 5),
                            TextWidget(
                              text: "Admin",
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#104984"),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
