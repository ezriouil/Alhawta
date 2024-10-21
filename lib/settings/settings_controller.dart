import 'package:alhawta/settings/widgets/settings_custom_elevated_btn.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxBool switchBtnEnableArabicLang, switchBtnEnableDarkTheme, switchBtnEnableHideLoginScreen;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
    switchBtnEnableArabicLang = false.obs;
    switchBtnEnableDarkTheme = false.obs;
    switchBtnEnableHideLoginScreen = false.obs;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE TO ARABIC LANG SWITCH BTN - - - - - - - - - - - - - - - - - -  //
  void onUpdateLanguageColor(bool value){
    switchBtnEnableArabicLang.value = value;
  }

  // - - - - - - - - - - - - - - - - - - UPDATE THEME SWITCH BTN - - - - - - - - - - - - - - - - - -  //
  void onUpdateThemeColor(bool value){
    switchBtnEnableDarkTheme.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  // - - - - - - - - - - - - - - - - - - UPDATE HIDE LOGIN SWITCH BTN - - - - - - - - - - - - - - - - - -  //
  void onUpdateHideLogin(bool value){
    switchBtnEnableHideLoginScreen.value = value;
  }

  // - - - - - - - - - - - - - - - - - - DELETE ACCOUNT - - - - - - - - - - - - - - - - - -  //
  void onDeleteAccount(BuildContext context) async{
    await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext innerContext) => AlertDialog(
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),

            // - - - - - - - - - - - - - - - - - - ICON - - - - - - - - - - - - - - - - - -  //
            Container(
              width: CustomSizes.SPACE_BETWEEN_SECTIONS * 2,
              height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS),
                color: context.isDarkMode ? CustomColors.RED_LIGHT.withOpacity(0.2) : CustomColors.RED_DARK.withOpacity(0.2),
              ),
              child: AvatarGlow(
                glowCount: 3,
                glowColor: context.isDarkMode ? CustomColors.RED_LIGHT.withOpacity(0.1) : CustomColors.RED_DARK.withOpacity(0.1),
                glowRadiusFactor: 0.2,
                child: Icon(
                    Iconsax.profile_delete,
                    size: CustomSizes.SPACE_BETWEEN_SECTIONS,
                    color: context.isDarkMode ? CustomColors.RED_LIGHT : CustomColors.RED_DARK
                ),
              ),
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),

            // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
            Text(
              "Delete Account",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
            Text(
                "By clicking on Delete button you will remove your account completely.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
              textAlign: TextAlign.center,
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
            Row(
              children: [
                Expanded(
                  child: SettingsCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Dismiss",
                      bgColor: context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK

                  ),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                  child: SettingsCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Delete",
                    bgColor: context. isDarkMode ? CustomColors.RED_LIGHT : CustomColors.RED_DARK,
                  ),
                ),
              ],
            ),
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          ],
        ),
      ),
    )
    );
  }

  // - - - - - - - - - - - - - - - - - - DE CONNECTED - - - - - - - - - - - - - - - - - -  //
  void onDeConnected(BuildContext context) async{
    await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext innerContext) => AlertDialog(
      content: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),

            // - - - - - - - - - - - - - - - - - - ICON - - - - - - - - - - - - - - - - - -  //
            Container(
              width: CustomSizes.SPACE_BETWEEN_SECTIONS * 2,
              height: CustomSizes.SPACE_BETWEEN_SECTIONS * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_SECTIONS),
                color: context.isDarkMode ? CustomColors.RED_LIGHT.withOpacity(0.2) : CustomColors.RED_DARK.withOpacity(0.2),
              ),
              child: AvatarGlow(
                glowCount: 3,
                glowColor: context.isDarkMode ? CustomColors.RED_LIGHT.withOpacity(0.1) : CustomColors.RED_DARK.withOpacity(0.1),
                glowRadiusFactor: 0.2,
                child: Icon(
                    Iconsax.close_circle,
                    size: CustomSizes.SPACE_BETWEEN_SECTIONS,
                    color: context.isDarkMode ? CustomColors.RED_LIGHT : CustomColors.RED_DARK
                ),
              ),
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),

            // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
            Text(
              "De Connected",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold")
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
            Text(
                "By clicking on Delete button you will de connected automatically.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
              textAlign: TextAlign.center,
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

            Row(
              children: [
                Expanded(
                  child: SettingsCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Dismiss",
                    bgColor: context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK
                  ),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                  child: SettingsCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "De connected",
                    bgColor: context.isDarkMode ? CustomColors.RED_LIGHT : CustomColors.RED_DARK,
                  ),
                ),
              ],
            ),

            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 4),
          ],
        ),
      ),
    ));
  }

  void onSubscription(BuildContext context) {
    Get.defaultDialog();
  }
}