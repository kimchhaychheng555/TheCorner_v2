import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/sale_controllers/sale_controller.dart';
import 'package:pos/screens/sale_screens/widgets/sale_product_widget.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/action_chip_widget.dart';
import 'package:pos/widgets/loading_overlay_widget.dart';
import 'package:pos/widgets/text_widget.dart';

class SaleScreen extends GetResponsiveView<dynamic> {
  SaleScreen({Key? key}) : super(key: key);

  static const String routeName = "/sale";

  @override
  Widget builder() {
    SaleController _controller = Get.find();
    return Obx(
      () => LoadingOverlayWidget(
        isLoading: _controller.isLoading.value,
        child: Scaffold(
          appBar: AppBar(
            title: Text("sale".tr),
          ),
          body: Row(
            children: [
              Expanded(
                child: Container(
                  color: HexColor("#F2EEF6"),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _categoriesWidget(),
                      const SizedBox(height: 5),
                      Expanded(
                        child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: 150,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          children: [
                            for (var i = 0; i < 20; i++)
                              ..._controller.productList.map(
                                (p) => SaleProductWidget(
                                  product: p,
                                  onPressed: (_) {
                                    print(AppService.currentStartSale?.date);
                                  },
                                ),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      _buttonActionWidget(),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: 300,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "check_out".tr,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            TextWidget(
                              text: "table".tr,
                              color: textColor,
                            ),
                            const SizedBox(width: 5),
                            if (_controller.saleTableCtrl.tableList.isNotEmpty)
                              SizedBox(
                                width: 100,
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    focusColor: Colors.red,
                                    hoverColor: Colors.red,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 0,
                                    ),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      hint: TextWidget(
                                        text: "table".tr,
                                        color: textColor,
                                      ),
                                      value: _controller.table.value?.id,
                                      focusColor: Colors.transparent,
                                      isDense: true,
                                      isExpanded: true,
                                      items: [
                                        ..._controller.saleTableCtrl.tableList
                                            .map(
                                          (table) => DropdownMenuItem(
                                            child: TextWidget(
                                              text: "${table.name}",
                                              color: textColor,
                                            ),
                                            value: table.id,
                                          ),
                                        ),
                                      ],
                                      onChanged: _controller.onTableChanged,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buttonActionWidget() {
    // SaleController _controller = Get.find();
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ActionChipWidget(
            radius: 50,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            backgroundColor: errorColor,
            border: const Border(top: BorderSide.none),
            onPressed: () {},
            child: TextWidget(
              text: "cancel_bill".tr,
            ),
          ),
          ActionChipWidget(
            radius: 50,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 30,
            ),
            border: const Border(top: BorderSide.none),
            backgroundColor: infoColor,
            onPressed: () {},
            child: TextWidget(
              text: "hold_bill".tr,
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesWidget() {
    SaleController _controller = Get.find();
    return Obx(
      () => SizedBox(
        height: 50,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.only(left: 5),
            scrollDirection: Axis.horizontal,
            children: [
              ..._controller.categoryList.map(
                (category) => ActionChipWidget(
                  radius: 50,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 30,
                  ),
                  backgroundColor:
                      _controller.categorySelected.value?.id == category.id
                          ? secondaryColor
                          : Colors.white,
                  onPressed: () => _controller.onCategoryPressed(category),
                  child: TextWidget(
                    text: category.name ?? "",
                    color: _controller.categorySelected.value?.id == category.id
                        ? Colors.white
                        : textColor,
                    fontFamily: "Siemreap",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
