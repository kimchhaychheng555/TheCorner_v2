// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleModel _$SaleModelFromJson(Map<String, dynamic> json) => SaleModel(
      id: json['id'] as String?,
      invoice_number: json['invoice_number'] as String?,
      vat: (json['vat'] as num?)?.toDouble() ?? 0,
      sub_total: (json['sub_total'] as num?)?.toDouble() ?? 0,
      discount_type: json['discount_type'] as String?,
      discount: (json['discount'] as num?)?.toDouble() ?? 0,
      grand_total: (json['grand_total'] as num?)?.toDouble() ?? 0,
      is_paid: json['is_paid'] as bool? ?? false,
      status: json['status'] as bool? ?? false,
      sale_date: json['sale_date'] as String?,
      table_id: json['table_id'] as String?,
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
      ..table = json['table'] == null
          ? null
          : TableModel.fromJson(json['table'] as Map<String, dynamic>)
      ..sale_products = (json['sale_products'] as List<dynamic>)
          .map((e) => SaleProductModel.fromJson(e as Map<String, dynamic>))
          .toList()
      ..sale_payments = (json['sale_payments'] as List<dynamic>)
          .map((e) => SalePaymentModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SaleModelToJson(SaleModel instance) => <String, dynamic>{
      'id': instance.id,
      'invoice_number': instance.invoice_number,
      'vat': instance.vat,
      'sub_total': instance.sub_total,
      'discount_type': instance.discount_type,
      'discount': instance.discount,
      'grand_total': instance.grand_total,
      'is_paid': instance.is_paid,
      'status': instance.status,
      'sale_date': instance.sale_date,
      'table_id': instance.table_id,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
      'table': instance.table,
      'sale_products': instance.sale_products,
      'sale_payments': instance.sale_payments,
    };
