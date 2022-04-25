// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/sale_models/sale_model.dart';
part 'print_model.g.dart';

@JsonSerializable()
class PrintModel {
  String? id;
  String? key;
  String? sale_id;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  SaleModel? sale;
  PrintModel({
    this.id,
    this.key,
    this.sale_id,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
  });

  factory PrintModel.fromJson(Map<String, dynamic> json) =>
      _$PrintModelFromJson(json);
  Map<String, dynamic> toJson() => _$PrintModelToJson(this);
}
