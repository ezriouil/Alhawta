import 'dart:io';

import 'package:unity_ads_plugin/unity_ads_plugin.dart';

class CustomUnity{
  CustomUnity._();

  /*INFO*/
  static const _androidGameId = "5708799";
  static const _iosGameId = "5708798";
  static final String _gameId = Platform.isAndroid ? _androidGameId : _iosGameId;
  static final String _bannerPlacementId = Platform.isAndroid ? "Banner_Android" : "Banner_iOS";
  static final String _interstitialPlacementId = Platform.isAndroid ? "Interstitial_Android" : "Interstitial_iOS";
  static final String _rewardPlacementId = Platform.isAndroid ? "Rewarded_Android" : "Rewarded_iOS";

  /* SETUP */
  static void setup() async{
    await UnityAds.init(
        gameId: _gameId,
        testMode: true,
        onComplete: () {
          UnityAds.load(placementId: _bannerPlacementId);
          UnityAds.load(placementId: _interstitialPlacementId);
          UnityAds.load(placementId: _rewardPlacementId);
        }
    );
  }

  // - - - - - - - - - - - - - - - - - - BANNER - - - - - - - - - - - - - - - - - -  //
  static UnityBannerAd banner() => UnityBannerAd(placementId: _bannerPlacementId, size: BannerSize.iabStandard);

  // - - - - - - - - - - - - - - - - - - INTERSTITIAL - - - - - - - - - - - - - - - - - -  //
  static void interstitial() async{
    if(!await UnityAds.isInitialized()) return;
    await UnityAds.showVideoAd(
        placementId: _interstitialPlacementId,
        onComplete: (placementId) async{ await UnityAds.load(placementId: placementId); }
    );
  }

  // - - - - - - - - - - - - - - - - - - REWARD - - - - - - - - - - - - - - - - - -  //
  static void reward() async{
    if(!await UnityAds.isInitialized()) return;
    await UnityAds.showVideoAd(
        placementId: _rewardPlacementId,
        onComplete: (placementId) async{ await UnityAds.load(placementId: placementId); }
    );
  }

}
