// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_summary_report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventorySummaryReportModel _$InventorySummaryReportModelFromJson(
        Map<String, dynamic> json) =>
    InventorySummaryReportModel(
      item_name: json['item_name'] as String?,
      cost: (json['cost'] as num?)?.toDouble(),
      qty_ordered: (json['qty_ordered'] as num?)?.toDouble(),
      qty_on_hold: (json['qty_on_hold'] as num?)?.toDouble(),
      qty_on_hand: (json['qty_on_hand'] as num?)?.toDouble(),
      qty_sold: (json['qty_sold'] as num?)?.toDouble(),
      adjustment: (json['adjustment'] as num?)?.toDouble(),
      price: (json['price'] as num?)?.toDouble(),
      balance: (json['balance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InventorySummaryReportModelToJson(
        InventorySummaryReportModel instance) =>
    <String, dynamic>{
      'item_name': instance.item_name,
      'cost': instance.cost,
      'qty_ordered': instance.qty_ordered,
      'qty_on_hold': instance.qty_on_hold,
      'qty_on_hand': instance.qty_on_hand,
      'qty_sold': instance.qty_sold,
      'adjustment': instance.adjustment,
      'price': instance.price,
      'balance': instance.balance,
    };
