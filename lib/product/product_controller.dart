import 'package:alhawta/product/widgets/product_custom_elevated_btn.dart';
import 'package:alhawta/utils/ads/custom_admob.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_images.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxBool isInWishList, isBannerAdLoaded;
  late BannerAd bannerAd;
  late InterstitialAd? interstitialAd;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() async{
    super.onInit();
    isInWishList = false.obs;
    isBannerAdLoaded = false.obs;
    interstitialAd = null;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async{

    bannerAd = CustomAdmob.banner(
      onAdFailedToLoad: (Ad ad, LoadAdError loadAdError){ isBannerAdLoaded.value = false; },
      onAdLoaded: (Ad ad){ isBannerAdLoaded.value = true; },
    );
    await bannerAd.load();

    CustomAdmob.interstitial(
        onAdLoaded: (InterstitialAd ad){ interstitialAd = ad; },
        onAdFailedToLoad: (LoadAdError loadAdError){ interstitialAd = null; }
    );

  }

  // - - - - - - - - - - - - - - - - - -  CONTACT VIA WHATSAPP - - - - - - - - - - - - - - - - - -  //
  void onContact({ required BuildContext context }) async {

    if(interstitialAd == null) return;
    interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (InterstitialAd ad){CustomAdmob.interstitial(
          onAdLoaded: (InterstitialAd ad){ interstitialAd = ad; },
          onAdFailedToLoad: (LoadAdError loadAdError){ interstitialAd = null; }
      );},
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error){CustomAdmob.interstitial(
          onAdLoaded: (InterstitialAd ad){ interstitialAd = ad; },
          onAdFailedToLoad: (LoadAdError loadAdError){ interstitialAd = null; }
      );},
    );
    interstitialAd!.show();

    await showDialog(
        context: context,
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

}