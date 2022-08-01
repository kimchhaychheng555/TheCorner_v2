// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/product_models/product_model.dart';
part 'product_group_model.g.dart';

@JsonSerializable()
class ProductGroupModel {
  String? id;
  String? group_name;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  List<ProductModel>? products = [];
  ProductGroupModel({
    this.id,
    this.group_name,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
  });

  factory ProductGroupModel.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductGroupModelToJson(this);
}
