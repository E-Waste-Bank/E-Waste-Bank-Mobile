import 'package:penjemputan/model/penjemputan_item.dart';
import 'package:flutter/material.dart';
import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:penjemputan/util/fetch_penjemputan.dart';
import 'package:penjemputan/page/list_penjemputan.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class detailPenjemputan extends StatelessWidget {
  final penjemputan_item penjemputanItem;
  const detailPenjemputan({super.key, required this.penjemputanItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('detail penjemputan'),
      ),
      drawer: MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              penjemputanItem.jenis_sampah,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Alamat: ' + penjemputanItem.alamat,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // Text(penjemputanItem.watched.toString()),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('berat sampah: ' + penjemputanItem.berat_sampah.toString(),
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('tanggal: ' + penjemputanItem.tanggal_jemput,
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('waktu: ' + penjemputanItem.waktu_jemput,
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => penjemputanPage()),
          );
        },
        child: const Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
