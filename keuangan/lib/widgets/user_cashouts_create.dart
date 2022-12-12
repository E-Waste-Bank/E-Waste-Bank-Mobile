import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keuangan/widgets/user_list_cashouts.dart';
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

  double _nominalPenarikan = 0.0;

  @override
  Widget build(BuildContext context) {
    CookieRequest requester = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Penarikan Baru'),
      ),
      body: Form(
        key: _userCreateCashoutsPageKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: false, decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'))
                    ],
                    decoration: InputDecoration(
                      hintText: "Contoh: 25000.25",
                      labelText: "Jumlah Penarikan",
                      icon: const Icon(Icons.money),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        double? newNominal = double.tryParse(value!);

                        if (!(newNominal == null)) {
                          _nominalPenarikan = newNominal;
                        }
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        _nominalPenarikan = double.parse(value!);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      } else if (double.tryParse(value) == null) {
                        return 'Nominal tidak valid!';
                      } else if (((double.parse(value) / 0.01) % 1) != 0) {
                        return 'Nominal hanya boleh mengandung dua angka di belakang koma!';
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    if (_userCreateCashoutsPageKey.currentState!.validate()) {
                      final response = await requester.post(
                          "https://e-waste-bank.up.railway.app/keuangan/user/create-cashout-api/",
                          {'amount': _nominalPenarikan.toString()});

                      if (response['status'] == true) {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(
                                      child: Text(
                                        "Request penarikan berhasil!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    TextButton(
                                      onPressed: () {
                                        // pop untuk menutup dialog box
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          )
                        );
                      } else {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(
                                      child: Text(
                                        "Request penarikan berhasil!",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    TextButton(
                                      onPressed: () {
                                        // pop untuk menutup dialog box
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        'OK',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }
                          )
                        );
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    "Request",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
