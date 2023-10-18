import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pkquiz/login.dart';
import 'package:pkquiz/profile.dart';
import 'Home.dart';
import 'about.dart';
import 'conatct.dart';
import 'feedback.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
          ),
        ),
        child: Image.asset("assets/images/menu.jfif"),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          runSpacing: 15,
          children: [
            ListTile(
                leading: const Icon(Icons.account_box),
                title: const Text("MY PROFILE"),
                onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileView(),
                      ),
                    )),
            ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text("HOME"),
                onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    )),
            ListTile(
              leading: const Icon(Icons.contact_phone_outlined),
              title: const Text("CONTACT US"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContactPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feed),
              title: Text("ABOUT"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text("FEEDBACK"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedbackDialog(),
                  ),
                );
              },
            ),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("LOGOUT"),
                onTap: () {
                  firebaseAuth.signOut().then((value) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginDemo(),
                      ),
                    );
                  });
                }),
          ],
        ),
      );
}
