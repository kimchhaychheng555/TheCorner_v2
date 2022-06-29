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
                                    "https://1.bp.blogspot.com/-MPERJogHDwk/XOtBSslix6I/AAAAAAAAALc/R-p7KNm9lOUCCTEQSalvD5k-im03CnZvQCLcBGAs/s1600/61376338_2367029796688087_349062360196972544_n.jpg"),
                              ),
                              Positioned(
                                bottom: 30,
                                right: 10,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: HexColor("#5CA0FB"),
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
                              color: HexColor("#104984"),
                            ),
                            const SizedBox(height: 5),
                            TextWidget(
                              text: "admin".tr,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#104984"),
                            ),
                            const SizedBox(height: 20),
                            Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const SizedBox(height: 30),
                                  TextWidget(
                                    text: "privacy_setting".tr,
                                    fontSize: 25,
                                    // fontFamily: "Siemreap",
                                    fontWeight: FontWeight.w500,
                                    color: HexColor("#005FF2"),
                                  ),
                                  const SizedBox(height: 30),
                                  InkWell(
                                    onTap: () {},
                                    child: ListTile(
                                      title: TextWidget(
                                        text: "language".tr,
                                        fontSize: 20,
                                        color: HexColor("#000000"),
                                      ),
                                      leading: Icon(
                                        Icons.language,
                                        size: 30,
                                        color: HexColor("#005FF2"),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  InkWell(
                                    onTap: () {},
                                    child: ListTile(
                                      title: TextWidget(
                                        text: "send_to_log_telegram".tr,
                                        fontSize: 20,
                                        color: HexColor("#000000"),
                                      ),
                                      leading: Icon(
                                        Icons.telegram,
                                        size: 30,
                                        color: HexColor("#005FF2"),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  InkWell(
                                    onTap: () {},
                                    child: ListTile(
                                      title: TextWidget(
                                        text: "allow_vat".tr,
                                        fontSize: 20,
                                        color: HexColor("#000000"),
                                      ),
                                      leading: Icon(
                                        Icons.account_balance,
                                        size: 30,
                                        color: HexColor("#005FF2"),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  InkWell(
                                    onTap: () {},
                                    child: ListTile(
                                      title: TextWidget(
                                        text: "log_out".tr,
                                        fontSize: 20,
                                        color: HexColor("#FC181F"),
                                      ),
                                      leading: Icon(
                                        Icons.logout,
                                        size: 30,
                                        color: HexColor("#FC181F"),
                                      ),
                                      trailing:
                                          const Icon(Icons.arrow_forward_ios),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
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
