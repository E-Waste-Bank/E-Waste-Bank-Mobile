import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:flutter/material.dart';
import 'package:about_us/page/list_feedback.dart';
import 'package:about_us/page/add_feedack.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "Get To Know Us!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          "Kami hadir untuk memudahkan masyarakat untuk mengumpulkan dan mengelola barang elektronik yang sudah tidak layak pakai. Melalui aplikasi ini, masyarakat dapat mendapatkan uang melalui menjual barang elektronik yang sudah tidak layak pakai, yang nantinya akan dijemput oleh kami. Selain itu, kami memberikan informasi tips dan tricks mengenai pengelolaan E Waste.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "What People Say About Us?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 30,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AddFeedbackPage()),
                              );
                              },
                              child: const Text(
                                "Add Feedback",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ListFeedbackPage()),
                              );
                              },
                              child: const Text(
                                "See Feedback",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
