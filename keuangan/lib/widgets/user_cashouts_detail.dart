import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import 'package:keuangan/models/user_cashout.dart';
import 'package:e_waste_bank_mobile/drawer.dart';

class CashoutDetailPage extends StatelessWidget {
  const CashoutDetailPage({super.key, required this.cashouts});

  final Cashouts cashouts;

  @override
  Widget build(BuildContext context) {
    const double largeHeight = 5;
    const double smallHeight = 4;

    // final DateFormat dateFormat = DateFormat('LLL dd, yyyy');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
        ),
        body: Container(
          margin: const EdgeInsets.all(7.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Penarikan (ID: ${cashouts.pk})",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Nominal: ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      "${cashouts.fields.amount}",
                      style: const TextStyle(fontSize: 22),
                    ),
                  )
                ],
              ),
              // const SizedBox(height: smallHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text("Disetujui: ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Text(
                      cashouts.fields.approved ? "Ya" : "Tidak",
                      style: const TextStyle(fontSize: 22),
                    ),
                  )
                ],
              ),
              const Spacer(flex: 2,),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
  }
}
