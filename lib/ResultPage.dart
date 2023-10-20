import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pkquiz/Home.dart';
import 'package:pkquiz/services/admob/ad_manager.dart';

class ResultPage extends StatefulWidget {
  int marks;
  ResultPage({Key? key, required this.marks}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;

  /// Loads a banner ad.
  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

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
    loadAd();
  }

  String message = "";
  String image = '';
  int marks = 0;
  // _resultpageState(this.marks);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _bannerAd == null || !_isLoaded
          ? AppBar(
              backgroundColor: Colors.cyan,
              centerTitle: true,
              title: Text(
                "Result",
                // "Banner ad will load here...",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "times new roman",
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                ),
                textAlign: TextAlign.center,
              ),
              elevation: 0,
            )
          : AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              // leading: SizedBox(),
              centerTitle: true,
              title: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: _bannerAd?.size.width.toDouble(),
                  height: _bannerAd?.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height - 200,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Your Result",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: "times new roman",
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 1, 55, 8)),
                ),
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 250,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      image,
                    ),
                  ),
                ),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontFamily: "times new roman",
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 1, 55, 8)),
                ),
                OutlinedButton(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
