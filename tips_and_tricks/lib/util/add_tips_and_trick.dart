import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tips_and_tricks/model/TipsAndTrick.dart';

Future<void> addTipsAndTrick(TipsAndTrick tipsAndTrick) async {
  var url = Uri.parse('https://e-waste-bank.up.railway.app/tips-and-tricks/add-mobile');
  // ignore: unused_local_variable
  var response = await http.post(
    url,
    headers: {
      "Access-Control_Allow_Origin": "*",
      "Content-Type": "application/json; charset=utf-8",
    },
    body:jsonEncode(tipsAndTrick)
  );
}