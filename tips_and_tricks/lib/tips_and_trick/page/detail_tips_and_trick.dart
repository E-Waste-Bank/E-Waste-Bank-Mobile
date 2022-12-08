import 'package:e_waste_bank_mobile/tips_and_trick/model/TipsAndTrick.dart';
import 'package:flutter/material.dart';
import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:e_waste_bank_mobile/tips_and_trick/util/fetch_tips_and_trick.dart';
import 'package:e_waste_bank_mobile/tips_and_trick/page/list_tips_and_trick.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTipsAndTrick extends StatelessWidget{
  final TipsAndTrick tipsAndTrick;
  const DetailTipsAndTrick({super.key, required this.tipsAndTrick});

  _launchURL() async {
  var url = tipsAndTrick.article_url;
  print(url);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips And Trick'),
      ),
      drawer: buildDrawer(context),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Hero(
              tag: tipsAndTrick.title,
              child: Image.network(
                tipsAndTrick.image_url,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .43,
                fit: BoxFit.cover,
                errorBuilder: (
                  BuildContext context,
                  Object exception,
                  StackTrace? stackTrace,
                ) {
                  return Image.network(
                    "{$tipsAndTrick.image_url}",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * .43,
                  );
                },
              ),
            ),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: MediaQuery.of(context).size.height * .75,
                  padding: const EdgeInsets.only(
                    left: 19,
                    right: 19,
                    top: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        // color: secondaryColor.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: const Offset(
                          0,
                          2,
                        ),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tipsAndTrick.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        Row(
                          children: [
                            const Icon(
                              Icons.person,
                              // color: darkSecondaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Author: ${tipsAndTrick.source}',
                                // style: myTextTheme.caption,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_rounded,
                              // color: darkSecondaryColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Published Date: ${tipsAndTrick.published_date}',
                                // style: myTextTheme.caption,
                              ),
                            ),
                          ],
                        ),
                        const Divider(color: Colors.grey),
                        Text(
                          tipsAndTrick.brief_description,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          // style: ElevatedButton.styleFrom(
                          //   primary: darkSecondaryColor,
                          //   textStyle: myTextTheme.button,
                          // ),
                          child: const Center(
                            child: Text('Read more'),
                          ),
                          onPressed: () {
                            _launchURL();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}