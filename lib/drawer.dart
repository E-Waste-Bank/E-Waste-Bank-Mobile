import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keuangan/providers/user_keuanganadmin_provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:penjemputan/page/list_penjemputan.dart';
import 'package:penjemputan/page/add_penjemputan.dart';
import 'package:provider/provider.dart';
import 'package:e_waste_bank_mobile/authentication/user_provider.dart';
import 'package:e_waste_bank_mobile/main.dart';
import 'package:e_waste_bank_mobile/authentication/login_page.dart';
import 'package:tips_and_tricks/page/list_tips_and_trick.dart';
import 'package:tips_and_tricks/page/add_tips_and_trick.dart';
import 'package:keuangan/widgets/admin_list_cashouts.dart';
import 'package:keuangan/widgets/admin_list_keuangan.dart';
import 'package:about_us/about_us.dart';
// import 'package:penjemputan/page/list_penjemputan.dart';
import 'package:keuangan/widgets/user_list_cashouts.dart';

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
    UserKeuanganAdminProvider userKeuanganAdminProvider =
        Provider.of<UserKeuanganAdminProvider>(context, listen: false);

    var numberFormatter = NumberFormat.decimalPattern("id");

    return Drawer(
        child: Column(children: [
      userProvider.isAuthenticated()
          ? UserAccountsDrawerHeader(
              accountName: Text(userProvider.getUsername()),
              accountEmail: userProvider.isAdmin()
                  ? const Text("Anda login sebagai admin.")
                  : Text(
                      "Rp. ${numberFormatter.format(userKeuanganAdminProvider.getBalance())}"))
          : const SizedBox.shrink(),
      ListTile(
          title: const Text('About Us'),
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const AboutUsPage()));
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
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PenjemputanPage()));
            }),
      ),
      Visibility(
        visible: userProvider.isAuthenticated() && !userProvider.isAdmin(),
        child: ListTile(
            title: const Text('Add Penjemputan'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddPenjemputan()));
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
        visible: userProvider.isAuthenticated() && !userProvider.isAdmin(),
        child: ListTile(
            title: const Text('Keuangan'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserListCashoutsPage()));
            }),
      ),
      Visibility(
        visible: userProvider.isAdmin(),
        child: ListTile(
            title: const Text('Keuangan'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AdminListKeuanganPage()));
            }),
      ),
      Visibility(
        visible: !userProvider.isAuthenticated(),
        child: ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
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
              Provider.of<UserKeuanganAdminProvider>(context, listen: false)
                  .logout();

              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()));
            }),
      ),
    ]));
  }
}
