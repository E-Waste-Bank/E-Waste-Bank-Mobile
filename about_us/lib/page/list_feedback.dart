import 'package:about_us/page/add_feedack.dart';
import 'package:flutter/material.dart';
import 'package:about_us/model/feedback.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:e_waste_bank_mobile/drawer.dart';

class ListFeedbackPage extends StatefulWidget {
  const ListFeedbackPage({Key? key}) : super(key: key);

  @override
  _ListFeedbackPageState createState() => _ListFeedbackPageState();
}

class _ListFeedbackPageState extends State<ListFeedbackPage> {
  Future<List<Feedbacks>> fetchMyWatchlist() async {
    var url = Uri.parse('https://e-waste-bank.up.railway.app/about-us/get-latest-three/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object
    List<Feedbacks> listFeedback = [];
    for (var d in data) {
      if (d != null) {
        listFeedback.add(Feedbacks.fromJson(d));
      }
    }

    return listFeedback;
  }

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Feedbacks'),
        ),
        drawer: const MyDrawer(),
        body: FutureBuilder(
            future: fetchMyWatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Belum ada feedback :(",
                        style: TextStyle(
                            color: Color(0xff59A5D8),
                            fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index)=> Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.blue)
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                          child: ListTile(
                            title: Text(
                              "${snapshot.data![index].fields.yourFeedback}"
                            ),
                            subtitle: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${snapshot.data![index].fields.name}"),
                                  Text("${snapshot.data![index].fields.date}".toString().substring(0,10)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  );
                }
              }
            }
        )
    );
  }
}