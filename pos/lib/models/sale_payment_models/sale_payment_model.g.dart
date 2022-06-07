// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalePaymentModel _$SalePaymentModelFromJson(Map<String, dynamic> json) =>
    SalePaymentModel(
      id: json['id'] as String?,
      payment_amount: (json['payment_amount'] as num?)?.toDouble(),
      exchange_rate: (json['exchange_rate'] as num?)?.toDouble(),
      payment_method_name: json['payment_method_name'] as String?,
      created_date: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      created_by: json['created_by'] as String?,
      is_deleted: json['is_deleted'] as bool?,
      deleted_date: json['deleted_date'] == null
          ? null
          : DateTime.parse(json['deleted_date'] as String),
      deleted_by: json['deleted_by'] as String?,
      sale_id: json['sale_id'] as String?,
      payment_method_id: json['payment_method_id'] as String?,
    )
      ..sale = json['sale'] == null
          ? null
          : SaleModel.fromJson(json['sale'] as Map<String, dynamic>)
      ..payment_method = json['payment_method'] == null
          ? null
          : PaymentMethodModel.fromJson(
              json['payment_method'] as Map<String, dynamic>);

Map<String, dynamic> _$SalePaymentModelToJson(SalePaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_amount': instance.payment_amount,
      'exchange_rate': instance.exchange_rate,
      'payment_method_name': instance.payment_method_name,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'sale_id': instance.sale_id,
      'sale': instance.sale,
      'payment_method_id': instance.payment_method_id,
      'payment_method': instance.payment_method,
    };
