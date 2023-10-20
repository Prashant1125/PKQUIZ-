import 'dart:io';

class AdManager {
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2549901567918015~5175826167";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2549901567918015~7414183139";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2549901567918015/9307013991";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2549901567918015/1636873157";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-2549901567918015/6823502642";
    } else if (Platform.isIOS) {
      return "ca-app-pub-2549901567918015/6314484762";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "<ca-app-pub-2549901567918015/4791516898";
    } else if (Platform.isIOS) {
      return "<ca-app-pub-2549901567918015/1041426848>";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get bannerTestAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
