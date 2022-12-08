import 'package:flutter/material.dart';
import 'package:e_waste_bank_mobile/main.dart';
import 'package:e_waste_bank_mobile/tips_and_tricks/page/list_tips_and_trick.dart';
import 'package:e_waste_bank_mobile/tips_and_tricks/page/add_tips_and_trick.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        ListTile(
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const MyHomePage())
            );
          }
        ),
        ListTile(
          title: const Text('Tips And Trick'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const TipsAndTrickPage())
            );
          }
        ),
        ListTile(
          title: const Text('Add Tips And Tricks Article'),
          onTap: () {
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(builder: (context) => const AddTipsAndTrickPage())
            );
          }
        ),
      ]
    )
  );
}