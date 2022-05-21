// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'start_sale_model.g.dart';

@JsonSerializable()
class StartSaleModel {
  String? date;
  bool isStart;

  StartSaleModel({
    this.date,
    this.isStart = false,
  });

  factory StartSaleModel.fromJson(Map<String, dynamic> json) =>
      _$StartSaleModelFromJson(json);
  Map<String, dynamic> toJson() => _$StartSaleModelToJson(this);
}
