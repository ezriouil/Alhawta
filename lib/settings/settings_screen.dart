import 'package:alhawta/index/index_controller.dart';
import 'package:alhawta/new_product/new_product_screen.dart';
import 'package:alhawta/profile/profile_screen.dart';
import 'package:alhawta/settings/widgets/settings_custom_tile.dart';
import 'package:alhawta/store/store_screen.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'settings_controller.dart';

class SettingsScreen extends CustomState {
  const SettingsScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final SettingsController controller = Get.find<SettingsController>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Back", style: Theme.of(context).textTheme.titleLarge),
          centerTitle: false,
          titleSpacing: 0.0,
          leading: InkWell(
              overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
              onTap: (){ IndexController.currentIndex.value = 0; },
              child: const Icon(Iconsax.arrow_left_3)
          ),
          actions: [
            InkWell(
                onTap: (){ controller.onSubscription(context); },
                overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
                child: AvatarGlow(
                  glowColor: greenColor(context),
                  glowCount: 3,
                  glowRadiusFactor: 0.5,
                  child: Icon(
                    Icons.diamond,
                    color: darkLightColor(context),
                    size: 22,
                  ),
                )),
            const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_BETWEEN_ITEMS),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                InkWell(
                  onTap: (){ Get.to( () => const ProfileScreen(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 800), curve: Curves.fastOutSlowIn ); },
                  overlayColor: MaterialStateProperty.all<Color>(CustomColors.TRANSPARENT),
                  child: ListTile(
                    leading: ClipRRect(
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS),
                        child: CachedNetworkImage(
                          imageUrl:  "https://i.ytimg.com/vi/g8rZD5v4MtU/hqdefault.jpg?sqp=-oaymwEjCNACELwBSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLCkWIFsOz6A_ZatiYFePH6OWDx4Rg",
                          height: 55,
                          width: 55,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, downloadProgress){
                            return Container(
                                height: 55,
                                width: 55,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border.all(color: grayColor(context)),
                                    borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS)
                                ),
                                child: SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 1, color: darkLightColor(context), backgroundColor: grayColor(context), value: downloadProgress.progress))
                            );
                          },
                          errorWidget: (context, url, error) => Container(
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                  border: Border.all(color: grayColor(context)),
                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS)),
                              child: Icon(Iconsax.gallery_remove, size: 20.0, color: grayColor(context))),
                        )
                    ),
                    contentPadding: EdgeInsets.zero,
                    title: Text("Mohamed Ezriouil", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Semi_Bold")),
                    subtitle: Text("Mohamedezriouil@gmail.com", overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11)),
                    trailing: Icon(Iconsax.more_2, color: grayColor(context)),
                  ),
                ),

                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                Text("Store", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Bold", letterSpacing: 0)),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - - NEW PRODUCT - - - - - - - - - - - - - - - - - -  //
                SettingsCustomTile(
                    title: "New Product",
                    subTitle: "add new product to your store.",
                    icon: Iconsax.add_circle,
                    trailing: Icon(Iconsax.arrow_right_3, color: greenColor(context)),
                    onClick: (){ Get.to( ()  => const NewProductScreen(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 800), curve: Curves.fastOutSlowIn); }
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - - ALL PRODUCTS - - - - - - - - - - - - - - - - - -  //
                SettingsCustomTile(
                    title: "My Store",
                    subTitle: "see all product of my store.",
                    icon: Iconsax.shop,
                    trailing: Icon(Iconsax.arrow_right_3, color: greenColor(context)),
                    onClick: (){ Get.to( ()  => const StoreScreen(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 800), curve: Curves.fastOutSlowIn); }
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                Text("Display", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Bold", letterSpacing: 0)),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - - SWITCH THEME - - - - - - - - - - - - - - - - - -  //
                Obx(
                      ()=> SettingsCustomTile(
                      title: "Update Theme",
                      subTitle: "Try new theme designed for you.",
                      icon: Iconsax.colorfilter, onClick: () {  },
                      trailing: Switch(
                        value: controller.switchBtnEnableDarkTheme.value,
                        onChanged: controller.onUpdateThemeColor,
                        activeColor: greenColor(context),
                      )
                  ),
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                // - - - - - - - - - - - - - - - - - - SWITCH ARABIC LANG - - - - - - - - - - - - - - - - - -  //
                Obx(
                      ()=> SettingsCustomTile(
                      title: "Arabic Language",
                      subTitle: "Chooses your prefer language between Arabic and French.",
                      icon: Iconsax.translate, onClick: () {  },
                      trailing: Switch(
                        value: controller.switchBtnEnableArabicLang.value,
                        onChanged: controller.onUpdateLanguageColor,
                        activeColor: greenColor(context),
                      )
                  ),
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),

                // - - - - - - - - - - - - - - - - - - SWITCH HIDE LOGIN - - - - - - - - - - - - - - - - - -  //
                Obx(
                      ()=> SettingsCustomTile(
                      title: "Hide Login",
                      subTitle: "login automatically into home screen.",
                      icon: Iconsax.lock, onClick: () {  },
                      trailing: Switch(
                        value: controller.switchBtnEnableHideLoginScreen.value,
                        onChanged: controller.onUpdateHideLogin,
                        activeColor: greenColor(context),
                      )
                  ),
                ),

                const SizedBox(height: CustomSizes.SPACE_DEFAULT),

                Text("Others", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontFamily: "Pop_Bold", letterSpacing: 0)),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - - PRIVACY AND SECURITY - - - - - - - - - - - - - - - - - -  //
                SettingsCustomTile(
                    title: "Privacy And Security",
                    subTitle: "See our privacy and security.",
                    icon: Iconsax.security_safe,
                    trailing: Icon(Iconsax.arrow_right_3, color: greenColor(context)), onClick: (){}
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - - ABOUT - - - - - - - - - - - - - - - - - -  //
                SettingsCustomTile(
                    title: "About us",
                    subTitle: "Information about application.",
                    icon: Iconsax.information,
                    trailing: Icon(Iconsax.arrow_right_3, color: greenColor(context)), onClick: (){}
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - - ABOUT - - - - - - - - - - - - - - - - - -  //
                SettingsCustomTile(
                    title: "Share Application",
                    subTitle: "Share the application with your friends.",
                    icon: Iconsax.share,
                    trailing: Icon(Iconsax.arrow_right_3, color: greenColor(context)), onClick: (){}
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - - DE CONNECTED - - - - - - - - - - - - - - - - - -  //
                SettingsCustomTile(
                    title: "De Connected",
                    subTitle: "Close your account direction to login screen.",
                    icon: Iconsax.close_circle,
                    trailing: Icon(Iconsax.arrow_right_3, color: greenColor(context)),
                    onClick: (){ controller.onDeConnected(context); }
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - - DELETE ACCOUNT - - - - - - - - - - - - - - - - - -  //
                SettingsCustomTile(
                    title: "Delete Account",
                    subTitle: "Attention your account will deleted completely.",
                    icon: Iconsax.profile_delete,
                    leadingIconColor: redColor(context),
                    trailing: Icon(Iconsax.arrow_right_3, color: redColor(context)),
                    onClick: (){ controller.onDeleteAccount(context); }
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                Center(child: Text("Version 1.0.0", style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12, letterSpacing: 0))),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS * 3)
              ],
          ),
        ),
      )
    );
  }
}
