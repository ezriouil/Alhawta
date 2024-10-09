import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/wishlist/widgets/wishlist_custom_elevated_btn.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishListController extends GetxController {

  // - - - - - - - - - - - - - - - - - - CREATE STATES - - - - - - - - - - - - - - - - - -  //

  // - - - - - - - - - - - - - - - - - - INIT STATES - - - - - - - - - - - - - - - - - -  //
  @override
  void onInit() {
    super.onInit();
  }

  // - - - - - - - - - - - - - - - - - - DELETE PRODUCT - - - - - - - - - - - - - - - - - -  //
  void onDeleteProduct({ required BuildContext context }) async{
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
                    Iconsax.trash,
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
                "By clicking on Delete button you will remove the item from your wishList.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
              textAlign: TextAlign.center,
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),

            Row(
              children: [
                Expanded(
                  child: WishListCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Dismiss",
                    bgColor: CustomColors.GRAY_LIGHT,
                  ),
                ),
                const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                Expanded(
                  child: WishListCustomElevatedBtn(
                    onPressed: (){ Get.back(); },
                    text: "Delete",
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
    );

  }

  // - - - - - - - - - - - - - - - - - - DELETE PRODUCT - - - - - - - - - - - - - - - - - -  //
  void onDeleteAllProducts({ required BuildContext context }) async{
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
                        Iconsax.trash,
                        size: CustomSizes.SPACE_BETWEEN_SECTIONS,
                        color: context.isDarkMode ? CustomColors.RED_LIGHT : CustomColors.RED_DARK
                    ),
                  ),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT * 2),

                // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
                Text(
                  "Delete All",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
                Text(
                  "By clicking on Delete button you will remove all the items on your wishList.",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
                  textAlign: TextAlign.center,
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_SECTIONS),
                Row(
                  children: [
                    Expanded(
                      child: WishListCustomElevatedBtn(
                        onPressed: (){ Get.back(); },
                        text: "Dismiss",
                        bgColor: CustomColors.GRAY_LIGHT,
                      ),
                    ),
                    const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS / 2),
                    Expanded(
                      child: WishListCustomElevatedBtn(
                        onPressed: (){ Get.back(); },
                        text: "Delete",
                        bgColor: context.isDarkMode ? CustomColors.RED_LIGHT: CustomColors.RED_DARK,
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
}