// To parse this JSON data, do
//
//     final cashout = cashoutFromJson(jsonString);

import 'dart:convert';

List<Cashout> cashoutFromJson(String str) => List<Cashout>.from(json.decode(str).map((x) => Cashout.fromJson(x)));

String cashoutToJson(List<Cashout> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cashout {
  Cashout({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory Cashout.fromJson(Map<String, dynamic> json) => Cashout(
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

  User? user;
  int uangModel;
  double amount;
  bool approved;
  bool disbursed;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: userValues.map[json["user"]],
    uangModel: json["uang_model"],
    amount: json["amount"].toDouble(),
    approved: json["approved"],
    disbursed: json["disbursed"],
  );

  Map<String, dynamic> toJson() => {
    "user": userValues.reverse![user],
    "uang_model": uangModel,
    "amount": amount,
    "approved": approved,
    "disbursed": disbursed,
  };
}

enum User { PEBEPE, CBKADAL }

final userValues = EnumValues({
  "cbkadal": User.CBKADAL,
  "pebepe": User.PEBEPE
});

enum Model { KEUANGAN_CASHOUT }

final modelValues = EnumValues({
  "keuangan.cashout": Model.KEUANGAN_CASHOUT
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
      reverseMap ??= map.map((k, v) => MapEntry(v, k));

    return reverseMap;
  }
}
