import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:penjemputan/model/penjemputan_item.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
// Menerapkan pemanggilan asynchronous ke Web Service Django
Future<List<PenjemputanItem>> fetchPenjemputanItem(context) async {
  final requester = Provider.of<CookieRequest>(context, listen: false);

  var data = await requester
      .get("https://e-waste-bank.up.railway.app/penjemputan/json/");
  List<PenjemputanItem> listPenjemputanItem = [];
  for (var each in data) {
    if (each != null) {
      listPenjemputanItem.add(PenjemputanItem.fromJson(each));
    }
  }

  return listPenjemputanItem;
}