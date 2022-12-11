import 'package:flutter/material.dart';
import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:penjemputan/util/fetch_penjemputan.dart';
import 'package:penjemputan/page/detail_penjemputan.dart';

class penjemputanPage extends StatefulWidget {
  const penjemputanPage({super.key});

  @override
  State<penjemputanPage> createState() => _penjemputanPage();
}

class _penjemputanPage extends State<penjemputanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('penjemputan'),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: fetch_penjemputan_item(),
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
                      side: BorderSide(color: Colors.blue)
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
                                  detailPenjemputan(
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
