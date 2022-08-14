// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      min_quantity: (json['min_quantity'] as num?)?.toDouble() ?? 0,
      cost: (json['cost'] as num?)?.toDouble(),
      image: json['image'] as String?,
      stockable: json['stockable'] as bool? ?? false,
      category_id: json['category_id'] as String?,
      created_date: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      created_by: json['created_by'] as String?,
      is_deleted: json['is_deleted'] as bool?,
      deleted_date: json['deleted_date'] == null
          ? null
          : DateTime.parse(json['deleted_date'] as String),
      deleted_by: json['deleted_by'] as String?,
    )
      ..product_group_id = json['product_group_id'] as String?
      ..category = json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>)
      ..product_group = json['product_group'] == null
          ? null
          : ProductGroupModel.fromJson(
              json['product_group'] as Map<String, dynamic>);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'min_quantity': instance.min_quantity,
      'cost': instance.cost,
      'image': instance.image,
      'stockable': instance.stockable,
      'category_id': instance.category_id,
      'product_group_id': instance.product_group_id,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'category': instance.category,
      'product_group': instance.product_group,
    };
