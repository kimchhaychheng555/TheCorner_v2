// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/sale_product_models/sale_product_model.dart';
import 'package:pos/models/table_models/table_model.dart';
part 'sale_model.g.dart';

@JsonSerializable()
class SaleModel {
  String? id;
  String? invoice_number;
  double? vat;
  double? sub_total;
  String? discount_type;
  double? discount;
  double? grand_total;
  bool? is_paid;
  bool? status;
  String? sale_date;
  String? table_id;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  TableModel? table;

  List<SaleProductModel> sale_products = [];
  SaleModel({
    this.id,
    this.invoice_number,
    this.vat,
    this.sub_total,
    this.discount_type,
    this.discount,
    this.grand_total,
    this.is_paid,
    this.status,
    this.sale_date,
    this.table_id,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
  });

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
  Map<String, dynamic> toJson() => _$SaleModelToJson(this);
}
