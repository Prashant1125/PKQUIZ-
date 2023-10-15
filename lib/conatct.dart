import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "CONTACT US",
          style: TextStyle(color: Colors.cyan),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                ),
              ),
              child: Image.asset("assets/images/contact.jpg"),
            ),
            const Padding(padding: EdgeInsets.only(top: 50.0, bottom: 30)),
            const Text(
              "Name-PRASHANT KUSHWAHA\n\nContact No - 9977676213\n\nEmail - patelprashant2572@gmail.com",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: "times new roman",
                  color: Color.fromARGB(255, 5, 89, 7),
                  fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.only(top: 100.0, bottom: 30)),
            const Text(
              "-: DEVLOPED BY :-\n PRASHANT PATEL\n(PK)",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
