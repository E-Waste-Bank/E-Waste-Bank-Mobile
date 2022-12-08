import 'package:flutter/material.dart';
import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:e_waste_bank_mobile/tips_and_trick/util/fetch_tips_and_trick.dart';
import 'package:e_waste_bank_mobile/tips_and_trick/page/detail_tips_and_trick.dart';

class TipsAndTrickPage extends StatefulWidget {
  const TipsAndTrickPage({super.key});

  @override
  State<TipsAndTrickPage> createState() => _TipsAndTrickPage();
}

class _TipsAndTrickPage extends State<TipsAndTrickPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tips And Trick'),
      ),
      drawer: buildDrawer(context),
      body: FutureBuilder(
        future: fetchTipsAndTrick(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          }else{
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                  "Belum ada tips and trick yang dipost",
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
                          "${snapshot.data![index].title}"
                        ),
                        
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                  DetailTipsAndTrick(
                                    tipsAndTrick: snapshot.data![index],
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
