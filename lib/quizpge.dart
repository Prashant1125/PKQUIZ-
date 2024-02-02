import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:pkquiz/resultpage.dart';
import 'package:pkquiz/services/admob/ad_manager.dart';

import 'Home.dart';

// ignore: must_be_immutable
class getjson extends StatefulWidget {
  // accept the langname as a parameter

  String langname;
  getjson(this.langname);

  @override
  State<getjson> createState() => _getjsonState();
}

class _getjsonState extends State<getjson> {
  String? assettoload;

  // a function
  setasset() {
    if (widget.langname == "GENERAL KNOWLEDGE") {
      assettoload = "assets/python.json";
    } else if (widget.langname == "REASONING") {
      assettoload = "assets/reasoning.json";
    } else if (widget.langname == "APTITUDE") {
      assettoload = "assets/aptitude.json";
    } else if (widget.langname == "SPORTS") {
      assettoload = "assets/sports.json";
    } else {
      assettoload = "assets/mathematics.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    setasset();
    print(assettoload);
    return FutureBuilder(
      future:
          DefaultAssetBundle.of(context).loadString(assettoload!, cache: false),
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          List mydata = json.decode(snapshot.data.toString());
          // ignore: unnecessary_null_comparison
          if (mydata == null) {
            return Scaffold(
              body: Center(
                child: Text(
                  "Loading",
                ),
              ),
            );
          } else {
            return quizpage(mydata: mydata);
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class quizpage extends StatefulWidget {
  final List mydata;

  quizpage({Key? key, required this.mydata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
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

  Timer? timer;
  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;
  // extra varibale to iterate
  int j = 1;
  int time = 30;
  String showtimer = "30";
  List<int> random_array = [];

  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  bool canceltimer = false;

  // code inserted for choosing questions randomly
  // to create the array elements randomly use the dart:math module
  // -----     CODE TO GENERATE ARRAY RANDOMLY

  genrandomarray() {
    random_array = List.generate(11, (index) => index);
    random_array.remove(0);
    random_array.shuffle();
    print(random_array);
  }

  @override
  void initState() {
    starttimer();
    genrandomarray();
    super.initState();
    loadAd();
  }

  // overriding the setstate function to be called only if mounted
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      timer = t;
      setState(() {
        if (time < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          time = time - 1;
        }
        showtimer = time.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    time = 30;
    setState(() {
      if (j < 10) {
        i = random_array[j];
        print(i);
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResultPage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
      disableAnswer = false;
    });
    starttimer();
  }

  void checkanswer(String k) {
    if (widget.mydata[2][i.toString()] == widget.mydata[1][i.toString()][k]) {
      marks = marks + 5;

      colortoshow = right;
    } else {
      colortoshow = wrong;
    }
    setState(() {
      // applying the changed color to the particular button that was selected
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;
    });
    // nextquestion();
    // changed timer duration to 1 second
    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          widget.mydata[1][i.toString()][k],
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
        height: 45.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.mydata);
    // print(widget.mydata[0]);
    // print(i);

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(
                    "Quizstar",
                  ),
                  content: Text("Are You Think To Quit Of PKQUIZ."),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'No',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        timer!.cancel();
                        marks = 0;
                        i = 0;
                        j = 0;

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text(
                        'Yes',
                      ),
                    ),
                  ],
                ));
        return true;
      },
      child: Scaffold(
        appBar: _bannerAd == null || !_isLoaded
            ? AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  "QUESTIONS",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "times new roman",
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
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
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  // ignore: unnecessary_null_comparison
                  widget.mydata != null ? widget.mydata[0][i.toString()] : "",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: AbsorbPointer(
                absorbing: disableAnswer,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      choicebutton('a'),
                      choicebutton('b'),
                      choicebutton('c'),
                      choicebutton('d'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Center(
                  child: Text(
                    showtimer,
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
