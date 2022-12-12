import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'package:about_us/about_us.dart';
import 'package:e_waste_bank_mobile/authentication/user_provider.dart';
import 'package:e_waste_bank_mobile/drawer.dart';

import 'package:keuangan/providers/user_keuanganadmin_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserKeuanganAdminProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: ((_) {
        CookieRequest request = CookieRequest();
        return request;
      }),
      child: MaterialApp(
        title: 'E-Waste-Bank',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AboutUsPage(),
      ),
    );
  }
}