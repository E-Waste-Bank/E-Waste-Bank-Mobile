import 'package:tips_and_tricks/util/add_tips_and_trick.dart';
import 'package:flutter/material.dart';
import 'package:tips_and_tricks/model/TipsAndTrick.dart';
import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:e_waste_bank_mobile/authentication/user_provider.dart';

class AddTipsAndTrickPage extends StatefulWidget {
  const AddTipsAndTrickPage({super.key});

  @override
  State<AddTipsAndTrickPage> createState() => _AddTipsAndTrickPage();
}

class _AddTipsAndTrickPage extends State<AddTipsAndTrickPage> {
  final _formKey = GlobalKey<FormState>();
  final _clearTitle = TextEditingController();
  final _clearSource = TextEditingController();
  final _clearImageUrl = TextEditingController();
  final _clearArticleUrl = TextEditingController();
  final _clearBriefDescription = TextEditingController();
  
  String title = "";
  String source = "";
  DateTime? _publised_date;
  String image_url = "";
  String article_url = "";
  String brief_description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Tips & Tricks Article'),
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Contoh: Kelebihan dari memakai totebag",
                                          labelText: "Title",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                5.0),
                                          ),
                                        ),

                                        controller: _clearTitle,

                                        onChanged: (String? value) {
                                          setState(() {
                                            title = value!;
                                          });
                                        },

                                        onSaved: (String? value) {
                                          setState(() {
                                            title = value!;
                                          });
                                        },

                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Judul Article tidak boleh kosong!';
                                          }
                                          return null;
                                        }
                                    ),

                                    const SizedBox(height: 10,),

                                    TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Contoh: Maya",
                                          labelText: "Article Source/Author",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                5.0),
                                          ),
                                        ),

                                        controller: _clearSource,

                                        onChanged: (String? value) {
                                          setState(() {
                                            source = value!;
                                          });
                                        },

                                        onSaved: (String? value) {
                                          setState(() {
                                            source = value!;
                                          });
                                        },

                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Article Source/Author tidak boleh kosong!';
                                          }
                                          return null;
                                        }
                                    ),

                                    const SizedBox(height: 10,),

                                    TextButton(
                                      child: Text(_publised_date == null
                                          ? "Pick a date"
                                          : "${_publised_date!
                                          .day}/${_publised_date!
                                          .month}/${_publised_date!.year}"),
                                      // Event Handling for Button
                                      onPressed: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2099),
                                        ).then((date) {
                                          // Tambahkan setState dan panggil variabel _dateTime.
                                          setState(() {
                                            _publised_date = date;
                                          });
                                        });
                                      },
                                    ),

                                    const SizedBox(height: 10,),

                                    TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Contoh: https://www.genevaenvironmentnetwork.org/wp-content/uploads/2020/09/ewaste-aspect-ratio-2000-1200-1024x614.jpg",
                                          labelText: "Image URL",
                                          // icon: const Icon(Icons.add_circle),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                5.0),
                                          ),
                                        ),

                                        controller: _clearImageUrl,

                                        onChanged: (String? value) {
                                          setState(() {
                                            image_url = value!;
                                          });
                                        },

                                        onSaved: (String? value) {
                                          setState(() {
                                            image_url = value!;
                                          });
                                        },

                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Image URL tidak boleh kosong!';
                                          }
                                          return null;
                                        }
                                    ),

                                    const SizedBox(height: 10,),

                                    TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Contoh: https://www.theartofsimple.net/10-ways-to-recycle-your-technology-and-manage-e-waste/",
                                          labelText: "Article URL",
                                          // icon: const Icon(Icons.add_circle),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                5.0),
                                          ),
                                        ),

                                        controller: _clearArticleUrl,

                                        onChanged: (String? value) {
                                          setState(() {
                                            article_url = value!;
                                          });
                                        },

                                        onSaved: (String? value) {
                                          setState(() {
                                            article_url = value!;
                                          });
                                        },

                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Article URL tidak boleh kosong!';
                                          }
                                          return null;
                                        }
                                    ),

                                    const SizedBox(height: 10,),

                                    TextFormField(
                                        decoration: InputDecoration(
                                          hintText: "Contoh: Let's managing e-waste",
                                          labelText: "Article Brief Description",
                                          // icon: const Icon(Icons.add_circle),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                5.0),
                                          ),
                                        ),

                                        controller: _clearBriefDescription,

                                        onChanged: (String? value) {
                                          setState(() {
                                            brief_description = value!;
                                          });
                                        },

                                        onSaved: (String? value) {
                                          setState(() {
                                            brief_description = value!;
                                          });
                                        },

                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Article Brief Description tidak boleh kosong!';
                                          }
                                          return null;
                                        }
                                    ),

                                    // const Spacer(),
                                    const SizedBox(height: 30,),

                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: TextButton(
                                        child: const Text("Submit",
                                          style: TextStyle(
                                              color: Colors.white),),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty
                                              .all(Colors.blue),
                                        ),
                                        onPressed: () {
                                          final username = Provider.of<UserProvider>(context, listen: false).getUsername();
                                          if (_formKey.currentState!
                                              .validate() &&
                                              _publised_date != null) {
                                            String publisedDate = _publised_date
                                                .toString().substring(0, 10);
                                            TipsAndTrick tipsAndTrick = new TipsAndTrick(
                                                user: username,
                                                title: title,
                                                source: source,
                                                published_date: publisedDate,
                                                brief_description: brief_description,
                                                image_url: image_url,
                                                article_url: article_url);
                                            addTipsAndTrick(tipsAndTrick);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                      "Data berhasil ditambahkan!"),
                                                  action: SnackBarAction(
                                                    label: 'Close',
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .hideCurrentSnackBar();
                                                    },
                                                  ),
                                                )
                                            );
                                            _clearTitle.clear();
                                            _clearSource.clear();
                                            _clearImageUrl.clear();
                                            _clearArticleUrl.clear();
                                            _clearBriefDescription.clear();

                                            setState(() {
                                              _publised_date = null;
                                            });
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                      "Mohon isi data dengan lengkap!"),
                                                  action: SnackBarAction(
                                                    label: 'Close',
                                                    textColor: Colors.white,
                                                    onPressed: () {
                                                      ScaffoldMessenger.of(
                                                          context)
                                                          .hideCurrentSnackBar();
                                                    },
                                                  ),
                                                )
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ]
                              )
                          )
                        ]
                    )
                )
            )
        )
    );
  }
}