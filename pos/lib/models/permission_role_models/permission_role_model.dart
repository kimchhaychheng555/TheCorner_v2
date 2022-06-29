// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/permission_models/permission_model.dart';
import 'package:pos/models/role_models/role_model.dart';
part 'permission_role_model.g.dart';

@JsonSerializable()
class PermissionRoleMole {
  String? permission_id;
  String? role_id;

  RoleModel? role;
  PermissionModel? permission;

  PermissionRoleMole({
    this.permission_id,
    this.role_id,
  });

  factory PermissionRoleMole.fromJson(Map<String, dynamic> json) =>
      _$PermissionRoleMoleFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionRoleMoleToJson(this);
}
