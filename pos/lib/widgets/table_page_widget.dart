import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/controllers/product_controllers/product_controller.dart';
import 'package:pos/screens/products_screens/widgets/product_detail_widget.dart';
import 'package:pos/services/app_service.dart';
import 'package:pos/widgets/text_widget.dart';
import 'package:responsive_table/responsive_table.dart';

class TablePageWidget extends StatelessWidget {
  const TablePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductController _controller = Get.find();
    return Obx(
      () => Card(
        child: ResponsiveDatatable(
          reponseScreenSizes: const [ScreenSize.xs],
          headers: [
            DatatableHeader(
              text: "Image",
              value: "image",
              show: true,
              textAlign: TextAlign.center,
              sourceBuilder: (value, row) {
                return Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            "${AppService.baseUrl}uploads/${row["image"]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
            DatatableHeader(
              text: "Name",
              value: "name",
              show: true,
              textAlign: TextAlign.center,
              sourceBuilder: (value, row) {
                return TextWidget(
                  text: row["name"],
                  fontFamily: "Siemreap",
                  color: Colors.black,
                  textAlign: TextAlign.center,
                );
              },
            ),
            DatatableHeader(
              text: "Price",
              value: "price",
              show: true,
              textAlign: TextAlign.center,
              sourceBuilder: (value, row) {
                return TextWidget(
                  text: AppService.currencyFormat(row["price"]),
                  fontFamily: "Siemreap",
                  color: Colors.black,
                  textAlign: TextAlign.center,
                );
              },
            ),
            DatatableHeader(
              text: "Category",
              value: "id",
              show: true,
              textAlign: TextAlign.center,
              sourceBuilder: (value, row) {
                return TextWidget(
                  text: row["category"]["name"],
                  fontFamily: "Siemreap",
                  color: Colors.black,
                  textAlign: TextAlign.center,
                );
              },
            ),
            DatatableHeader(
              text: "Action",
              value: "id",
              show: true,
              textAlign: TextAlign.center,
              sourceBuilder: (value, row) {
                return Container();
              },
            ),
          ],
          source: _controller.dataSource,
          selecteds: _controller.dataSource,
          autoHeight: false,
          onSort: (value) {
            print(value);
          },
          isExpandRows: false,
          onTabRow: (_) {
            Get.toNamed(ProductDetailScreen.routeName, arguments: _);
          },
          expanded: [
            ..._controller.dataSource.map((e) => false),
          ],
          sortAscending: false,
          sortColumn: "",
          isLoading: false,
          headerDecoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          selectedDecoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
            color: Colors.green,
          ),
          headerTextStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          rowTextStyle: const TextStyle(color: Colors.black),
          selectedTextStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
