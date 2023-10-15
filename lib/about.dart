import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "ABOUT THIS APP",
          style: TextStyle(color: Colors.pinkAccent),
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Text(
              "1. INTODUCTON",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontFamily: "times new roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "In the test menu there are subjects in which we can select among some subjects and for every test it contains 20 questions and marks will be allotted for the right one. References give the overall ideas and concepts included in the subjects.",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "2. FEATURES",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontFamily: "times new roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              " Easy way to test knowledge. User-friendly app for easy understanding. Can reduce usage of resources like paper.",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "3. RELATED WORK",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontFamily: "times new roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "The main theme of this app is to save the time while conducting examinations.Generally, to conduct exam we need so much infrastructure ,but here if we have the application installed is enough for the examination.",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "4. ADVANTAGES",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontFamily: "times new roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "It is a time saving process. User can login and take test from any place. It can be used in events for conducting test.Reduces paper",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "5. Technologies Used",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontFamily: "times new roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "The first truly opened comprehensive platform for mobile devices, all of the software to run a mobile phone but without the proprietary obstacles that have hindered mobile innovation .\n flutter ,Dart Programming Language.",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "6. FUTURE SCOPE",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontFamily: "times new roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "In this application, answer will not display only result will be displayed at last. It is our future enhancement to display answer while answering the question. Can be used at fest is in college for quiz contest.",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Text(
              "7. CONCLUSION",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontFamily: "times new roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Here, in this application we can test our ability by writing test. If we have any doubts we check by provided reference books and videos in the same application. Without opening books or videos in other browser we can check in the same application.",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 18,
                  fontStyle: FontStyle.italic),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              " -:REFERENCES:- ",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontFamily: "times new roman",
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Flutter , Dart , Desi Programmer, YouTube , Google, Github",
              style: TextStyle(
                  fontSize: 18, fontStyle: FontStyle.italic, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
