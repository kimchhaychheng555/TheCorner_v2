// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/product_models/product_model.dart';
part 'stock_transaction_model.g.dart';

@JsonSerializable()
class StockTransactionModel {
  String? id;
  double? quantity;
  String? type;
  String? product_id;
  bool? status;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;
  String? sale_date;
  String? description;

  ProductModel? product;
  StockTransactionModel({
    this.id,
    this.quantity,
    this.type,
    this.product_id,
    this.status,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
    this.sale_date,
    this.description,
  });

  factory StockTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$StockTransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$StockTransactionModelToJson(this);
}
