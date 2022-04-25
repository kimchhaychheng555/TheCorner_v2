// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/product_models/product_model.dart';
part 'stock_inventory_model.g.dart';

@JsonSerializable()
class StockInventoryModel {
  String? id;
  double? quantity_stock;
  double? min_quantity;
  String? product_id;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  ProductModel? product;
  StockInventoryModel({
    this.id,
    this.quantity_stock,
    this.min_quantity,
    this.product_id,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
  });

  factory StockInventoryModel.fromJson(Map<String, dynamic> json) =>
      _$StockInventoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$StockInventoryModelToJson(this);
}
