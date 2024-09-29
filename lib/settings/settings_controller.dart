import 'package:alhawta/settings/widgets/settings_custom_elevated_btn.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
            Text(
              "Delete Account",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
            Text(
                "By clicking on Delete button you will remove your account completely.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Row(
              children: [
                Expanded(
                  child: SettingsCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Dismiss",
                    bgColor: CustomColors.GRAY_LIGHT,

                  ),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                  child: SettingsCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Delete",
                    bgColor: CustomColors.RED_DARK,
                    textColor: CustomColors.WHITE,
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
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
            Text(
              "De Connected",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
            Text(
                "By clicking on Delete button you will de connected automatically.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
            Row(
              children: [
                Expanded(
                  child: SettingsCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Dismiss",
                    bgColor: CustomColors.GRAY_LIGHT,

                  ),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                  child: SettingsCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "De connected",
                    bgColor: CustomColors.RED_DARK,
                    textColor: CustomColors.WHITE,
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

}