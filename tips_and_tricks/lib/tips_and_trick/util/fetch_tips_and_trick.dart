import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:e_waste_bank_mobile/tips_and_trick/model/TipsAndTrick.dart';

Future<List<TipsAndTrick>> fetchTipsAndTrick() async {
  // print('masuk');
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
  // print('masuk');
  List<TipsAndTrick> listTipsAndTrick = [];
  for (var d in data){
    if (d != null){
      listTipsAndTrick.add(TipsAndTrick.fromJson(d));
    }
  }

  return listTipsAndTrick;
}