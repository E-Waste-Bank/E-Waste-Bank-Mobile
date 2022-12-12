import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:keuangan/models/admin_keuanganadmin_model.dart';

Future<List<KeuanganAdmin>> fetchKeuanganAdmin(context) async {
  final requester = Provider.of<CookieRequest>(context, listen: false);

  var data = await requester
      .get("https://e-waste-bank.up.railway.app/keuangan/json/admin/");

  List<KeuanganAdmin> listKeuanganAdmin = [];
  for (var each in data) {
    if (each != null) {
      listKeuanganAdmin.add(KeuanganAdmin.fromJson(each));
    }
  }

  return listKeuanganAdmin;
}