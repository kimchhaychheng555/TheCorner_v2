// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'excel_export_model.g.dart';

@JsonSerializable()
class ExcelExportModel {
  String? header;
  List<String>? contentList;

  ExcelExportModel({
    this.header,
    this.contentList,
  });

  factory ExcelExportModel.fromJson(Map<String, dynamic> json) =>
      _$ExcelExportModelFromJson(json);
  Map<String, dynamic> toJson() => _$ExcelExportModelToJson(this);
}
