import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/screens/sale_table_screens/widgets/sale_table_widget.dart';

class SaleTableScreen extends GetResponsiveView<dynamic> {
  SaleTableScreen({Key? key}) : super(key: key);

  static const String routeName = "/table";

  @override
  Widget builder() {
    var _grid = 3;
    Get.width < 450
        ? _grid = 3
        : Get.width < 550
            ? _grid = 4
            : Get.width < 650
                ? _grid = 5
                : Get.width < 750
                    ? _grid = 6
                    : Get.width < 850
                        ? _grid = 7
                        : Get.width < 950
                            ? _grid = 8
                            : Get.width < 1050
                                ? _grid = 9
                                : Get.width < 1150
                                    ? _grid = 10
                                    : Get.width < 1250
                                        ? _grid = 11
                                        : _grid = 12;

    return Scaffold(
      appBar: AppBar(
        title: Text("table".tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      secondaryColor,
                    ),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        const Icon(Icons.add),
                        const SizedBox(width: 15),
                        Text("add_table".tr),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _grid,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  for (var i = 0; i < 20; i++)
                    SaleTableWidget(
                      onPressed: () {},
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
