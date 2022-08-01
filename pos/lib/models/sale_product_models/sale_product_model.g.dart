// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleProductModel _$SaleProductModelFromJson(Map<String, dynamic> json) =>
    SaleProductModel(
      id: json['id'] as String?,
      product_name: json['product_name'] as String?,
      discount_type: json['discount_type'] as String?,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      old_quantity: (json['old_quantity'] as num?)?.toDouble() ?? 0,
      firstChanged: json['firstChanged'] as bool? ?? false,
      quantity: (json['quantity'] as num?)?.toDouble(),
      image: json['image'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      stockable: json['stockable'] as bool? ?? false,
      is_free: json['is_free'] as bool? ?? false,
      is_remove_stock_done: json['is_remove_stock_done'] as bool? ?? false,
      sale_id: json['sale_id'] as String?,
      product_id: json['product_id'] as String?,
      created_date: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      created_by: json['created_by'] as String?,
      is_deleted: json['is_deleted'] as bool? ?? false,
      deleted_date: json['deleted_date'] == null
          ? null
          : DateTime.parse(json['deleted_date'] as String),
      deleted_by: json['deleted_by'] as String?,
      product_group_id: json['product_group_id'] as String?,
    )
      ..sale = json['sale'] == null
          ? null
          : SaleModel.fromJson(json['sale'] as Map<String, dynamic>)
      ..product = json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>)
      ..productGroup = json['productGroup'] == null
          ? null
          : ProductGroupModel.fromJson(
              json['productGroup'] as Map<String, dynamic>);

Map<String, dynamic> _$SaleProductModelToJson(SaleProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'product_name': instance.product_name,
      'old_quantity': instance.old_quantity,
      'quantity': instance.quantity,
      'discount_type': instance.discount_type,
      'discount': instance.discount,
      'price': instance.price,
      'is_free': instance.is_free,
      'is_remove_stock_done': instance.is_remove_stock_done,
      'sale_id': instance.sale_id,
      'product_id': instance.product_id,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'stockable': instance.stockable,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'firstChanged': instance.firstChanged,
      'product_group_id': instance.product_group_id,
      'sale': instance.sale,
      'product': instance.product,
      'productGroup': instance.productGroup,
    };
