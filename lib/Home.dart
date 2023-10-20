import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pkquiz/menu.dart';
import 'package:pkquiz/quizpge.dart';
import 'package:pkquiz/services/admob/ad_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  InterstitialAd? _interstitialAd;

  createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdManager.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            print('InterstitialAd loaded: ${ad.adUnitId}');
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

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
    super.initState();
    loadAd();
    createInterstitialAd();
  }

  List<String> quiztype = [
    "GENERAL KNOWLEDGE",
    "MATHEMATICS",
    "APTITUDE",
    "REASONING",
    "SPORTS",
  ];

  List<String> images = [
    "assets/images/gk.jpg",
    "assets/images/maths.jfif",
    "assets/images/apptitude.png",
    "assets/images/reasoning.png",
    "assets/images/cricket.jfif",
  ];

  List<String> des = [
    " General Knowledge or GK plays a major role in every students life as most of the competitive exams ask various questions based on general knowledge. ",
    "Mathematics in Nature is a science and mathematics unit that allows students to explore and gain knowledge about mathematical patterns found in nature. ",
    "An aptitude test is an exam used to determine an individual's skill or propensity to succeed in a given activity.",
    "Reasoning is the process by which you reach a conclusion after thinking about all the facts.",
    "sport is defined by its social interpretation as well as its strong association with physical exertion and performance measures.",
  ];

  Widget customcard(String quiztype, String images, String des) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: InkWell(
        onTap: (() {
          if (_interstitialAd != null) _interstitialAd!.show();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => getjson(quiztype),
            ),
          );
        }),
        child: Material(
          borderRadius: BorderRadius.circular(20.0),
          color: Color.fromARGB(255, 8, 142, 13),
          elevation: 20.0,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(150),
                    child: Container(
                      width: 150,
                      height: 150,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(images),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    quiztype,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18.0),
                  child: Text(
                    des,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    maxLines: 6,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: CustomDrawer(),
      appBar: _bannerAd == null || !_isLoaded
          ? AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "PKQUIZ",
                // "Banner ad will load here...",
                style: TextStyle(
                  color: Colors.green,
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
      body: ListView(
        children: <Widget>[
          customcard(quiztype[0], images[0], des[0]),
          customcard(quiztype[1], images[1], des[1]),
          customcard(quiztype[2], images[2], des[2]),
          customcard(quiztype[3], images[3], des[3]),
          customcard(quiztype[4], images[4], des[4]),
        ],
      ),
    );
  }
}
