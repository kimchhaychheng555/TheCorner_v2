// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'table_model.g.dart';

@JsonSerializable()
class TableModel {
  String? id;
  String? name;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  bool isActive;

  TableModel({
    this.id,
    this.name,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
    this.isActive = false,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
  Map<String, dynamic> toJson() => _$TableModelToJson(this);
}
