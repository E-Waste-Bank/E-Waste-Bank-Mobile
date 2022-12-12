import 'package:flutter/material.dart';
import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddPenjemputan extends StatefulWidget {
  const AddPenjemputan({super.key});

  @override
  State<AddPenjemputan> createState() => _AddPenjemputan();
}

class _AddPenjemputan extends State<AddPenjemputan> {
  final _formKey = GlobalKey<FormState>();
  final _clearJenisSampah = TextEditingController();
  final _clearAlamat = TextEditingController();
  final _clearBeratSampah = TextEditingController();
  String jenisSampah = "";
  String alamat = "";
  String beratSampah = "";
  DateTime? tanggalJemput;
  TimeOfDay? waktuJemput;

  @override
  Widget build(BuildContext context) {
    CookieRequest requester = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add penjemputan'),
      ),
      drawer: const MyDrawer(),
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
                            hintText: "Sampah Rumah Tangga",
                            labelText: "Jenis Sampah",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          controller: _clearJenisSampah,
                          onChanged: (String? value) {
                            setState(() {
                              jenisSampah = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              jenisSampah = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Jenis sampah tidak boleh kosong!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            hintText: "Fasilkom Gedung Baru",
                            labelText: "Alamat",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          controller: _clearAlamat,
                          onChanged: (String? value) {
                            setState(() {
                              alamat = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              alamat = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Alamat tidak boleh kosong!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Contoh: 10",
                            labelText: "Berat Sampah",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          controller: _clearBeratSampah,
                          onChanged: (String? value) {
                            setState(() {
                              beratSampah = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              beratSampah = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Berat sampah tidak boleh kosong!';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Berat sampah harus berupa angka!';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        child: Text(tanggalJemput == null
                            ? "pilih tanggal jemput"
                            : "${tanggalJemput!.day}/${tanggalJemput!.month}/${tanggalJemput!.year}"),
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
                              tanggalJemput = date;
                            });
                          });
                        },
                      ),
                      TextButton(
                        child: Text(waktuJemput == null
                            ? "pilih waktu jemput"
                            : "${waktuJemput!.hour}:${waktuJemput!.minute}"),
                        // Event Handling for Button
                        onPressed: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((time) {
                            // Tambahkan setState dan panggil variabel _dateTime.
                            setState(() {
                              waktuJemput = time;
                            });
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final response = await requester.post(
                              "https://e-waste-bank.up.railway.app/penjemputan/add-mobile/",
                              {
                                "jenis_sampah": jenisSampah,
                                "alamat": alamat,
                                "berat_sampah": beratSampah,
                                "tanggal_jemput": tanggalJemput!.toString(),
                                "waktu_jemput":
                                    waktuJemput!.toString().substring(10, 15),
                              },
                            );
                            if (response['status']) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.green,
                                // ignore: prefer_const_constructors
                                content: Text(
                                  "${response['message']}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                action: SnackBarAction(
                                  label: 'Close',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                  },
                                ),
                              ));
                              _clearJenisSampah.clear();
                              _clearAlamat.clear();
                              _clearBeratSampah.clear();
                              setState(() {
                                jenisSampah = "";
                                alamat = "";
                                beratSampah = "";
                                tanggalJemput = null;
                                waktuJemput = null;
                              });
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  // ignore: prefer_const_constructors
                                  content: Text(
                                    "${response['message']}",
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                  action: SnackBarAction(
                                    label: 'Close',
                                    textColor: Colors.white,
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                    },
                                  ),
                                ),
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                        ),
                        child: const Text(
                          "submit",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
