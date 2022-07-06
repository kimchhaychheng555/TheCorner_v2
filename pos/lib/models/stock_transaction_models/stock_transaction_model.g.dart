// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockTransactionModel _$StockTransactionModelFromJson(
        Map<String, dynamic> json) =>
    StockTransactionModel(
      id: json['id'] as String?,
      quantity: (json['quantity'] as num?)?.toDouble(),
      type: json['type'] as String?,
      product_id: json['product_id'] as String?,
      status: json['status'] as bool?,
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

Map<String, dynamic> _$StockTransactionModelToJson(
        StockTransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'type': instance.type,
      'product_id': instance.product_id,
      'status': instance.status,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'product': instance.product,
    };
