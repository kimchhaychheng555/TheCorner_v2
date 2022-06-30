// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'inventory_summary_report_model.g.dart';

@JsonSerializable()
class InventorySummaryReportModel {
  String? item_name;
  double? cost;
  double? qty_ordered;
  double? qty_on_hold;
  double? qty_on_hand;
  double? qty_sold;
  double? adjustment;
  double? price;
  double? balance;

  InventorySummaryReportModel({
    this.item_name,
    this.cost,
    this.qty_ordered,
    this.qty_on_hold,
    this.qty_on_hand,
    this.qty_sold,
    this.adjustment,
    this.price,
    this.balance,
  });

  factory InventorySummaryReportModel.fromJson(Map<String, dynamic> json) =>
      _$InventorySummaryReportModelFromJson(json);
  Map<String, dynamic> toJson() => _$InventorySummaryReportModelToJson(this);
}
