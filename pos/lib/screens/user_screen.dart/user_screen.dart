import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/widgets/text_widget.dart';

class UserScreen extends GetResponsiveView<dynamic> {
  UserScreen({Key? key}) : super(key: key);

  static const String routeName = "/user";

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
                  child: ListView(children: [
                    Card(
                      color: Colors.white,
                      // elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Card(
                                elevation: 0.5,
                                child: ListTile(
                                  title: TextWidget(
                                    text: "privacy_setting".tr,
                                    color: HexColor("#0169F8"),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                )),
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 10),
                              child: ListTile(
                                leading: Icon(
                                  Icons.language,
                                  color: Colors.blue,
                                  size: 40,
                                ),
                                title: TextWidget(
                                  text: "language",
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 160),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: "english".tr,
                                          color: HexColor("#000000"),
                                          fontSize: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        Transform.scale(
                                            scale: 1.3,
                                            child: Checkbox(
                                              checkColor: Colors.white,
                                              value: false,
                                              onChanged: (bool? value) {},
                                            ))
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: "khmer".tr,
                                          fontFamily: 'Siemreap',
                                          color: HexColor("#000000"),
                                          fontSize: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        Transform.scale(
                                            scale: 1.3,
                                            child: Checkbox(
                                              checkColor: Colors.white,
                                              value: false,
                                              onChanged: (bool? value) {},
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: ListTile(
                                leading: Icon(
                                  Icons.send,
                                  color: HexColor("#0F99FC"),
                                  size: 40,
                                ),
                                title: TextWidget(
                                  text: "sent_telegram".tr,
                                  fontSize: 18,
                                  color: HexColor("#000000"),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 160),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: "agree".tr,
                                          color: HexColor("#000000"),
                                          fontSize: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        Transform.scale(
                                            scale: 1.3,
                                            child: Checkbox(
                                              checkColor: HexColor("#FFFFFF"),
                                              value: false,
                                              onChanged: (bool? value) {},
                                            ))
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: "disagree".tr,
                                          color: HexColor("#000000"),
                                          fontSize: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        Transform.scale(
                                            scale: 1.3,
                                            child: Checkbox(
                                              checkColor: HexColor("#FFFFFF"),
                                              value: false,
                                              onChanged: (bool? value) {},
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.wifi_protected_setup,
                                  color: Colors.blue,
                                  size: 40,
                                ),
                                title: TextWidget(
                                  text: "vat".tr,
                                  fontSize: 18,
                                  color: HexColor("#000000"),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 160),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: "agree".tr,
                                          color: HexColor("#000000"),
                                          fontSize: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        Transform.scale(
                                            scale: 1.3,
                                            child: Checkbox(
                                              checkColor: HexColor("#FFFFFF"),
                                              value: false,
                                              onChanged: (bool? value) {},
                                            ))
                                      ],
                                    ),
                                    const SizedBox(width: 20),
                                    Row(
                                      children: [
                                        TextWidget(
                                          text: "disagree".tr,
                                          color: HexColor("#000000"),
                                          fontSize: 18,
                                        ),
                                        const SizedBox(width: 10),
                                        Transform.scale(
                                            scale: 1.3,
                                            child: Checkbox(
                                              checkColor: HexColor("#FFFFFF"),
                                              value: false,
                                              onChanged: (bool? value) {},
                                            ))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Card(
                                elevation: 0.3,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.logout,
                                      color: HexColor("#FF0D19"),
                                      size: 40,
                                    ),
                                    title: TextWidget(
                                      text: "log_out".tr,
                                      color: HexColor("#FF0D19"),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ));
  }
}
