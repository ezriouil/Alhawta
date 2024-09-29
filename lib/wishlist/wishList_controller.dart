import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/wishlist/widgets/wishList_custom_elevated_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

            // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
            Text(
              "Are You Sure",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

            // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
            Text(
                "By clicking on Delete button you will remove the item from your wishList.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)
            ),

            // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
            const SizedBox(height: CustomSizes.SPACE_DEFAULT),
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
                    bgColor: CustomColors.GREEN_DARK,
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
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS / 2),

                // - - - - - - - - - - - - - - - - - -  TITLE - - - - - - - - - - - - - - - - - -  //
                Text(
                  "Delete All",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(letterSpacing: 0.6, fontFamily: "Pop_Semi_Bold"),
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_BETWEEN_ITEMS),

                // - - - - - - - - - - - - - - - - - -  SUB TITLE 1 - - - - - - - - - - - - - - - - - -  //
                Text(
                    "By clicking on Delete button you will remove all the items on your wishList.",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12)
                ),

                // - - - - - - - - - - - - - - - - - -  SPACER - - - - - - - - - - - - - - - - - -  //
                const SizedBox(height: CustomSizes.SPACE_DEFAULT),
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
                        bgColor: CustomColors.GREEN_DARK,
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