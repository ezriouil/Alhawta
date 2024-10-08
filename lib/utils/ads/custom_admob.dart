import 'dart:io';

import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomAdmob{
  CustomAdmob._();

  /* SETUP */
  static void setup() async{ await MobileAds.instance.initialize(); }

  // - - - - - - - - - - - - - - - - - - BANNER - - - - - - - - - - - - - - - - - -  //
  static BannerAd banner({ required void Function(Ad)? onAdLoaded, required void Function(Ad, LoadAdError)? onAdFailedToLoad  }) {
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
  static void interstitial({ required void Function(InterstitialAd) onAdLoaded, required void Function(LoadAdError) onAdFailedToLoad }) async{
    //const androidAdUnitId = "ca-app-pub-3940256099942544/6300978111";
    //const iosAdUnitId = "ca-app-pub-3940256099942544/2934735716";
    //final String adUnitId = Platform.isAndroid ? androidAdUnitId : iosAdUnitId;
    const String adUnitId = "ca-app-pub-3940256099942544/1033173712";
    await InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: onAdLoaded,
            onAdFailedToLoad: onAdFailedToLoad,
        )
    );
  }

  // - - - - - - - - - - - - - - - - - - APP OPEN - - - - - - - - - - - - - - - - - -  //
  static void appOpen() async{
    //const androidAdUnitId = "ca-app-pub-3940256099942544/6300978111";
    //const iosAdUnitId = "ca-app-pub-3940256099942544/2934735716";
    //final String adUnitId = Platform.isAndroid ? androidAdUnitId : iosAdUnitId;
    const String adUnitId = "ca-app-pub-3940256099942544/9257395921";
    await AppOpenAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (AppOpenAd ad){
              try{
                ad.fullScreenContentCallback = FullScreenContentCallback(
                  onAdFailedToShowFullScreenContent: (ad, error){ ad.dispose(); },
                  onAdDismissedFullScreenContent: (ad){ ad.dispose(); },
                );
                ad.show();
              }catch(_){}
            },
            onAdFailedToLoad: (LoadAdError error){}
        )
    );
  }

  // - - - - - - - - - - - - - - - - - - NATIVE - - - - - - - - - - - - - - - - - -  //
  static NativeAd native({ required void Function(Ad) onAdLoaded, required dynamic Function(Ad, LoadAdError) onAdFailedToLoad }) {
    //const androidAdUnitId = "ca-app-pub-3940256099942544/6300978111";
    //const iosAdUnitId = "ca-app-pub-3940256099942544/2934735716";
    //final String adUnitId = Platform.isAndroid ? androidAdUnitId : iosAdUnitId;
    const String adUnitId = "ca-app-pub-3940256099942544/2247696110";
    return NativeAd(
        adUnitId: adUnitId,
        request: const AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad
        ),
        nativeTemplateStyle: NativeTemplateStyle(
            templateType: TemplateType.small,
            mainBackgroundColor: CustomColors.WHITE,
            cornerRadius: 10.0,
            callToActionTextStyle: NativeTemplateTextStyle(
                textColor: CustomColors.WHITE,
                backgroundColor: CustomColors.BLUE_LIGHT,
                style: NativeTemplateFontStyle.normal,
                size: 12.0
            ),
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: CustomColors.BLACK,
                backgroundColor: CustomColors.WHITE,
                style: NativeTemplateFontStyle.bold,
                size: 12.0
            ),
        )
    );
  }

  // - - - - - - - - - - - - - - - - - - REWARD - - - - - - - - - - - - - - - - - -  //
  static void reward({ required void Function(RewardedAd) onAdLoaded, required void Function(LoadAdError) onAdFailedToLoad }) async{
    //const androidAdUnitId = "ca-app-pub-3940256099942544/6300978111";
    //const iosAdUnitId = "ca-app-pub-3940256099942544/2934735716";
    //final String adUnitId = Platform.isAndroid ? androidAdUnitId : iosAdUnitId;
    const String adUnitId = "ca-app-pub-3940256099942544/5224354917";
    RewardedAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad,
        )
    );
  }

  // - - - - - - - - - - - - - - - - - - REWARD INTERSTITIAL  - - - - - - - - - - - - - - - - - -  //
  static void rewardInterstitial({ required void Function(RewardedInterstitialAd) onAdLoaded, required void Function(LoadAdError) onAdFailedToLoad }) async{
    //const androidAdUnitId = "ca-app-pub-3940256099942544/6300978111";
    //const iosAdUnitId = "ca-app-pub-3940256099942544/2934735716";
    //final String adUnitId = Platform.isAndroid ? androidAdUnitId : iosAdUnitId;
    const String adUnitId = "ca-app-pub-3940256099942544/5354046379";
    RewardedInterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: onAdLoaded,
          onAdFailedToLoad: onAdFailedToLoad
        )
    );
  }

}