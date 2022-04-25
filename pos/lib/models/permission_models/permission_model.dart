// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/role_models/role_model.dart';
part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
  String? id;
  String? slug;
  String? description;
  String? role_id;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  RoleModel? role;

  PermissionModel({
    this.id,
    this.slug,
    this.description,
    this.role_id,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}
