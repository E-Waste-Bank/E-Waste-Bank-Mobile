import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:penjemputan/page/list_penjemputan.dart';
import 'package:provider/provider.dart';
import 'package:e_waste_bank_mobile/authentication/user_provider.dart';
import 'package:e_waste_bank_mobile/main.dart';
import 'package:e_waste_bank_mobile/authentication/login_page.dart';
import 'package:e_waste_bank_mobile/authentication/register.page.dart';
import 'package:tips_and_tricks/page/list_tips_and_trick.dart';
import 'package:tips_and_tricks/page/add_tips_and_trick.dart';
// import 'package:penjemputan/page/list_penjemputan.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Drawer build(BuildContext context) {
    final requester = context.watch<CookieRequest>();

    UserProvider userProvider = context.watch<UserProvider>();

    return Drawer(
        child: Column(children: [
      ListTile(
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const MyHomePage()));
          }),
      ListTile(
          title: const Text('Tips And Tricks'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TipsAndTrickPage()));
          }),
      Visibility(
        visible: userProvider.isAuthenticated(),
        child: ListTile(
            title: const Text('penjemputan'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const PenjemputanPage()));
            }),
      ),
      Visibility(
        visible: userProvider.isAdmin(),
        child: ListTile(
            title: const Text('Add Tips And Tricks Article'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddTipsAndTrickPage()));
            }),
      ),
      Visibility(
        visible: !userProvider.isAuthenticated(),
        child: ListTile(
            title: const Text('Login COBA'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            }),
      ),
      Visibility(
        visible: !userProvider.isAuthenticated(),
        child: ListTile(
            title: const Text('Register'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
            }),
      ),
      Visibility(
        visible: userProvider.isAuthenticated(),
        child: ListTile(
            title: const Text('Logout'),
            onTap: () async {
              await requester
                  .logout("https://e-waste-bank.up.railway.app/auth/logout/");

              // ignore: use_build_context_synchronously
              Provider.of<UserProvider>(context, listen: false).logout();

              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            }),
      ),
    ]));
  }
}
