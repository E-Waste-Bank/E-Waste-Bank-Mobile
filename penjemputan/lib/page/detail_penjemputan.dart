import 'package:penjemputan/model/penjemputan_item.dart';
import 'package:flutter/material.dart';
import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:penjemputan/page/list_penjemputan.dart';

class DetailPenjemputan extends StatelessWidget {
  final PenjemputanItem penjemputanItem;
  const DetailPenjemputan({super.key, required this.penjemputanItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('detail penjemputan'),
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            penjemputanItem.jenisSampah,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Alamat: ${penjemputanItem.alamat}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            // Text(penjemputanItem.watched.toString()),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('berat sampah: ${penjemputanItem.beratSampah}',
                style: const TextStyle(
                  fontSize: 20,
                )),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('tanggal: ${penjemputanItem.tanggalJemput}',
                style: const TextStyle(
                  fontSize: 20,
                )),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text('waktu: ${penjemputanItem.waktuJemput}',
                style: const TextStyle(
                  fontSize: 20,
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const PenjemputanPage()),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
