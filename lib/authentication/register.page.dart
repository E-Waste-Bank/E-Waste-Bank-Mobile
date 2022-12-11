import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:e_waste_bank_mobile/authentication/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerPageFormKey = GlobalKey<FormState>();

  String username = "";
  String password = "";
  String passwordConfirmation = "";

  @override
  Widget build(BuildContext context) {
    final requester = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir Registrasi"),
      ),
      drawer: const MyDrawer(),
      body: Form(
          key: _registerPageFormKey,
          child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                      ]
                  )
              )
          )
      ),
    );
  }
}
