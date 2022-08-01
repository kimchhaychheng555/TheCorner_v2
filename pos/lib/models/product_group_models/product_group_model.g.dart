// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductGroupModel _$ProductGroupModelFromJson(Map<String, dynamic> json) =>
    ProductGroupModel(
      id: json['id'] as String?,
      group_name: json['group_name'] as String?,
      created_date: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      created_by: json['created_by'] as String?,
      is_deleted: json['is_deleted'] as bool?,
      deleted_date: json['deleted_date'] == null
          ? null
          : DateTime.parse(json['deleted_date'] as String),
      deleted_by: json['deleted_by'] as String?,
    )..products = (json['products'] as List<dynamic>?)
        ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$ProductGroupModelToJson(ProductGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group_name': instance.group_name,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'products': instance.products,
    };
