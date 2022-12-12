import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class UserKeuanganAdminProvider with ChangeNotifier {
  String _username = "";
  double _balance = 0;

  String getUsername() => _username;
  double getBalance() => _balance;

  void login(String username, String role) {
    _username = username;
    notifyListeners();
  }

  void logout() {
    _username = "";
    _balance = 0;
    notifyListeners();
  }

  void updateBalance(double newBalance) {
    _balance = newBalance;
    notifyListeners();
  }

  Future fetchBalance(BuildContext context) async {
    final requester = Provider.of<CookieRequest>(context, listen: false);
    var data = await requester
        .get("https://e-waste-bank.up.railway.app/keuangan/json/user-api/");

    _balance = data[0]['fields']['uang_user'];
    notifyListeners();
  }
}
