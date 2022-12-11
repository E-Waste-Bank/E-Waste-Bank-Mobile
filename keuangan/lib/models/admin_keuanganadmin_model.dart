// To parse this JSON data, do
//
//     final keuanganAdmin = keuanganAdminFromJson(jsonString);

import 'dart:convert';

List<KeuanganAdmin> keuanganAdminFromJson(String str) => List<KeuanganAdmin>.from(json.decode(str).map((x) => KeuanganAdmin.fromJson(x)));

String keuanganAdminToJson(List<KeuanganAdmin> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KeuanganAdmin {
  KeuanganAdmin({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory KeuanganAdmin.fromJson(Map<String, dynamic> json) => KeuanganAdmin(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  Fields({
    required this.uangUser,
    required this.user,
  });

  double uangUser;
  String user;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    uangUser: json["uang_user"].toDouble(),
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "uang_user": uangUser,
    "user": user,
  };
}
