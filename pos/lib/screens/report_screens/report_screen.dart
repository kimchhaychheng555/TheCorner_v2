import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportScreen extends GetResponsiveView<dynamic> {
  ReportScreen({Key? key}) : super(key: key);

  static String routeName = "/reports";

  final DataTableSource _data = MyData();
  @override
  Widget builder() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kindacode.com'),
      ),
      body: Column(
        children: [
          PaginatedDataTable(
            source: _data,
            columns: const [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Name')),
              DataColumn(label: Text('Price'))
            ],
            columnSpacing: 100,
            horizontalMargin: 10,
            rowsPerPage: 8,
            showCheckboxColumn: false,
          ),
        ],
      ),
    );
  }
}

// The "soruce" of the table
class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> _data = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "price": Random().nextInt(10000)
          });

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => _data.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(
      // color: MaterialStateProperty.all(Colors.red),
      cells: [
        DataCell(Text(_data[index]['id'].toString())),
        DataCell(Text(_data[index]["title"])),
        DataCell(Text(_data[index]["price"].toString())),
      ],
    );
  }
}
