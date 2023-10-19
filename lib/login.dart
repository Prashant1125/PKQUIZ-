import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pkquiz/forget.dart';

import 'package:pkquiz/sign.dart';

import 'Home.dart';

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  var firebaseAuth = FirebaseAuth.instance;

  var emailController = TextEditingController();
  var pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   title: const Text("PKQUIZ"),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height - 100,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  "Welcome to",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blue,
                      fontFamily: "times new roman",
                      fontWeight: FontWeight.bold),
                ),
                Center(
                  child: SizedBox(
                      width: 250,
                      height: 250,
                      child: Image.asset('assets/images/splace1.jfif')),
                ),
                Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      labelText: "Email",
                      hintText: "Enter Email",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: pwdController,
                      labelText: "Password",
                      hintText: "Enter Password",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, 50),
                          backgroundColor: Colors.blue),
                      child: const Text(
                        'Log in ',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () {
                        firebaseAuth
                            .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: pwdController.text)
                            .then((value) {
                          Fluttertoast.showToast(msg: "Login successfully");
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        }).onError((error, stackTrace) {
                          if (error is FirebaseAuthException) {
                            Fluttertoast.showToast(
                                msg: error.message ?? "error");
                          } else {
                            Fluttertoast.showToast(msg: error.toString());
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const Forget(),
                              ),
                            );
                          },
                          child: const Text(
                            'Forget Password',
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text(
                        "You don't have account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const SignDemo(),
                              ),
                            );
                          },
                          child: const Text(
                            'Create new account',
                            style: TextStyle(fontSize: 17, color: Colors.blue),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  const CustomTextField({
    Key? key,
    this.controller,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white, fontSize: 18),
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.blue),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.blue),
          ),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.blue),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.red)),
    );
  }
}
