import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:penjemputan/model/penjemputan_item.dart';

// Menerapkan pemanggilan asynchronous ke Web Service Django
Future<List<penjemputan_item>> fetch_penjemputan_item() async {
  var url = Uri.parse('https://e-waste-bank.up.railway.app/tips-and-tricks/post-json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // print(response.body);
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<penjemputan_item> list_penjemputan_item = [];
  for (var d in data){
    if (d != null){
      list_penjemputan_item.add(penjemputan_item.fromJson(d));
    }
  }

  return list_penjemputan_item;
}