import 'dart:io';

import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class CustomFacebook{
  CustomFacebook._();

  /* SETUP */
  static void setup() async{
    await FacebookAudienceNetwork.init(
        testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6",
        iOSAdvertiserTrackingEnabled: true
    );
  }

  // - - - - - - - - - - - - - - - - - - BANNER - - - - - - - - - - - - - - - - - -  //
  static FacebookBannerAd banner(){
    return FacebookBannerAd(
      placementId: Platform.isAndroid ? "YOUR_ANDROID_PLACEMENT_ID" : "YOUR_IOS_PLACEMENT_ID",
      bannerSize: BannerSize.STANDARD,
      keepAlive: true,
      listener: (result, value) {
        switch (result) {
          case BannerAdResult.ERROR:
            print("+++++++");
            print("Error: $value");
            print("+++++++");
            break;
          case BannerAdResult.LOADED:
            print("+++++++");
            print("Loaded: $value");
            print("+++++++");
            break;
          case BannerAdResult.CLICKED:
            print("+++++++");
            print("Clicked: $value");
            print("+++++++");
            break;
          case BannerAdResult.LOGGING_IMPRESSION:
            print("+++++++");
            print("Logging Impression: $value");
            print("+++++++");
            break;
        }
      },
    );
  }

  // - - - - - - - - - - - - - - - - - - INTERSTITIAL - - - - - - - - - - - - - - - - - -  //
  static void interstitial() async{
    await FacebookInterstitialAd.loadInterstitialAd(
      placementId: "YOUR_PLACEMENT_ID",
      listener: (result, value) {
        if (result == InterstitialAdResult.LOADED) {
          FacebookInterstitialAd.showInterstitialAd(delay: 5000);
        }
      },
    );
  }

  // - - - - - - - - - - - - - - - - - - REWARD - - - - - - - - - - - - - - - - - -  //
  static void reward() async{
    // (Android Only)
    await FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "YOUR_PLACEMENT_ID",
      listener: (result, value) {
        if(result == RewardedVideoAdResult.LOADED) {
          FacebookRewardedVideoAd.showRewardedVideoAd();
        }
      }
    );
  }

  // - - - - - - - - - - - - - - - - - - NATIVE - - - - - - - - - - - - - - - - - -  //
  static FacebookNativeAd native(){
    return FacebookNativeAd(
      placementId: "YOUR_PLACEMENT_ID",
      adType: Platform.isAndroid ? NativeAdType.NATIVE_AD : NativeAdType.NATIVE_AD_HORIZONTAL,
      width: double.infinity,
      height: 300,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      keepAlive: true,
      keepExpandedWhileLoading: false,
      expandAnimationDuraion: 300,
      listener: (result, value) { print("Native Ad: $result --> $value"); },
    );
  }

  // - - - - - - - - - - - - - - - - - - NATIVE BANNER - - - - - - - - - - - - - - - - - -  //
  static FacebookNativeAd nativeBanner(){
    return FacebookNativeAd(
      placementId: "YOUR_PLACEMENT_ID",
      adType: Platform.isAndroid ? NativeAdType.NATIVE_AD : NativeAdType.NATIVE_AD_HORIZONTAL,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) { print("Native Ad: $result --> $value"); },
    );
  }

}