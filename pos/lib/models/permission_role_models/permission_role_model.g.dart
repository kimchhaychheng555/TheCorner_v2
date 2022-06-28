// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionRoleMole _$PermissionRoleMoleFromJson(Map<String, dynamic> json) =>
    PermissionRoleMole(
      permission_id: json['permission_id'] as String?,
      role_id: json['role_id'] as String?,
    )
      ..role = json['role'] == null
          ? null
          : RoleModel.fromJson(json['role'] as Map<String, dynamic>)
      ..permission = json['permission'] == null
          ? null
          : PermissionRoleMole.fromJson(
              json['permission'] as Map<String, dynamic>);

Map<String, dynamic> _$PermissionRoleMoleToJson(PermissionRoleMole instance) =>
    <String, dynamic>{
      'permission_id': instance.permission_id,
      'role_id': instance.role_id,
      'role': instance.role,
      'permission': instance.permission,
    };
