import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:keuangan/methods/get_admin_keuangan.dart';
import 'package:keuangan/models/admin_keuanganadmin_model.dart';
import 'package:e_waste_bank_mobile/drawer.dart';

import 'admin_list_cashouts.dart';

class AdminListKeuanganPage extends StatefulWidget {
  const AdminListKeuanganPage({Key? key}) : super(key: key);

  @override
  State<AdminListKeuanganPage> createState() => _AdminListKeuanganPageState();
}

class _AdminListKeuanganPageState extends State<AdminListKeuanganPage> {
  late Future<List<KeuanganAdmin>> fetchedKeuangan;
  final _formKey = GlobalKey<FormState>();
  double? amount;

  @override
  void initState() {
    super.initState();
    fetchedKeuangan = fetchKeuanganAdmin(context);
  }

  @override
  Widget build(BuildContext context) {
    CookieRequest requester = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Keuangan User'),
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder(
          future: fetchedKeuangan,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada data keuangan",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(color: Colors.grey, blurRadius: 5.0)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "User: ${snapshot.data![index].fields.user}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Nominal: Rp.${snapshot.data![index].fields.uangUser}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                // trailing: ,
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text('Add Amount'),
                                        content: SingleChildScrollView(
                                            child: Form(
                                                key: _formKey,
                                                child: Column(children: [
                                                  Padding(
                                                      // Menggunakan padding sebesar 8 pixels
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        inputFormatters: <
                                                            TextInputFormatter>[
                                                          FilteringTextInputFormatter
                                                              .allow(RegExp(
                                                                  r'^\d+\.?\d{0,2}'))
                                                        ],
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              "Contoh: 1000",
                                                          labelText: "Nominal",
                                                          // Menambahkan circular border agar lebih rapi
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                        ),
                                                        // Menambahkan behavior saat nama diketik
                                                        onChanged:
                                                            (String? value) {
                                                          setState(() {
                                                            amount =
                                                                double.parse(
                                                                    value!);
                                                          });
                                                        },
                                                        // Menambahkan behavior saat data disimpan
                                                        onSaved:
                                                            (String? value) {
                                                          setState(() {
                                                            amount =
                                                                double.parse(
                                                                    value!);
                                                          });
                                                        },
                                                        // Validator sebagai validasi form
                                                        validator:
                                                            (String? value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Nominal tidak boleh kosong!';
                                                          } else if (int.parse(
                                                                  value) <
                                                              0) {
                                                            return 'Nominal tidak boleh negatif!';
                                                          } else if (((double.parse(
                                                                          value) /
                                                                      0.01) %
                                                                  1) !=
                                                              0) {
                                                            return 'Nominal hanya boleh mengandung dua angka di belakang koma!';
                                                          }
                                                          return null;
                                                        },
                                                      )),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () async {
                                                          // TODO submit
                                                          final response =
                                                              await requester.post(
                                                                  "https://e-waste-bank.up.railway.app/keuangan/edit-uang-user-api/${snapshot.data![index].pk}/",
                                                                  {
                                                                'uang_user': amount
                                                                    .toString()
                                                              });
                                                          // ignore: use_build_context_synchronously
                                                          Navigator.pushReplacement(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) => const AdminListKeuanganPage(),
                                                          ));
                                                        },
                                                        child:
                                                            const Text('Send'),
                                                      ),
                                                    ],
                                                  ),
                                                ]))),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ));
              }
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Cashouts'),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const AdminListCashoutsPage(),
              ));
        },
      ),
    );
  }
}
