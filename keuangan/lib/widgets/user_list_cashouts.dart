import 'package:flutter/material.dart';
import 'package:keuangan/models/user_keuanganadmin.dart';
import 'package:keuangan/providers/user_keuanganadmin_provider.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:keuangan/models/user_cashout.dart';

import 'package:keuangan/widgets/user_cashouts_detail.dart';
import 'package:keuangan/widgets/user_cashouts_create.dart';
import 'package:e_waste_bank_mobile/drawer.dart';

class UserListCashoutsPage extends StatefulWidget {
  const UserListCashoutsPage({Key? key}) : super(key: key);

  @override
  State<UserListCashoutsPage> createState() => _UserListCashoutsPageState();
}

class _UserListCashoutsPageState extends State<UserListCashoutsPage> {
  late Future<List<Cashouts>> fetchedCashouts;

  Future<List<Cashouts>> fetchCashouts() async {
    final requester = Provider.of<CookieRequest>(context, listen: false);
    var data = await requester.get(
        "https://e-waste-bank.up.railway.app/keuangan/json/user-cashouts-api/");

    List<Cashouts> listCashouts = [];
    for (var each in data) {
      if (each != null) {
        listCashouts.add(Cashouts.fromJson(each));
      }
    }

    return listCashouts;
  }

  @override
  void initState() {
    super.initState();
    fetchedCashouts = fetchCashouts();
    Provider.of<UserKeuanganAdminProvider>(context, listen: false)
        .fetchBalance(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Penarikan Uang'),
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder(
        future: fetchedCashouts,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Column(
              children: const [
                Text(
                  "Belum ada penarikan yang anda buat.",
                  style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                ),
                SizedBox(height: 8),
              ],
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return CashoutDetailPage(
                            cashouts: snapshot.data![index]);
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: const [
                          BoxShadow(color: Colors.grey, blurRadius: 5)
                        ]),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                "Penarikan ID: ${snapshot.data![index].pk}",
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
                                "Nominal: Rp.${snapshot.data![index].fields.amount}",
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const UserCreateCashoutsPage())))
              .then((_) {
            setState(() {
              fetchedCashouts = fetchCashouts();
              Provider.of<UserKeuanganAdminProvider>(context, listen: false)
                .fetchBalance(context);
            });
          });
        },
        tooltip: "Buat Penarikan Baru",
        child: const Icon(Icons.add),
      ),
    );
  }
}
