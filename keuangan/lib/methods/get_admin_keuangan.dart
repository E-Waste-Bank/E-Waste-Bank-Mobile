import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:keuangan/models/admin_keuanganadmin_model.dart';

Future<List<KeuanganAdmin>> fetchKeuanganAdmin(context) async {
  final requester = Provider.of<CookieRequest>(context, listen: false);
  // var url = Uri.parse('https://127.0.0.1:8000/keuangan/json/admin/');
  // var url = Uri.parse('https://e-waste-bank.up.railway.app/keuangan/json/admin/');

  var data = await requester
      .get("https://e-waste-bank.up.railway.app/keuangan/json/admin/");

  // var response = await http.get(
  //   url,
  //   headers: {
  //     "Access-Control-Allow-Origin": "*",
  //     "Content-Type": "application/json",
  //   },
  // );

  List<KeuanganAdmin> listKeuanganAdmin = [];
  for (var each in data) {
    if (each != null) {
      listKeuanganAdmin.add(KeuanganAdmin.fromJson(each));
    }
  }

  return listKeuanganAdmin;
}