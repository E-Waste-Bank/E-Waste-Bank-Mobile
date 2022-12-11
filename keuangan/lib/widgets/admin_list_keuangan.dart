import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    fetchedKeuangan = fetchKeuanganAdmin();
  }

  @override
  Widget build(BuildContext context) {
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
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "User: ${snapshot.data![index].fields.user}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Nominal: Rp.${snapshot.data![index].fields.uangUser}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
              }
            }
          }),
      floatingActionButton: FloatingActionButton.extended (
        label: const Text('Cashouts'),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>
                const AdminListCashoutsPage(),
            )
          );
        },
      ),
    );
  }
}
