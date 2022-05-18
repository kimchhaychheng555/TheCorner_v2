import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/widgets/text_widget.dart';

class ProductScren extends GetResponsiveView<dynamic> {
  ProductScren({Key? key}) : super(key: key);

  static const String routeName = "/products";

  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(text: "Products".tr),
      ),
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Container(
              // width: 330,
              // height: 300,
              // color: Colors.red,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text(
                      'No',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      'Price',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('1')),
                      DataCell(
                        Text('19'),
                      ),
                      DataCell(Text('Studesdfsdfdfnt')),
                      DataCell(Text('Studensdfsdfsdfsdfdsft')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('2')),
                      DataCell(Text('43')),
                      DataCell(Text('Student')),
                      DataCell(Text('Professor')),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('3')),
                      DataCell(Text('27')),
                      DataCell(Text('Student')),
                      DataCell(Text('Associate Professor')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
