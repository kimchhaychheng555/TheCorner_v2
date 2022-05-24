// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/product_models/product_model.dart';
import 'package:pos/models/sale_models/sale_model.dart';
part 'sale_product_model.g.dart';

@JsonSerializable()
class SaleProductModel {
  String? id;
  String? image;
  String? product_name;
  double? quantity;
  double? price;
  bool? is_free;
  bool? is_remove_stock_done;
  String? sale_id;
  String? product_id;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  SaleModel? sale;
  ProductModel? product;
  SaleProductModel({
    this.id,
    this.quantity,
    this.image,
    this.price,
    this.is_free,
    this.is_remove_stock_done,
    this.sale_id,
    this.product_id,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
  });

  factory SaleProductModel.fromJson(Map<String, dynamic> json) =>
      _$SaleProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$SaleProductModelToJson(this);
}
