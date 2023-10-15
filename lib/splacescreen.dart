import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pkquiz/Home.dart';
import 'package:pkquiz/login.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => firebaseAuth.currentUser != null
            ? const HomePage()
            : const LoginDemo(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/splace1.jfif",
              height: 250,
            ),
            const Text(
              " WELCOME TO \n PKQUIZ \n ARE YOU READY",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 2, 59, 4),
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
                fontFamily: "times new roman",
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                const Text(
                  "-:DEVLOPED BY:-\n PRASHANT PATEL \n PK",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.pink,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // );
  }
}
