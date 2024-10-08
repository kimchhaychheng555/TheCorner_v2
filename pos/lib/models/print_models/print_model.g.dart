// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrintModel _$PrintModelFromJson(Map<String, dynamic> json) => PrintModel(
      id: json['id'] as String?,
      key: json['key'] as String?,
      sale_id: json['sale_id'] as String?,
      created_date: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      created_by: json['created_by'] as String?,
      is_deleted: json['is_deleted'] as bool?,
      deleted_date: json['deleted_date'] == null
          ? null
          : DateTime.parse(json['deleted_date'] as String),
      deleted_by: json['deleted_by'] as String?,
    )..sale = json['sale'] == null
        ? null
        : SaleModel.fromJson(json['sale'] as Map<String, dynamic>);

Map<String, dynamic> _$PrintModelToJson(PrintModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'sale_id': instance.sale_id,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'sale': instance.sale,
    };
