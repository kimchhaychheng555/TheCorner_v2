import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/business_controllers/sale_summary_report_controllers/sale_summary_report_controller.dart';
import 'package:pos/screens/business_report_screens/sale_summary_report_screens/widgets/sale_summary_report_table_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';

class SaleSummaryReportScreen extends GetResponsiveView<dynamic> {
  SaleSummaryReportScreen({Key? key}) : super(key: key);

  static String routeName = "/sale-summary-report";

  @override
  Widget builder() {
    SaleSummaryReportController _controller = Get.find();
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    return Obx(
      () => Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text("sale_summary_report".tr),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.keyboard_backspace),
          ),
          actions: [
            IconButton(
              splashRadius: 30,
              onPressed: () {
                _controller.onLoad();
              },
              icon: const Icon(Icons.refresh_outlined),
            ),
            // IconButton(
            //   splashRadius: 30,
            //   onPressed: () {
            //     print(jsonEncode(ExpenseModel()));
            //   },
            //   icon: const Icon(Icons.filter_list_rounded),
            // ),
          ],
        ),
        body: LoadingOverlayWidget(
          isLoading: _controller.isLoading.value,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: const [
                Expanded(
                  child: SaleSummaryReportTableWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // @override
    // Widget builder() {
    //   SaleSummaryReportController _controller = Get.find();
    //   final GlobalKey<ScaffoldState> _key = GlobalKey();
    //   return Obx(
    //     () => Scaffold(
    //       key: _key,
    //       appBar: AppBar(
    //         title: Text("report".tr),
    //         leading: IconButton(
    //           onPressed: () => Get.back(),
    //           icon: const Icon(Icons.keyboard_backspace),
    //         ),
    //         actions: [
    //           IconButton(
    //             onPressed: () => _controller.onLoad(),
    //             icon: const Icon(Icons.refresh_rounded),
    //           ),
    //         ],
    //       ),
    //       body: LoadingOverlayWidget(
    //         isLoading: _controller.isLoading.value,
    //         child: Container(
    //           color: Colors.white,
    //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //           child: Column(
    //             children: const [
    //               Expanded(
    //                 child: SaleSummaryReportTableWidget(),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
    // }
  }
}
