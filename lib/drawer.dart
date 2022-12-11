import 'package:flutter/material.dart';
import 'package:keuangan/models/admin_cashout_model.dart';
import 'package:provider/provider.dart';
import 'package:e_waste_bank_mobile/authentication/user_provider.dart';
import 'package:e_waste_bank_mobile/main.dart';
import 'package:e_waste_bank_mobile/authentication/login_page.dart';
import 'package:e_waste_bank_mobile/authentication/register.page.dart';
import 'package:tips_and_tricks/page/list_tips_and_trick.dart';
import 'package:tips_and_tricks/page/add_tips_and_trick.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late bool isAuthenticated;
  late bool isAdmin;

  @override
  Drawer build(BuildContext context) {
    isAuthenticated = context.watch<UserProvider>().isAuthenticated();
    isAdmin = context.watch<UserProvider>().isAdmin();
    return Drawer(
        child: Column(children: [
      ListTile(
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          }),
      ListTile(
          title: const Text('Tips And Trick'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TipsAndTrickPage()));
          }),
      ListTile(
          title: const Text('Add Tips And Tricks Article'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddTipsAndTrickPage()));
          }),
      ListTile(
          title: const Text('Login COBA'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage()));
          }),
      ListTile(
          title: const Text('Register'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterPage()));
          }),
    ]));
  }
}
