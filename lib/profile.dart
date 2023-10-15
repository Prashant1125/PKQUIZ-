import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pkquiz/Home.dart';
import 'package:pkquiz/menu.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    user = firebaseAuth.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Container(
                width: 1000,
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 15),
                child: Text(
                  "Welcome to My Profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontFamily: "times new roman",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Container(
                width: 1000,
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 15),
                child: Icon(
                  Icons.account_box_rounded,
                  size: 200,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Container(
                width: 1000,
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(
                  (user?.displayName ?? "Unkown Name"),
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Container(
                width: 1000,
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(
                  (user?.phoneNumber ?? "Unkown Mobile No."),
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: Container(
                width: 1000,
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 15),
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Text(
                  (user?.email ?? "Unknown"),
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 65,
              width: 360,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Done ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // body: ListView(
      //   // mainAxisAlignment: MainAxisAlignment.center,
      //   // crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //
      //     Text(user?.displayName ?? "Unknown"),
      //     Text(user?.email ?? "Unknown"),
      //   ],
      // ),
    );
  }
}
