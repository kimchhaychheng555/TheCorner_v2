// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/role_models/role_model.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? id;
  String? fullname;
  String? username;
  String? password;
  String? profile;
  String? role_id;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  RoleModel? role;
  UserModel({
    this.id,
    this.fullname,
    this.username,
    this.password,
    this.profile,
    this.role_id,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
