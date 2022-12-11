import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tips_and_tricks/model/TipsAndTrick.dart';

// Menerapkan pemanggilan asynchronous ke Web Service Django
Future<List<TipsAndTrick>> fetchTipsAndTrick() async {
  var url = Uri.parse('https://e-waste-bank.up.railway.app/tips-and-tricks/post-json');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));
  List<TipsAndTrick> listTipsAndTrick = [];
  for (var d in data){
    if (d != null){
      listTipsAndTrick.add(TipsAndTrick.fromJson(d));
    }
  }

  return listTipsAndTrick;
}