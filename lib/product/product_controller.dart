import 'package:alhawta/product/widgets/product_custom_elevated_btn.dart';
import 'package:alhawta/utils/ads/custom_admob.dart';
import 'package:alhawta/utils/constants/custom_api.dart';
import 'package:alhawta/utils/remote/custom_app_write.dart';
import 'package:appwrite/appwrite.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxBool isInWishList;
  late RxBool admobIsBannerAdLoaded, admobIsNativeAdLoaded;
  late RxBool applovinIsBannerAdLoaded;
  late BannerAd admobBannerAd;
  late NativeAd admobNativeAd;
  late InterstitialAd? admobInterstitialAd;
  late RewardedAd? admobRewardedAd;
  late RewardedInterstitialAd? admobRewardedInterstitialAd;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() async{
    super.onInit();
    isInWishList = false.obs;
    admobIsBannerAdLoaded = false.obs;
    admobIsNativeAdLoaded = false.obs;
    admobInterstitialAd = null;
    admobRewardedAd = null;
    admobRewardedInterstitialAd = null;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async{
    admobSetupBanner();
    admobSetupNative();


    Client client = Client();
    client
        .setEndpoint(CustomApi.appWriteEndPoint)
        .setProject(CustomApi.appWriteProject)
        .setSelfSigned(status: true);

    Databases database = Databases(client);

    // await database.createDocument(
    //     databaseId: "67043c8b003446046f0f",
    //     collectionId: "67043cbd001fc10677d9",
    //     documentId: "uid1",
    //     data: {
    //       'uid': "uid1",
    //       'fullName': "Mohamed ezriouil",
    //       'email': "mohamedezriouil@gmail.com",
    //       'avatar': "default_IMG",
    //       'createdAt': "Mon 7 Oct 21:07"
    //     });

    // final response = await database.listDocuments(
    //   databaseId: "67043c8b003446046f0f",
    //   collectionId: "67043cbd001fc10677d9"
    // );
    // print("++++++++");
    // print(response.documents[0].data['fullName']);
    // print(response.documents[0].data['email']);
    // print("++++++++");

    // final response = await database.updateDocument(
    //     databaseId: "67043c8b003446046f0f",
    //     collectionId: "67043cbd001fc10677d9",
    //     documentId: "uid1",
    //     data: {'avatar': "No avatar"}
    // );
    // print("++++++++");
    // print(response.data["avatar"]);
    //  print("++++++++");

    // final response =  await database.deleteDocument(
    //       databaseId: "67043c8b003446046f0f",
    //       collectionId: "67043cbd001fc10677d9",
    //       documentId: "uid1",
    // );

  }
  

  // - - - - - - - - - - - - - - - - - -  CONTACT VIA WHATSAPP - - - - - - - - - - - - - - - - - -  //
  void onContact({ required BuildContext context }) async {

    //admobSetupInterstitial();
    //admobSetupReward();
    //admobSetupRewardInterstitial();

    //CustomUnity.interstitial();
    //CustomUnity.reward();

    await showDialog(
        context: context.mounted ? context : context,
        barrierDismissible: false,
        builder: (BuildContext innerContext) => AlertDialog(
          contentPadding: const EdgeInsets.all(CustomSizes.SPACE_DEFAULT),
          scrollable: true,
          content: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // - - - - - - - - - - - - - - - - - - WHATSAPP ICON - - - - - - - - - - - - - - - - - -  //
                Container(
                  width: CustomSizes.SPACE_BETWEEN_SECTIONS * 4,
                  height: CustomSizes.SPACE_BETWEEN_SECTIONS * 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS),
                    color: context.isDarkMode ? CustomColors.GREEN_LIGHT.withOpacity(0.2) : CustomColors.GREEN_DARK.withOpacity(0.2),
                  ),
                      child: Image.asset(
                        CustomImages.WHATSAPP,
                        height: CustomSizes.SPACE_BETWEEN_SECTIONS,
                        width: CustomSizes.SPACE_BETWEEN_SECTIONS,
                        fit: BoxFit.cover,
                        color: context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK,
                      ),
                    ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
                Text(
                  "Envoyer un message",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
                Text(
                    "By clicking on Delete button you will remove all the items on your wishList.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                // - - - - - - - - - - - - - - - - - -  BUTTONS - - - - - - - - - - - - - - - - - -  //
                Row(
                  children: [
                    Expanded(
                      child: ProductCustomElevatedBtn(
                        onPressed: (){ Get.back(); },
                        text: "Dismiss",
                        bgColor: CustomColors.GRAY_LIGHT,
                        textColor: CustomColors.BLACK,
                      ),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    Expanded(
                      child: ProductCustomElevatedBtn(
                        onPressed: () async{
                          const contact = "0624778355";
                          const text = 'Hello this item is still ??';
                          final whatAppApi = Uri.parse("https://wa.me/$contact?text=${Uri.parse(text)}");

                          try {

                            final canLaunch = await canLaunchUrl(whatAppApi);
                            if(canLaunch) { await launchUrl(whatAppApi, mode: LaunchMode.externalApplication); }
                            else { /* Show Dialog Msg */ }
                            Get.back();

                          } catch(e) {
                            /* Show Dialog Msg */
                          }
                        },
                        text: "Message",
                        bgColor: context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK,
                        textColor: context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

  // - - - - - - - - - - - - - - - - - - INSERT OR DELETE PRODUCT FROM WISHLIST - - - - - - - - - - - - - - - - - -  //
  void onUpsertToWishlist() { isInWishList.value = !isInWishList.value; }

  // - - - - - - - - - - - - - - - - - -  ADMOB - - - - - - - - - - - - - - - - - -  //
  /* ADMOB BANNER */
  void admobSetupBanner() async{
    admobBannerAd = CustomAdmob.banner(
      onAdLoaded: (Ad ad){ admobIsBannerAdLoaded.value = true; },
      onAdFailedToLoad: (Ad ad, LoadAdError loadAdError){ admobIsBannerAdLoaded.value = false; },
    );
    await admobBannerAd.load();
  }
  /* ADMOB NATIVE */
  void admobSetupNative() async{
    admobNativeAd = CustomAdmob.native(
        onAdLoaded: (Ad ad){ admobIsNativeAdLoaded.value = true; },
        onAdFailedToLoad: (Ad ad, LoadAdError load){ admobIsNativeAdLoaded.value = false; }
    );
    await admobNativeAd.load();
  }
  /* ADMOB INTERSTITIAL */
  void admobSetupInterstitial() {
    CustomAdmob.interstitial(
        onAdLoaded: (InterstitialAd ad){
          admobInterstitialAd = ad;
          admobInterstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (InterstitialAd ad){ admobInterstitialAd!.dispose(); },
            onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error){ admobInterstitialAd!.dispose(); },
          );
          admobInterstitialAd!.show();
        },
        onAdFailedToLoad: (LoadAdError loadAdError){ admobInterstitialAd!.dispose(); }
    );
  }
  /* ADMOB REWARD */
  void admobSetupReward() {
    CustomAdmob.reward(
        onAdLoaded: (RewardedAd ad){
          admobRewardedAd = ad;
          admobRewardedAd!.fullScreenContentCallback= FullScreenContentCallback(
            onAdDismissedFullScreenContent: (RewardedAd ad){ admobRewardedAd!.dispose(); },
            onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error){ admobRewardedAd!.dispose(); },
          );
          admobRewardedAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {});
        },
        onAdFailedToLoad: (LoadAdError loadAdError){ admobRewardedAd!.dispose(); }
    );
  }
  /* ADMOB REWARD INTERSTITIAL */
  void admobSetupRewardInterstitial() {
    CustomAdmob.rewardInterstitial(
        onAdLoaded: (RewardedInterstitialAd ad){
          admobRewardedInterstitialAd = ad;
          admobRewardedInterstitialAd!.fullScreenContentCallback= FullScreenContentCallback(
            onAdDismissedFullScreenContent: (RewardedInterstitialAd ad){ admobRewardedInterstitialAd!.dispose(); },
            onAdFailedToShowFullScreenContent: (RewardedInterstitialAd ad, AdError error){ admobRewardedInterstitialAd!.dispose(); },
          );
          admobRewardedInterstitialAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {});
        },
        onAdFailedToLoad: (LoadAdError loadAdError){ admobRewardedInterstitialAd!.dispose(); }
    );
  }

}