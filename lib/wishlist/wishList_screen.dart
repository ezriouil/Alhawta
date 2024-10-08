import 'package:alhawta/index/index_controller.dart';
import 'package:alhawta/utils/constants/custom_colors.dart';
import 'package:alhawta/utils/constants/custom_sizes.dart';
import 'package:alhawta/utils/state/custom_state.dart';
import 'package:alhawta/wishlist/widgets/wishList_custom_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'wishList_controller.dart';

class WishListScreen extends CustomState {
  const WishListScreen({super.key});

  @override
  Widget execute(BuildContext context) {
    final WishListController controller = Get.find<WishListController>();
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
              onTap: (){ controller.onDeleteAllProducts(context: context); },
              overlayColor: MaterialStateProperty.all(CustomColors.TRANSPARENT),
              child: Icon(
                Iconsax.trash,
                color: darkLightColor(context),
                size: 20,
              )),
          const SizedBox(width: CustomSizes.SPACE_BETWEEN_ITEMS)
        ],
      ),
      body: ListView.builder(
          itemCount: 8,
          padding: const EdgeInsets.only(
            right: CustomSizes.SPACE_BETWEEN_ITEMS,
            left: CustomSizes.SPACE_BETWEEN_ITEMS,
            bottom: CustomSizes.SPACE_BETWEEN_SECTIONS * 3,
          ),
          itemBuilder: (BuildContext context, int index) =>
              WishListCustomProduct(
                src: 'https://yourdesignstore.s3.amazonaws.com/uploads/yds/productImages/thumb/17119587213301Main-Product-Image.jpg',
                title: "Jacket noir",
                description: "Jacket noir black size 23 more data should you check out our website.",
                onView: (){},
                onDelete: (){ controller.onDeleteProduct(context: context); },
              )),
    );
  }
}
