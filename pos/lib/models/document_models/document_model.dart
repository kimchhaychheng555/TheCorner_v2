// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'document_model.g.dart';

@JsonSerializable()
class DocumentModel {
  String? id;
  String? key_name;
  String? label;
  String? value;

  DocumentModel({
    this.id,
    this.key_name,
    this.label,
    this.value,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentModelToJson(this);
}
