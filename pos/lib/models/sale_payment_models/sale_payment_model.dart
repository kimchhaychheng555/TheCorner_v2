// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:pos/models/payment_method_models/payment_method_model.dart';
import 'package:pos/models/sale_models/sale_model.dart';
part 'sale_payment_model.g.dart';

@JsonSerializable()
class SalePaymentModel {
  String? id;
  double? payment_amount;
  double? exchange_rate;
  String? payment_method_name;
  DateTime? created_date;
  String? created_by;
  bool? is_deleted;
  DateTime? deleted_date;
  String? deleted_by;

  String? sale_id;
  SaleModel? sale;
  String? payment_method_id;
  PaymentMethodModel? payment_method;

  SalePaymentModel({
    this.id,
    this.payment_amount,
    this.exchange_rate,
    this.payment_method_name,
    this.created_date,
    this.created_by,
    this.is_deleted,
    this.deleted_date,
    this.deleted_by,
    this.sale_id,
    this.payment_method_id,
  });

  factory SalePaymentModel.fromJson(Map<String, dynamic> json) =>
      _$SalePaymentModelFromJson(json);
  Map<String, dynamic> toJson() => _$SalePaymentModelToJson(this);
}
