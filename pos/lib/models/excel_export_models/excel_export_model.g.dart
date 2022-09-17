// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excel_export_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExcelExportModel _$ExcelExportModelFromJson(Map<String, dynamic> json) =>
    ExcelExportModel(
      header: json['header'] as String?,
      contentList: (json['contentList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ExcelExportModelToJson(ExcelExportModel instance) =>
    <String, dynamic>{
      'header': instance.header,
      'contentList': instance.contentList,
    };
