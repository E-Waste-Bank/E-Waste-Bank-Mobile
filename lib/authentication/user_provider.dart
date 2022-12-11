import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _role = "";
  String _username = "";
  bool _authenticated = false;

  String getUsername() => _username;
  bool isAuthenticated() => _authenticated;
  bool isAdmin() => (_role == "admin");

  void login(String username, String role) {
    _username = username;
    _role = role;
    _authenticated = true;
    notifyListeners();
  }

  void logout() {
    _username = "";
    _role = "";
    _authenticated = false;
    notifyListeners();
  }
}
