import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:penjemputan/model/penjemputan_item.dart';

// Menerapkan pemanggilan asynchronous ke Web Service Django
Future<List<PenjemputanItem>> fetchPenjemputanItem() async {
  var url = Uri.parse('https://e-waste-bank.up.railway.app/penjemputan/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // print(response.body);
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<PenjemputanItem> listPenjemputanItem = [];
  for (var d in data){
    if (d != null){
      listPenjemputanItem.add(PenjemputanItem.fromJson(d));
    }
  }

  return listPenjemputanItem;
}