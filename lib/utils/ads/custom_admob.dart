import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomAdmob{

  // - - - - - - - - - - - - - - - - - - BANNER - - - - - - - - - - - - - - - - - -  //
  static BannerAd banner({ AdEventCallback? onAdLoaded, AdLoadErrorCallback? onAdFailedToLoad }) {
    const androidAdUnitId = "ca-app-pub-3940256099942544/6300978111";
    const iosAdUnitId = "ca-app-pub-3940256099942544/2934735716";
    final String adUnitId = Platform.isAndroid ? androidAdUnitId : iosAdUnitId;
    return  BannerAd(
      size: AdSize.banner,
      adUnitId: adUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad,
      ),
    );
  }

  // - - - - - - - - - - - - - - - - - - INTERSTITIAL - - - - - - - - - - - - - - - - - -  //
  static void interstitial({ required Function(InterstitialAd) onAdLoaded, required Function(LoadAdError) onAdFailedToLoad }) async{
    //const androidAdUnitId = "ca-app-pub-3940256099942544/6300978111";
    //const iosAdUnitId = "ca-app-pub-3940256099942544/2934735716";
    //final String adUnitId = Platform.isAndroid ? androidAdUnitId : iosAdUnitId;
    const String adUnitId = "ca-app-pub-3940256099942544/1033173712";
    await InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: onAdFailedToLoad
        )
    );
  }

  // - - - - - - - - - - - - - - - - - - NATIVE - - - - - - - - - - - - - - - - - -  //

  // - - - - - - - - - - - - - - - - - - REWARD VIDEO - - - - - - - - - - - - - - - - - -  //

}