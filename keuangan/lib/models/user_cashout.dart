// To parse this JSON data, do
//
//     final cashouts = cashoutsFromJson(jsonString);

import 'dart:convert';

List<Cashouts> cashoutsFromJson(String str) =>
    List<Cashouts>.from(json.decode(str).map((x) => Cashouts.fromJson(x)));

String cashoutsToJson(List<Cashouts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cashouts {
  Cashouts({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory Cashouts.fromJson(Map<String, dynamic> json) => Cashouts(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse![model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.uangModel,
    required this.amount,
    required this.approved,
    required this.disbursed,
  });

  int user;
  int uangModel;
  double amount;
  bool approved;
  bool disbursed;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        uangModel: json["uang_model"],
        amount: json["amount"].toDouble(),
        approved: json["approved"],
        disbursed: json["disbursed"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "uang_model": uangModel,
        "amount": amount,
        "approved": approved,
        "disbursed": disbursed,
      };
}

// ignore: constant_identifier_names
enum Model { KEUANGAN_CASHOUT }

final modelValues = EnumValues({"keuangan.cashout": Model.KEUANGAN_CASHOUT});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

