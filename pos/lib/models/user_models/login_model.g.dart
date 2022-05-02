// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      username: json['username'] as String?,
      password: json['password'] as String?,
      assign_date: json['assign_date'] == null
          ? null
          : DateTime.parse(json['assign_date'] as String),
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'assign_date': instance.assign_date?.toIso8601String(),
    };
