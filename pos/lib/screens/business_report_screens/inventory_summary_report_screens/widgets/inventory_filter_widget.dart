import 'package:flutter/material.dart';
import 'package:pos/constants/constants.dart';
import 'package:pos/controllers/business_controllers/inventory_summary_report_controller/inventory_summary_report_controller.dart';
import 'package:pos/widgets/button_widget.dart';
import 'package:pos/widgets/dropdown_button_form_field_widget.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:get/get.dart';

class InventoryFilterWidget extends StatelessWidget {
  const InventoryFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InventorySummaryReportController _controller = Get.find();
    return SafeArea(
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            children: [
              TextWidget(
                text: "filter".tr,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 5),
                  controller: ScrollController(keepScrollOffset: true),
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 20),
                    ButtonWidget(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      onPressed: () => _controller.onFilterDatePressed(),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_rounded,
                            color: Colors.black,
                          ),
                          const SizedBox(width: 10),
                          TextWidget(
                            text: _controller.getDateFilterText,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormFieldWidget<String>(
                      value: _controller.groupBy.value,
                      label: "product_group".tr,
                      items: [
                        DropdownMenuItem(
                          child: TextWidget(
                            text: "group_by_product".tr,
                            color: textColor,
                            fontFamily: "Siemreap",
                          ),
                          value: "group_by_product",
                        ),
                        DropdownMenuItem(
                          child: TextWidget(
                            text: "group_by_date".tr,
                            color: textColor,
                            fontFamily: "Siemreap",
                          ),
                          value: "group_by_date",
                        ),
                      ],
                      onChanged: (_) => _controller.onGroupByFilterPressed(_),
                    ),
                  ],
                ),
              ),
              ButtonWidget(
                onPressed: () => _controller.onFilterPressed(),
                backgroundColor: infoColor,
                child: TextWidget(text: "filter".tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
