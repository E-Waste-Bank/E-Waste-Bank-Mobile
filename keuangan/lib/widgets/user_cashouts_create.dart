import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:e_waste_bank_mobile/drawer.dart';

class UserCreateCashoutsPage extends StatefulWidget {
  const UserCreateCashoutsPage({Key? key}) : super(key: key);

  @override
  State<UserCreateCashoutsPage> createState() => _UserCreateCashoutsPageState();
}

class _UserCreateCashoutsPageState extends State<UserCreateCashoutsPage> {
  final _userCreateCashoutsPageKey = GlobalKey<FormState>();

  String amountString = "0";
  double amountNum = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Penarikan Baru'),
      ),
      body: const Text("TODO")
    );
  }
}
