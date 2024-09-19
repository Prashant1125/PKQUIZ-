import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Contact Us",
            style:
                TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: mq.height * .04,
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/icon/contact.jpg",
                width: 250,
              ),
            ),
            SizedBox(
              height: mq.height * .04,
            ),
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 110,
                      width: 110,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.orange.shade100),
                              child: IconButton(
                                onPressed: () {
                                  launchUrl(Uri.parse('tel:9977676213'));
                                },
                                icon: const Icon(
                                  Icons.phone,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Call Us',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 110,
                      width: 110,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.green.shade100),
                              child: IconButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      'mailto:patelprashant2572@gmail.com'));
                                },
                                icon: const Icon(
                                  Icons.mail,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Email Us',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 110,
                      width: 110,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.red.shade100),
                              child: IconButton(
                                onPressed: () {
                                  launchUrl(Uri.parse(
                                      "https://www.instagram.com/dear_comrade_pk_007/"));
                                },
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('Instragram',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * .07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(
                          "https://www.facebook.com/profile.php?id=100028765277487"));
                    },
                    child: Image.asset(
                      'assets/icon/facebook.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: mq.height * .015,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: InkWell(
                    onTap: () {
                      launchUrl(Uri.parse(
                          "https://www.linkedin.com/in/prashant-kushwaha-4a014b243/"));
                    },
                    child: Image.asset(
                      'assets/icon/linkdin.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: mq.height * .015,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: InkWell(
                    onTap: () {
                      launchUrl(Uri.parse("https://github.com/Prashant1125"));
                    },
                    child: Image.asset(
                      'assets/icon/github.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: mq.height * .015,
                ),
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('sms:9977676213'));
                    },
                    child: Image.asset(
                      'assets/icon/whatshapp.png',
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
