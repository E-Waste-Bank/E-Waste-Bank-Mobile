import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:penjemputan/model/penjemputan_item.dart';

Future<void> addTipsAndTrick(PenjemputanItem penjemputanItem) async {
  var url = Uri.parse('https://e-waste-bank.up.railway.app/penjemputan/add/');
  var response = await http.post(
    url,
    headers: {
      "Access-Control_Allow_Origin": "*",
      "Content-Type": "application/json; charset=utf-8",
    },
    body:jsonEncode(penjemputanItem)
  );
}