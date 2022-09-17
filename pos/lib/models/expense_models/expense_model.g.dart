// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) => ExpenseModel(
      id: json['id'] as String?,
      ref_number: json['ref_number'] as String?,
      description: json['description'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      payment_method_name: json['payment_method_name'] as String?,
      note: json['note'] as String?,
      attachments: json['attachments'] as String?,
      created_date: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      created_by: json['created_by'] as String?,
      is_deleted: json['is_deleted'] as bool?,
      deleted_date: json['deleted_date'] == null
          ? null
          : DateTime.parse(json['deleted_date'] as String),
      deleted_by: json['deleted_by'] as String?,
    );

Map<String, dynamic> _$ExpenseModelToJson(ExpenseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ref_number': instance.ref_number,
      'description': instance.description,
      'amount': instance.amount,
      'payment_method_name': instance.payment_method_name,
      'note': instance.note,
      'attachments': instance.attachments,
      'created_date': instance.created_date?.toIso8601String(),
      'created_by': instance.created_by,
      'is_deleted': instance.is_deleted,
      'deleted_date': instance.deleted_date?.toIso8601String(),
      'deleted_by': instance.deleted_by,
    };
