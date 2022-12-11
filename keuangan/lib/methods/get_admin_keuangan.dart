import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:keuangan/models/admin_keuanganadmin_model.dart';

Future<List<KeuanganAdmin>> fetchKeuanganAdmin() async {
  // var url = Uri.parse('https://127.0.0.1:8000/keuangan/json/admin/');
  var url = Uri.parse('https://e-waste-bank.up.railway.app/keuangan/json/admin/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object KeuanganAdmin
  List<KeuanganAdmin> listKeuanganAdmin = [];
  for (var d in data) {
    if (d != null) {
      listKeuanganAdmin.add(KeuanganAdmin.fromJson(d));
    }
  }

  return listKeuanganAdmin;
}