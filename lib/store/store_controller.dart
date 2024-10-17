import 'dart:io';

import 'package:alhawta/store/widgets/store_custom_elevated_btn.dart';
import 'package:alhawta/store/widgets/store_custom_text_field.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class StoreController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //
  late RxList<String> storeProducts;
  late RxBool isLoading;

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() async{
    super.onInit();
    storeProducts = RxList.empty();
    isLoading = false.obs;
    init();
  }

  // - - - - - - - - - - - - - - - - - - INIT - - - - - - - - - - - - - - - - - -  //
  init() async{
    isLoading.value = true;

    await Future.delayed(const Duration(milliseconds: 5000));
    storeProducts.value = ["A", "B", "C", "D"];
    isLoading.value = false;
  }

  // - - - - - - - - - - - - - - - - - - EDIT PRODUCT - - - - - - - - - - - - - - - - - -  //
  void onUpdateBottomSheet({required String productId, required BuildContext context}) {
    const Duration duration = Duration(milliseconds: 800);
    Get.bottomSheet(
        enableDrag: true,
        useRootNavigator: false,
        isScrollControlled: true,
        isDismissible: false,
        enterBottomSheetDuration: duration,
        exitBottomSheetDuration: duration,
        elevation: 0,
        barrierColor: CustomColors.BLACK.withOpacity(context.isDarkMode ? 0.8 : 0.6),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: CustomColors.WHITE),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(CustomSizes.SPACE_DEFAULT),
                topRight: Radius.circular(CustomSizes.SPACE_DEFAULT)
            )
        ),
        backgroundColor: context.isDarkMode ? CustomColors.BLACK :  CustomColors.WHITE,
        _bottomSheetContent(context: context)
    );
  }

  /* BOTTOM SHEET CONTENT */
  Widget _bottomSheetContent({ required BuildContext context }){

    final darkLightColor = context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK;
    final grayColor = context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK;
    final darkDarkLightLightColor = context.isDarkMode ? CustomColors.BLACK : CustomColors.WHITE;
    final greenColor = context.isDarkMode ? CustomColors.GREEN_LIGHT : CustomColors.GREEN_DARK;

    RxDouble height = 0.6.obs;
    String imgPath = "";
    bool isLoadingImage = false;

    return PopScope(
        canPop: false,
        child: Obx(
            () => AnimatedSize(
              curve: Curves.easeOutBack,
              alignment: Alignment.topLeft,
              duration: const Duration(milliseconds: 1000),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * height.value,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: CustomSizes.SPACE_DEFAULT, vertical: CustomSizes.SPACE_BETWEEN_ITEMS),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              if(height.value == 0.9) {height.value = 0.6; }
                              else {height.value = 0.9; }
                            },
                            overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                            child: AvatarGlow(glowColor: context.isDarkMode ? CustomColors.GRAY_LIGHT : CustomColors.GRAY_DARK, child: Icon(height.value == 0.9 ? Iconsax.arrow_circle_down : Iconsax.arrow_circle_up, color: context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK, size: 26)),
                          ),
                          Text("Update", style: Theme.of(context).textTheme.titleLarge),
                          InkWell(
                            onTap: (){ _bottomSheetDialog(context: context); },
                            overlayColor: MaterialStateProperty.all<Color?>(CustomColors.TRANSPARENT),
                            child: Icon(Iconsax.close_circle, color: context.isDarkMode ? CustomColors.WHITE : CustomColors.BLACK, size: 26),
                          )
                        ],
                      ),
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      InkWell(
                        onTap: (){},
                        borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                        child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: MediaQuery.of(context).size.width / 2,
                                  child: imgPath == "" ?
                                  Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                          border: Border.all(color: darkLightColor)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.cloud_upload_outlined, size: 30.0, color: darkLightColor),
                                          Text("Upload Image", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.normal, fontSize: 12)),
                                        ],
                                      )) :
                                  isLoadingImage
                                      ? Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                          border: Border.all(color: darkLightColor)),
                                      child: SizedBox(width: 30, height: 30, child: CircularProgressIndicator(color: darkLightColor, strokeWidth: 2)))
                                      : Image.file(
                                      File(imgPath),
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, url, error) =>
                                          Container(
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                                                  border: Border.all(color: darkLightColor)),
                                              child: Icon(Iconsax.image, size: 30.0, color: grayColor))
                                  ),
                                ),
                              ),
                              if(imgPath != "") Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                      padding: const EdgeInsets.all(CustomSizes.SPACE_BETWEEN_ITEMS / 3),
                                      decoration: BoxDecoration(
                                          color: darkDarkLightLightColor,
                                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(CustomSizes.SPACE_BETWEEN_ITEMS / 2))),
                                      child: Icon(
                                        Iconsax.gallery_edit,
                                        color: darkLightColor,
                                        size: 20.0,
                                      )
                                  )
                              ),
                            ]
                        ),
                      ),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                      StoreCustomTextField(
                        controller: TextEditingController(),
                        hint: "Title",
                        icon: Iconsax.text,
                        validator: (value) => null,
                        maxLength: 30,
                      ),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                      StoreCustomTextField(
                        controller: TextEditingController(),
                        hint: "Description",
                        validator: (value) => null,
                        minMaxLines: 3,
                        maxLength: 90,
                      ),
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      /* CATEGORY + SIZE + VILLE */
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      /* PHONE NUMBER */
                      const SizedBox(height: CustomSizes.SPACE_DEFAULT),
                      StoreCustomElevatedBtn(onPressed: (){}, bgColor: greenColor, text: "Validate"),
                      const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }

  /* BOTTOM SHEET DIALOG */
  void _bottomSheetDialog({ required BuildContext context }) async{
    await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext innerContext) => PopScope(
        canPop: false,
        child: AlertDialog(
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
                  "Are You Sure",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
                Text(
                  "By clicking on Exit button you will remove all your updates.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
                  textAlign: TextAlign.center,
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

                Row(
                  children: [
                    Expanded(
                      child: StoreCustomElevatedBtn(
                        onPressed: (){ Get.back(); /* CLOSE DIALOG */ },
                        text: "Dismiss",
                        bgColor: CustomColors.GRAY_LIGHT,
                      ),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    Expanded(
                      child: StoreCustomElevatedBtn(
                        onPressed: () async {
                          Get.back(); /* CLOSE DIALOG */
                          await Future.delayed(const Duration(milliseconds: 500)); /* HOLD HALF SECOND */
                          Get.back(); /* CLOSE BOTTOM SHEET */
                        },
                        text: "Exit",
                        textColor: CustomColors.WHITE,
                        bgColor: CustomColors.RED_DARK,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
              ],
            ),
          ),
        )
    ));
  }

}