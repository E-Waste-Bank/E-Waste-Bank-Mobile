import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:keuangan/models/admin_cashout_model.dart';

Future<List<Cashout>> fetchAdminCashout(context) async {
  final requester = Provider.of<CookieRequest>(context, listen: false);

  var data = await requester
      .get("https://e-waste-bank.up.railway.app/keuangan/json/admin-cashouts/");

  List<Cashout> listCashouts = [];
  for (var each in data) {
    if (each != null) {
      listCashouts.add(Cashout.fromJson(each));
    }
  }

  return listCashouts;
}