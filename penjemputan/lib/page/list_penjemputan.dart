import 'package:flutter/material.dart';
import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:penjemputan/util/fetch_penjemputan.dart';
import 'package:penjemputan/page/detail_penjemputan.dart';

class PenjemputanPage extends StatefulWidget {
  const PenjemputanPage({super.key});

  @override
  State<PenjemputanPage> createState() => _PenjemputanPage();
}

class _PenjemputanPage extends State<PenjemputanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('penjemputan'),
      ),
      drawer: const MyDrawer(),
      body: FutureBuilder(
        future: fetchPenjemputanItem(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }else{
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                  "Belum ada penjemputan yang terdaftar",
                  style: TextStyle(fontSize: 20),
                  ),
                ],
              );
            }else{
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.blue)
                    ),

                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      child: ListTile(
                        title: Text(
                          "${snapshot.data![index].jenis_sampah}",
                        ),
                        
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  DetailPenjemputan(
                                    penjemputanItem: snapshot.data![index],
                                  )
                              ),
                            );
                        },
                      ),
                    )
                  )
                )
              );
            }
          }
        }
      )
    );
  }
}
