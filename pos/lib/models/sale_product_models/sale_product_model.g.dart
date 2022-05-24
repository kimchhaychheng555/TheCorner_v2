// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleProductModel _$SaleProductModelFromJson(Map<String, dynamic> json) =>
    SaleProductModel(
      id: json['id'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      is_free: json['is_free'] as bool?,
      is_remove_stock_done: json['is_remove_stock_done'] as bool?,
      sale_id: json['sale_id'] as String?,
      product_id: json['product_id'] as String?,
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
      ..product_name = json['product_name'] as String?
      ..sale = json['sale'] == null
          ? null
          : SaleModel.fromJson(json['sale'] as Map<String, dynamic>)
      ..product = json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>);

Map<String, dynamic> _$SaleProductModelToJson(SaleProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'product_name': instance.product_name,
      'quantity': instance.quantity,
      'price': instance.price,
      'is_free': instance.is_free,
      'is_remove_stock_done': instance.is_remove_stock_done,
      'sale_id': instance.sale_id,
      'product_id': instance.product_id,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'sale': instance.sale,
      'product': instance.product,
    };
