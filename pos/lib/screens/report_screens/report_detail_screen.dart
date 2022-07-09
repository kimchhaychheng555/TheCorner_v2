import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/controllers/report_controllers/report_detail_controller.dart';
import 'package:pos/screens/report_screens/widgets/report_detail_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class ReportDetailScreen extends GetResponsiveView<dynamic> {
  ReportDetailScreen({Key? key}) : super(key: key);

  static const String routeName = "/reports-detail";

  @override
  Widget builder() {
    ReportDetailController _controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("report_detail".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
        ),
        body: LoadingOverlayWidget(
            isLoading: _controller.isLoading.value,
            child: Container(
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
                            const SizedBox(height: 20),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(height: 30),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextWidget(
                                      text: "Logo".tr,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor("#005FF2"),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: "invoice".tr,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor("#333440"),
                                    ),
                                    TextWidget(
                                      text: "july-09-2022".tr,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: HexColor("#333440"),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 50),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: TextWidget(
                                          text: "task_descriptipn".tr,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#333440"),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextWidget(
                                          text: "rate".tr,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#333440"),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextWidget(
                                          text: "hours".tr,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#333440"),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: TextWidget(
                                          text: "total".tr,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: HexColor("#333440"),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 30),
                                const ReportDetailWidget(
                                  name: "មានដុត",
                                  rate: "0.12",
                                  hours: "2am",
                                  total: "100\$",
                                ),
                                const SizedBox(height: 30),
                                const ReportDetailWidget(
                                  name: "មានដុត",
                                  rate: "0.12",
                                  hours: "2am",
                                  total: "100\$",
                                ),
                                const SizedBox(height: 30),
                                const ReportDetailWidget(
                                  name: "មានដុត",
                                  rate: "0.12",
                                  hours: "2am",
                                  total: "100\$",
                                ),
                                const SizedBox(height: 50),
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: TextWidget(
                                            text: "task_descriptipn".tr,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#333440"),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Expanded(
                                          child: TextWidget(
                                            text: "rate".tr,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#333440"),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: TextWidget(
                                            text: "hours".tr,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor("#333440"),
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
