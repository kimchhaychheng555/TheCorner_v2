// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/category_models/category_model.dart';
import 'package:pos/models/product_group_models/product_group_model.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? id;
  String? name;
  double? price;
  double? min_quantity;
  double? cost;
  String? image;
  bool? stockable;
  String? category_id;
  String? product_group_id;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  CategoryModel? category;
  ProductGroupModel? product_group;
  ProductModel({
    this.id,
    this.name,
    this.price,
    this.min_quantity = 0,
    this.cost,
    this.image,
    this.stockable = false,
    this.category_id,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
