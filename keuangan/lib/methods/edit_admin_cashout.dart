import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:keuangan/models/admin_cashout_model.dart';

Future<dynamic> editAdminCashout(Cashout cashout) async {
  var url = Uri.parse('https://e-waste-bank.up.railway.app/keuangan/edit-cashout/<int:id>/');
  var response = await http.post(
      url,
      headers: {
        "Access-Control_Allow_Origin": "*",
        "Content-Type": "application/json; charset=utf-8",
      },
      body:jsonEncode(cashout)
  );
  return jsonDecode(response.body)["success"];
}