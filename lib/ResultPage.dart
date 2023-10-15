import 'package:flutter/material.dart';
import 'package:pkquiz/Home.dart';

class ResultPage extends StatefulWidget {
  int marks;
  ResultPage({Key? key, required this.marks}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String message = "";
  String image = '';

  @override
  void initState() {
    marks = widget.marks;
    if (marks < 15) {
      image = 'assets/images/fail.jpg';
      message =
          "Your Performance is Low...\n But You Can Do Better\nYou Scored $marks marks";
    } else if (marks < 30) {
      image = 'assets/images/average.jpg';
      message =
          "Your Performance is Good...\nYou Can Do Better...\n You Scored $marks marks";
    } else if (marks < 40) {
      image = 'assets/images/better.jpg';
      message = "Your Performance is Better...\n You Scored $marks marks";
    } else if (marks <= 50) {
      image = 'assets/images/success.jpg';
      message =
          "Your Performance is unbelievale...\n All The Best For Your Great Future...\n You Scored $marks marks";
    }
    super.initState();
  }

  int marks = 0;
  // _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Result",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Material(
                elevation: 25.0,
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    image,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(25),
                child: Center(
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: "times new roman",
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 1, 55, 8)),
                  ),
                )),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(15)),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
