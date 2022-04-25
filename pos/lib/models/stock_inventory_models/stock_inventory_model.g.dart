// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_inventory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockInventoryModel _$StockInventoryModelFromJson(Map<String, dynamic> json) =>
    StockInventoryModel(
      id: json['id'] as String?,
      quantity_stock: (json['quantity_stock'] as num?)?.toDouble(),
      min_quantity: (json['min_quantity'] as num?)?.toDouble(),
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
    )..product = json['product'] == null
        ? null
        : ProductModel.fromJson(json['product'] as Map<String, dynamic>);

Map<String, dynamic> _$StockInventoryModelToJson(
        StockInventoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity_stock': instance.quantity_stock,
      'min_quantity': instance.min_quantity,
      'product_id': instance.product_id,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'product': instance.product,
    };
