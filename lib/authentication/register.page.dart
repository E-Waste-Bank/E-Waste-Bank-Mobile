import 'package:about_us/about_us.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

import 'package:e_waste_bank_mobile/drawer.dart';
import 'package:e_waste_bank_mobile/main.dart';
import 'package:e_waste_bank_mobile/authentication/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _registerPageFormKey = GlobalKey<FormState>();

  String username = "";
  String password = "";
  String passwordConfirmation = "";
  var _isObscuredPassword;
  var _isObscuredConfirmation;

  @override
  void initState() {
    super.initState();
    _isObscuredPassword = true;
    _isObscuredConfirmation = true;
  }

  @override
  Widget build(BuildContext context) {
    final requester = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulir Registrasi"),
      ),
      drawer: const MyDrawer(),
      body: Form(
          key: _registerPageFormKey,
          child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Username anda",
                                labelText: "Username",
                                icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            onChanged: (String? value) {
                              setState(() {
                                username = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                username = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Password anda",
                                labelText: "Password",
                                icon: const Icon(Icons.people),
                                suffixIcon: IconButton(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 12.0),
                                  icon: _isObscuredPassword
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscuredPassword =
                                          !_isObscuredPassword;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            obscureText: _isObscuredPassword,
                            onChanged: (String? value) {
                              setState(() {
                                password = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                password = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Password",
                                labelText: "Ketik ulang password",
                                icon: const Icon(Icons.people),
                                suffixIcon: IconButton(
                                  padding: const EdgeInsetsDirectional.only(
                                      end: 12.0),
                                  icon: _isObscuredConfirmation
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isObscuredConfirmation =
                                          !_isObscuredConfirmation;
                                    });
                                  },
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                            obscureText: _isObscuredConfirmation,
                            onChanged: (String? value) {
                              setState(() {
                                passwordConfirmation = value!;
                              });
                            },
                            onSaved: (String? value) {
                              setState(() {
                                passwordConfirmation = value!;
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Empty password";
                              } else if (value != password) {
                                return "Password tidak cocok";
                              }
                              return null;
                            },
                          ),
                        ),
                        // const Spacer(),

                        TextButton(
                          onPressed: () async {
                            if (_registerPageFormKey.currentState!.validate()) {
                              final response = await requester.post(
                                  "http://e-waste-bank.up.railway.app/auth/register/",
                                  {
                                    // TODO ganti ke url local masing2 buat develop and debug
                                    'username': username,
                                    'password1': password,
                                    'password2': passwordConfirmation,
                                  });

                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 15,
                                        child: ListView(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            const Center(
                                              child: Text(
                                                "Register berhasil!",
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(height: 30),
                                            TextButton(
                                              onPressed: () {
                                                // pop untuk menutup dialog box
                                                Navigator.pop(context);
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const AboutUsPage()));
                                              },
                                              child: const Text(
                                                'OK',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }));
                              } else {
                                showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        elevation: 15,
                                        child: ListView(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20),
                                          shrinkWrap: true,
                                          children: <Widget>[
                                            const Center(
                                              child: Text(
                                                "Register gagal",
                                                style:  TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(height: 30),
                                            TextButton(
                                              onPressed: () {
                                                // pop untuk menutup dialog box
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                'OK',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }));
                              }
                            },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ])))),
    );
  }
}
