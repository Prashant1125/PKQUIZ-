import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pkquiz/login.dart';

import 'Home.dart';

class SignDemo extends StatefulWidget {
  const SignDemo({super.key});

  @override
  State<SignDemo> createState() => _SignDemoState();
}

class _SignDemoState extends State<SignDemo> {
  var firebaseAuth = FirebaseAuth.instance;

  var emailController = TextEditingController();
  var pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                const Text(
                  "Welcome to Sign Up Page",
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
                    const CustomTextField(
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomTextField(
                      labelText: 'Password',
                      hintText: 'Enter secure password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 50),
                            backgroundColor: Colors.blue),
                        child: const Text(
                          'Sign up ',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          firebaseAuth
                              .createUserWithEmailAndPassword(
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
                        }),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text(
                          'If you have already sign up ',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginDemo()));
                            },
                            child: const Text(
                              'Login.',
                              // textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 18, color: Colors.blue),
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
