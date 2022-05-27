import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/sale_controllers/sale_controller.dart';
import 'package:pos/screens/sale_screens/widgets/sale_item_product_widget.dart';
import 'package:pos/screens/sale_screens/widgets/sale_product_widget.dart';
import 'package:pos/widgets/action_chip_widget.dart';
import 'package:pos/widgets/button_widget.dart';
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
                                  onPressed: _controller.onProductPressed,
                                ),
                              )
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buttonActionWidget(),
                    ],
                  ),
                ),
              ),
              _rightSideWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rightSideWidget() {
    SaleController _controller = Get.find();
    return Obx(
      () => Container(
        color: HexColor("#F2EEF6"),
        width: 300,
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                color: Colors.white,
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
                                            .map((table) {
                                          return DropdownMenuItem(
                                            enabled: (table.isActive ?? false)
                                                ? false
                                                : true,
                                            child: TextWidget(
                                              text: "${table.name}",
                                              color: (table.isActive ?? false)
                                                  ? secondaryColor
                                                  : textColor,
                                            ),
                                            value: table.id,
                                          );
                                        }),
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
                    Expanded(
                      child: (_controller.sale.value?.sale_products ?? [])
                              .isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              controller:
                                  ScrollController(keepScrollOffset: true),
                              itemCount:
                                  (_controller.sale.value?.sale_products ?? [])
                                      .length,
                              itemBuilder: (c, index) {
                                var _sp =
                                    (_controller.sale.value?.sale_products ??
                                        [])[index];
                                return SaleProductItemWidget(
                                  keyValue: index,
                                  saleProduct: _sp,
                                  onPressed: () =>
                                      _controller.onSaleProductItemPressed(_sp),
                                  onDeletePressed: () => _controller
                                      .onSaleProductItemDeletePressed(_sp),
                                );
                              },
                            )
                          : Center(
                              child: TextWidget(
                                text: "empty".tr,
                                color: Colors.black38,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ButtonWidget(
                  radius: 50,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 30,
                  ),
                  border: const Border(top: BorderSide.none),
                  backgroundColor: successColor,
                  onPressed: _controller.onPayPressed,
                  child: TextWidget(
                    textAlign: TextAlign.center,
                    text: "pay".tr,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget _buttonActionWidget() {
    SaleController _controller = Get.find();
    return Row(
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
          onPressed: _controller.onCancelBillPressed,
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
          onPressed: _controller.onHoldBillPressed,
          child: TextWidget(
            text: "hold_bill".tr,
          ),
        ),
      ],
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
